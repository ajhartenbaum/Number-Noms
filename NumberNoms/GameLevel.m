//
//  GameLevel.m
//  NumberNoms
//
//  Created by Anthony Taormina on 5/14/13.
//
//

#import "GameLevel.h"

#define EASY

#ifdef EASY
#define NUM_TO_SPAWN 4
#endif

#ifdef MEDIUM
#define NUM_TO_SPAWN 7
#endif

#ifdef HARD
#define NUM_TO_SPAWN 10
#endif

#ifndef NUM_TO_SPAWN
#define NUM_TO_SPAWN 7
#endif

@implementation GameLevel

int next, grabbed;

- (void) caughtShip:(CatchEscapePod*)pod
{
    if([pod getMyNumber] == currentTarget) {
        CGPoint shipPos = [pod getPos];
        [[GameScene sharedScene] gotShipNumber:[pod getMyNumber] startAtX:shipPos.x startAtY:shipPos.y];
        
        [pod collectThisShip];
        [entryQueue addObject:pod];
        [self removeChild:pod cleanup:false];
        currentTarget++;
    } else {
        // Make them lose
        next = currentTarget;
        grabbed = [pod getMyNumber];
        [[GameScene sharedScene] handleGameOver];
    }
}

- (CCNode*) pop: (NSMutableArray*) queue
{
    if (![queue count]) return nil;
    
    CCNode* head = [queue objectAtIndex:0];
    if (head != nil) {
        [[head retain] autorelease];
        [queue removeObjectAtIndex:0];
    }
    return head;
}
//
//- (void) onEnter
//{
//    [super onEnter];
//    
//    currentTarget = 1;
//    
//    // Schedule a selector that is called every frame
//    [self schedule:@selector(update:)];
//    
//    // Make sure touches are enabled
//    self.isTouchEnabled = YES;
//    
//    sprite = [[ThiefSprite alloc] init];
//    [self addChild:sprite];
//    
//    //timer = [NSTimer scheduledTimerWithTimeInterval:2 target:self selector:@selector(handleTimer:) userInfo:nil repeats:YES];
//    escapePodArray = [[NSMutableArray alloc] initWithCapacity:NUM_TO_SPAWN];
//    entryQueue = [[NSMutableArray alloc] initWithCapacity:NUM_TO_SPAWN];
//    
//    for (int i = 1; i <= NUM_TO_SPAWN; i++)
//    {
//        CatchEscapePod* cep = [[CatchEscapePod alloc] init];
//        [cep setLabel:i];
//        //[self addChild:cep];
//        [escapePodArray addObject:cep];
//        [entryQueue addObject:cep];
//    }
//    
//    [self addChild:[self pop:entryQueue]];
//    // CatchSheep *ep1 = nil;
//    
//    int shipRadius = [entryQueue[0] radius];
//    entryPoint = ccp(shipRadius + 240, shipRadius);
//}
//
- (void) onExit
{
    [super onExit];
    
    // Remove the scheduled selector
    [self unscheduleAllSelectors];
}

- (void) update:(ccTime)delta
{
    [[GameScene sharedScene] moveIncoming];
    
    if( [[GameScene sharedScene] getGameIsInPlay] == NO ) {
        return;
    }
    
    // Iterate through all objects in the level layer
    CCNode* child;
    Boolean entryZoneClear = true;
    CCARRAY_FOREACH(self.children, child)
    {
        // Check if the child is a game object
        if ([child isKindOfClass:[GameObject class]])
        {
            GameObject* gameObject = (GameObject*)child;
            
            // Update all game objects
            [gameObject update];
            
            if (ccpDistance([gameObject getCenter], entryPoint) < (gameObject.radius * 4)) //TODO Should be 2, but radius needs fixed
            {
                entryZoneClear = false;
            }
            
            if ([child isKindOfClass:[CatchEscapePod class]]) {
                CatchEscapePod* escapePod = (CatchEscapePod*)gameObject;
                
                
                if (ccpDistance([escapePod getCenter], sprite.position) < (escapePod.radius + sprite.radius))
                {
                    [self caughtShip:escapePod];
                }
                
                if (escapePod.position.x + escapePod.radius * 2 > 1028 &&
                    [escapePod getXSpeed] > 0.0)
                {
                    [escapePod xSpeedReverse];
                }
                if ((escapePod.position.x) < 240 &&
                    [escapePod getXSpeed] < 0.0)
                {
                    [escapePod xSpeedReverse];
                }
                
                if (escapePod.position.y + escapePod.radius * 2 > 768 &&
                    [escapePod getYSpeed] > 0.0)
                {
                    [escapePod ySpeedReverse];
                }
                if (escapePod.position.y < 0 &&
                    [escapePod getYSpeed] < 0.0)
                {
                    [escapePod ySpeedReverse];
                }
            }
        }
    }
    
    for (int i = 0; i < [self.children count]; i++)
    {
        GameObject* current = [self.children objectAtIndex:i];
        if ([current isKindOfClass:[CatchEscapePod class]]) {
            CatchEscapePod *currentPod = (CatchEscapePod*) current;
            for (int j = i+1; j < [self.children count]; j++)
            {
                GameObject* nextObj = [self.children objectAtIndex:j];
                if ([nextObj isKindOfClass:[CatchEscapePod class]])
                {
                    CatchEscapePod* nextPod = (CatchEscapePod*) nextObj;
                    if (ccpDistance([currentPod getCenter], [nextPod getCenter]) < (currentPod.radius * 2))
                    {
                        float xSpeed = (abs([currentPod getXSpeed]) + abs([nextPod getXSpeed])) / 2;
                        float ySpeed = (abs([currentPod getYSpeed]) + abs([nextPod getYSpeed])) / 2;
                        
                        if (xSpeed < .75) xSpeed = 1;
                        if (ySpeed < .75) ySpeed = 1;
                        
                        Boolean currIsAbove = currentPod.position.y > nextPod.position.y;
                        Boolean currIsRight = currentPod.position.x > nextPod.position.x;
                        
                        if (currIsAbove && currIsRight)
                        {
                            [currentPod newSpeed:xSpeed :ySpeed];
                            [nextPod newSpeed:-xSpeed :-ySpeed];
                        }
                        else if (!currIsAbove && currIsRight)
                        {
                            [currentPod newSpeed:xSpeed :-ySpeed];
                            [nextPod newSpeed:-xSpeed :ySpeed];
                        }
                        else if (currIsAbove && !currIsRight)
                        {
                            [currentPod newSpeed:-xSpeed :ySpeed];
                            [nextPod newSpeed:xSpeed :-ySpeed];
                        }
                        else
                        {
                            [currentPod newSpeed:-xSpeed :-ySpeed];
                            [nextPod newSpeed:xSpeed :ySpeed];
                        }
                    }
                }
            }
        }
    }
    
    if (entryZoneClear && [entryQueue count]) {
        [self addChild:[self pop:entryQueue]];
    }
    
    // Check for objects to remove
    NSMutableArray* gameObjectsToRemove = [NSMutableArray array];
    CCARRAY_FOREACH(self.children, child)
    {
        if ([child isKindOfClass:[GameObject class]])
        {
            GameObject* gameObject = (GameObject*)child;
            
            if (gameObject.isScheduledForRemove)
            {
                [gameObjectsToRemove addObject:gameObject];
            }
        }
    }
    
    for (GameObject* gameObject in gameObjectsToRemove)
    {
        [self removeChild:gameObject cleanup:YES];
    }
}

- (void) ccTouchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    UITouch* touch = [touches anyObject];
    CGPoint touchLocation = [touch locationInView: [touch view]];
    
    float fixedX = touchLocation.x;
    if(fixedX < 250.0) {
        fixedX = 250.0;
    }
    [sprite setXTarget:fixedX];
    
    CGSize s = [[CCDirector sharedDirector] winSize];
    [sprite setYTarget:-touchLocation.y+s.height];
}

- (void) ccTouchesMoved:(NSSet *)touches withEvent:(UIEvent *)event
{
    [self ccTouchesBegan:touches withEvent:event];
}

@end

//
//  SpaceLevel.m
//  NumberNoms
//
//  Created by Alissa Hartenbaum on 2/12/13.
//
//

#import "GameScene.h"
#import "SpaceLevel.h"
#import "Catchable.h"
#import "CatchEscapePod.h"
#import "ThiefSprite.h"
#import "GameObject.h"
//#import "CatchSheep.h"

#define NUM_TO_SPAWN 10

@implementation SpaceLevel

@synthesize escapePodArray;

NSMutableArray *entryQueue;
NSTimer *timer;
ThiefSprite* thfspr;
int makeVisibleThisOne = 1;
CGPoint entryPoint;

- (void) handleTimer:(NSTimer *) theTimer
{
}

- (void) caughtShip:(CatchEscapePod*)pod
{    
    if([pod getMyNumber] == makeVisibleThisOne) {
        CGPoint shipPos = [pod getPos];
        [[GameScene sharedScene] gotShipNumber:[pod getMyNumber] startAtX:shipPos.x startAtY:shipPos.y];
            
        [pod collectThisShip];
        [entryQueue addObject:pod];
        [self removeChild:pod cleanup:false];
        makeVisibleThisOne++;
    } else {
        // Make them lose
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

- (void) onEnter
{
    [super onEnter];
    
    makeVisibleThisOne = 1;
    
    // Schedule a selector that is called every frame
    [self schedule:@selector(update:)];
    
    // Make sure touches are enabled
    self.isTouchEnabled = YES;
    
    thfspr = [[ThiefSprite alloc] init];
    [self addChild:thfspr];
    
    //timer = [NSTimer scheduledTimerWithTimeInterval:2 target:self selector:@selector(handleTimer:) userInfo:nil repeats:YES];
    escapePodArray = [[NSMutableArray alloc] initWithCapacity:10];
    entryQueue = [[NSMutableArray alloc] initWithCapacity:10];    
    
    for (int i = 1; i <= NUM_TO_SPAWN; i++)
    {
        CatchEscapePod* cep = [[CatchEscapePod alloc] init];
        [cep setLabel:i];
        //[self addChild:cep];
        [escapePodArray addObject:cep];
        [entryQueue addObject:cep];
    }
    
    [self addChild:[self pop:entryQueue]];
    // CatchSheep *ep1 = nil;
    
    int shipRadius = [entryQueue[0] radius];
    entryPoint = ccp(shipRadius + 240, shipRadius);
}

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
                
                
                if (ccpDistance([escapePod getCenter], thfspr.position) < (escapePod.radius + thfspr.radius))
                {
                    [self caughtShip:escapePod];
                }
                
                if (((escapePod.position.x + escapePod.radius * 2) > 1028) || ((escapePod.position.x) < 240))
                {
                    [escapePod xSpeedReverse];
                }
                else if (((escapePod.position.y + escapePod.radius * 2) > 768) || ((escapePod.position.y) < 0))
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
                GameObject* next = [self.children objectAtIndex:j];
                if ([next isKindOfClass:[CatchEscapePod class]])
                {
                    CatchEscapePod* nextPod = (CatchEscapePod*) next;
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
    
    // Adjust the position of the layer so dragon is visible
    //float yTarget = kCJDragonTargetOffset - dragon.position.y;
     //CGPoint oldLayerPosition = self.position;
     
     //float xNew = oldLayerPosition.x;
     //float yNew = yTarget * kCJScrollFilterFactor + oldLayerPosition.y * (1.0f - kCJScrollFilterFactor);
     
     //self.position = ccp(xNew, yNew);
}

- (void) ccTouchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    UITouch* touch = [touches anyObject];
    CGPoint touchLocation = [touch locationInView: [touch view]];
    
    float fixedX = touchLocation.x;
    if(fixedX < 250.0) {
        fixedX = 250.0;
    }
    [thfspr setXTarget:fixedX];

    CGSize s = [[CCDirector sharedDirector] winSize];
    [thfspr setYTarget:-touchLocation.y+s.height];
    // NSLog(@"%f,%f",touchLocation.x,touchLocation.y);
    
   /* dragon.xTarget = touchLocation.x;
    dragon.yTarget = touchLocation.y;*/
}

- (void) ccTouchesMoved:(NSSet *)touches withEvent:(UIEvent *)event
{
    UITouch* touch = [touches anyObject];
    CGPoint touchLocation = [touch locationInView: [touch view]];
    
   /* dragon.xTarget = touchLocation.x;
    dragon.yTarget = touchLocation.y;*/
}

@end

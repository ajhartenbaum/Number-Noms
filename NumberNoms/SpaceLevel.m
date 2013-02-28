//
//  SpaceLevel.m
//  NumberNoms
//
//  Created by Alissa Hartenbaum on 2/12/13.
//
//

#import "SpaceLevel.h"
#import "Catchable.h"
#import "CatchEscapePod.h"
#import "ThiefSprite.h"
#import "GameObject.h"
//#import "CatchSheep.h"

#define NUM_TO_SPAWN 10

@implementation SpaceLevel

ThiefSprite* thfspr;

- (void) onEnter
{
    [super onEnter];
    
    // Schedule a selector that is called every frame
    [self schedule:@selector(update:)];
    
    // Make sure touches are enabled
    self.isTouchEnabled = YES;
    
    for (int i = 1; i <= NUM_TO_SPAWN; i++)
    {
        CatchEscapePod* cep = [[CatchEscapePod alloc] init];
        [cep setLabel:i];
        [self addChild:cep];
    }
    
    thfspr = [[ThiefSprite alloc] init];
    [self addChild:thfspr];
    
    // CatchSheep *ep1 = nil;
    
}

- (void) onExit
{
    [super onExit];
    
    // Remove the scheduled selector
    [self unscheduleAllSelectors];
}

- (void) update:(ccTime)delta
{
    // Iterate through all objects in the level layer
    CCNode* child;
    CCARRAY_FOREACH(self.children, child)
    {
        // Check if the child is a game object
        if ([child isKindOfClass:[GameObject class]])
        {
            GameObject* gameObject = (GameObject*)child;
            
            // Update all game objects
            [gameObject update];
            
            if ([child isKindOfClass:[CatchEscapePod class]]) {
                CatchEscapePod* escapePod = (CatchEscapePod*)gameObject;
                if (((escapePod.position.x + escapePod.radius * 2) > 804) || ((escapePod.position.x) < 0))
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
    
    [thfspr setXTarget:touchLocation.x-250.0];

    CGSize s = [[CCDirector sharedDirector] winSize];
    [thfspr setYTarget:-touchLocation.y+s.height];
    NSLog(@"%f,%f",touchLocation.x,touchLocation.y);
    
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

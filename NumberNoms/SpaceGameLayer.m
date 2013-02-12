//
//  SpaceGameLevel.m
//  NumberNoms
//
//  Created by Alissa Hartenbaum on 2/11/13.
//
//

#import "SpaceGameLayer.h"
#import "GameObject.h"
#import "CCBReader.h"

static SpaceGameLayer* sharedScene;

@implementation SpaceGameLayer

@synthesize score;

+ (SpaceGameLayer*) sharedScene
{
    return sharedScene;
}

- (void) didLoadFromCCB
{
    sharedScene = self;
    
    self.score = 0;
    
    // Load the level
    //level = [CCBReader nodeGraphFromFile:@"Level.ccbi"];
    
    // And add it to the game scene
   // [levelLayer addChild:level];
}

- (void) setScore:(int)s
{
    score = s;
    [scoreLabel setString:[NSString stringWithFormat:@"%d",s]];
}

- (void) handleGameOver
{
    [[CCDirector sharedDirector] replaceScene:[CCBReader sceneWithNodeGraphFromFile:@"MainMenu2Scene.ccbi"]];
}

- (void) handleLevelComplete
{
    [[CCDirector sharedDirector] replaceScene:[CCBReader sceneWithNodeGraphFromFile:@"MainMenu2Scene.ccbi"]];
}


//WHAT WAS IN LEVEL FILE FOR TUTORIAL

- (void) onEnter
{
    [super onEnter];
    
    // Schedule a selector that is called every frame
    [self schedule:@selector(update:)];
    
    // Make sure touches are enabled
    self.isTouchEnabled = YES;
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
        if ([child isKindOfClass:[SpaceGameLayer class]])
        {
            SpaceGameLayer* spaceGameLayer = (SpaceGameLayer*)child;
            
            // Update all game objects
            [spaceGameLayer update];
        /*
            // Check for collisions with dragon
            if (spaceGameLayer != playerRocket)
            {
                if (ccpDistance(gameObject.position, dragon.position) < spaceGameLayer.radius + dragon.radius)
                {
                    // Notify the game objects that they have collided
                    [spaceGameLayer handleCollisionWith:playerRocket];
                    [playerRocket handleCollisionWith:gameObject];
                }
            }*/
        }
    }
    
    // Check for objects to remove
    NSMutableArray* gameObjectsToRemove = [NSMutableArray array];
    CCARRAY_FOREACH(self.children, child)
    {
        /*if ([child isKindOfClass:[GameObject class]])
        {
            GameObject* gameObject = (GameObject*)child;
            
            if (gameObject.isScheduledForRemove)
            {
                [gameObjectsToRemove addObject:gameObject];
            }
        }*/
    }
    
    for (GameObject* gameObject in gameObjectsToRemove)
    {
        [self removeChild:gameObject cleanup:YES];
    }
    
    // Adjust the position of the layer so dragon is visible
    /*float yTarget = kCJDragonTargetOffset - dragon.position.y;
     CGPoint oldLayerPosition = self.position;
     
     float xNew = oldLayerPosition.x;
     float yNew = yTarget * kCJScrollFilterFactor + oldLayerPosition.y * (1.0f - kCJScrollFilterFactor);
     
     self.position = ccp(xNew, yNew);*/
}

- (void) ccTouchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
   /* UITouch* touch = [touches anyObject];
    CGPoint touchLocation = [touch locationInView: [touch view]];
    
    player.xTarget = touchLocation.x;
    player.yTarget = touchLocation.y;*/
}

- (void) ccTouchesMoved:(NSSet *)touches withEvent:(UIEvent *)event
{
   /* UITouch* touch = [touches anyObject];
    CGPoint touchLocation = [touch locationInView: [touch view]];
    
    player.xTarget = touchLocation.x;
    player.yTarget = touchLocation.y;*/
}

@end


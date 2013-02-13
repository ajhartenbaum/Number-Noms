//
//  CatchEscapePod.m
//  NumberNoms
//
//  Created by Alissa Hartenbaum on 2/13/13.
//
//

#import "CatchEscapePod.h"
#import "GameScene.h"
#import "CCBAnimationManager.h"

#define XSTARTTARGET 0
#define YSTARTTARGET 0

@implementation CatchEscapePod

@synthesize epxSpeed;
@synthesize epySpeed;
@synthesize epxTarget;
@synthesize epyTarget;

- (id) init
{
    self = [super init];
    if (!self) return NULL;
    
    epxTarget = XSTARTTARGET;
    epyTarget = YSTARTTARGET;
    epxSpeed=2;
    epySpeed=4;
    
    return self;
}

- (void) update
{
    // Calculate new position
    //CGPoint oldPosition = self.position;
    
    
    //self.position = ccp(xNew,yNew);
    
    
    // Check for game over
    /*if (ySpeed < kCJGameOverSpeed)
     {
     [[GameScene sharedScene] handleGameOver];
     }*/
}

- (void) handleCollisionWith:(GameObject *)gameObject
{
    /* if ([gameObject isKindOfClass:[Coin class]])
     {
     // Took a coin
     //ySpeed = kCJCoinSpeed;
     
     [GameScene sharedScene].score += 1;
     }
     else if ([gameObject isKindOfClass:[Bomb class]])
     {
     // Hit a bomb
     // if (ySpeed > 0) ySpeed = 0;
     
     //CCBAnimationManager* animationManager = self.userObject;
     //NSLog(@"animationManager: %@", animationManager);
     //[animationManager runAnimationsForSequenceNamed:@"Hit"];
     }*/
}

- (float) radius
{
    return 25;
}

@end

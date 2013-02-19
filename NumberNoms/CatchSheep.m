//
//  Sheep.m
//  NumberNoms
//
//  Created by Alissa Hartenbaum on 2/14/13.
//
//

//
//  CatchEscapePod.m
//  NumberNoms
//
//  Created by Alissa Hartenbaum on 2/13/13.
//
//

#import "CatchSheep.h"
#import "GameScene.h"
#import "CCBAnimationManager.h"

#define XSTART 1024
#define YSTART 600

@implementation CatchSheep

@synthesize epxSpeed;
@synthesize epySpeed;
@synthesize epxTarget;
@synthesize epyTarget;

- (id) init
{
    self = [super init];
    if (!self) return NULL;
    
    epxTarget = XSTART;
    epyTarget = YSTART;
    epxSpeed=arc4random_uniform(6);
    epySpeed=arc4random_uniform(6);
    
    /*CCSprite *epPic = [CCSprite spriteWithFile:@"sheep.png"];
    epPic.position = ccp(XSTART,YSTART);
    [self addChild: epPic];*/
    
    return self;
}

- (void) update
{
    // Calculate new position
    CGPoint oldPosition = self.position;
    
    
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

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

#define XSTART 1024
#define YSTART 600

@implementation CatchEscapePod

@synthesize epxSpeed;
@synthesize epySpeed;
@synthesize epxTarget;
@synthesize epyTarget;

@synthesize value;

- (id) init
{
    self = [super init];
    if (!self) return NULL;
        
    epxTarget = XSTART;
    epyTarget = YSTART;
    epxSpeed=arc4random_uniform(6);
    epySpeed=arc4random_uniform(6);
    
    self.value = 3;
    //[podLabel setString:[NSString stringWithFormat:@"%d",value]];


    return self; 
}

- (void) update
{
    // Calculate new position
    CGPoint oldPosition = self.position;
    
    //self.value = 3;
    [podLabel setString:[NSString stringWithFormat:@"%d",value]];
    
    
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

-(void) setPodValue: (int) v
{
    self.value = v;
    [podLabel setString:[NSString stringWithFormat:@"%d",v]];
}


@end

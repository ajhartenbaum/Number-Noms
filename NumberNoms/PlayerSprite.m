//
//  PlayerSprite.m
//  NumberNoms
//
//  Created by Alissa Hartenbaum on 2/11/13.
//
//

#import "PlayerSprite.h"
#import "SpaceGameLayer.h"
#import "CCBAnimationManager.h"

#define STARTTARGETX 0
#define STARTTARGETY 0
#define STARTSPEED 5

@implementation PlayerSprite

@synthesize xTarget;
@synthesize yTarget;

- (id) init
{
    self = [super init];
    if (!self) return NULL;
    
    xTarget = STARTTARGETX;
    yTarget = STARTTARGETY;
    ySpeed = STARTSPEED;
    
    return self;
}

- (void) update
{
    // Calculate new position
    //CGPoint oldPosition = self.position;
    
    float xNew = xTarget;
    float yNew = yTarget;
    //float yNew = oldPosition.y +ySpeed;
    //**************************
    //**************************
    //THIS LINE IS THE PROBLEM! DRAGON KEEPS GOING UP
    //**************************
    //**************************
    
    
    self.position = ccp(xNew,yNew);
    
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


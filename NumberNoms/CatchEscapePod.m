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
#import "CCBReader.h"
//#import "CCLabelTTF.h"

@implementation CatchEscapePod
CCLabelTTF *label;

- (id) init
{
    self = [super init];
    if (!self) return NULL;
    
    epxSpeed=(float)rand() / RAND_MAX * 1.5 + .15;
    epySpeed=(float)rand() / RAND_MAX * 1.5 + .15;
    
    CCSprite *epPic = [CCSprite spriteWithFile:@"EscapePod.png"];
    epPic.position = ccp(self.radius+220,self.radius);
    [self addChild:epPic];
    

    label = [CCLabelTTF labelWithString:@"" fontName:@"Times New Roman" fontSize:64];
    label.position = ccp(245,30);
    label.color = ccc3(0,0,0);
    [self addChild: label];
    
    
    return self; 
}

- (void) update
{
    // Calculate new position
    
    self.position = ccp(self.position.x + epxSpeed ,self.position.y + epySpeed);
    
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

- (void) xSpeedReverse
{
    epxSpeed = -epxSpeed;
}

- (void) ySpeedReverse
{
    epySpeed = -epySpeed;
}

- (void) setLabel:(int)num
{
    label.string =[[NSNumber numberWithInt:num] stringValue];
}

@end

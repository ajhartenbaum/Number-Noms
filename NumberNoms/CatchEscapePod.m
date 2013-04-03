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

extern int leveltheme2;

- (void) resetPosition
{
    self.position = ccp([[GameScene sharedScene] interfaceBarWidth]+self.radius, self.radius);
}

- (id) init
{
    self = [super init];
    if (!self) return NULL;
    
    float randAng = ((float)(rand() % 1000) / 1000.0) * M_PI * 2.0f;
    //float randSpeed = ((float)(rand() % 1000) / 1000.0) * 3.75 + 2.75;
    float randSpeed = 3.0;

    epxSpeed=sinf(randAng)*randSpeed;
    epySpeed=cosf(randAng)*randSpeed;

    [self resetPosition];
  
    CCSprite *epPic = [CCSprite spriteWithFile:@"EscapePod.png"];
    if (leveltheme2==1){
        epPic = [CCSprite spriteWithFile:@"EscapePod.png"];
    }
    else if (leveltheme2==2){
        epPic = [CCSprite spriteWithFile:@"coin.png"];
        epPic.scale = 0.4;
    }
    else if (leveltheme2==3){
        epPic = [CCSprite spriteWithFile:@"catchable.png"];
        epPic.scale = 0.4;
    }
    else if (leveltheme2==4){
        epPic = [CCSprite spriteWithFile:@"yarnspace.png"];
        epPic.scale = 0.3;
    }
    else{
        epPic = [CCSprite spriteWithFile:@"EscapePod.png"];
    }
    
    epPic.position = ccp(0,0);
    [self addChild:epPic];
    
    label = [CCLabelTTF labelWithString:@"" fontName:@"Times New Roman" fontSize:64];
    if(leveltheme2==3) label = [CCLabelTTF labelWithString:@"" fontName:@"Times New Roman" fontSize:43];
    label.position = ccp(0,0);
    if(leveltheme2==3) label.position=ccp(-25, -14);
    label.color = ccc3(0,0,0);
    [self addChild: label];
    
    myNumber = -1;
    
    return self; 
}

- (void) update
{
    // Calculate new position
    
    self.position = ccp(self.position.x + epxSpeed ,self.position.y + epySpeed);
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
    return 30;
}

- (void) collectThisShip
{
    //visible_ = false;
    
    [self setLabel:myNumber+10];
    [self resetPosition];
}

- (float) getXSpeed
{
    return epxSpeed;
}

- (float) getYSpeed
{
    return epySpeed;
}

- (void) newSpeed:(float)xSpeed :(float)ySpeed
{
    epxSpeed = xSpeed;
    epySpeed = ySpeed;
}

- (void) zeroSpeed
{
    [self newSpeed:0.0:0.0];
}

- (void) xSpeedReverse
{
    epxSpeed = -epxSpeed;
}

- (void) ySpeedReverse
{
    epySpeed = -epySpeed;
}

- (int) getMyNumber
{
    return myNumber;
}

- (CGPoint) getPos
{
    return position_;
}

- (void) setLabel:(int)num
{
    myNumber = num;
    label.string =[[NSNumber numberWithInt:num] stringValue];
}

@end

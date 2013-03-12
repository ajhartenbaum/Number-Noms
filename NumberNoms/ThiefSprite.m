//
//  PlayerSprite.m
//  NumberNoms
//
//  Created by Alissa Hartenbaum on 2/11/13.
//
//

#import "GameScene.h"
#import "ThiefSprite.h"
#import "SpaceGameLayer.h"
#import "CCBAnimationManager.h"

#define STARTTARGETX 200
#define STARTTARGETY 200
#define STARTSPEED 5

@implementation ThiefSprite

@synthesize xTarget;
@synthesize yTarget;

CCLabelTTF *label;

- (id) init
{
    self = [super init];
    if (!self) return NULL;
    
    self.position = ccp([[GameScene sharedScene] interfaceBarWidth]+self.radius+STARTTARGETX, self.radius+STARTTARGETY);
    
    CCSprite *epPic = [CCSprite spriteWithFile:@"Rocket.png"];
    epPic.position = ccp(0,0);
    epPic.scale = 0.3;
    [self addChild:epPic];
    
    label = [CCLabelTTF labelWithString:@"player" fontName:@"Times New Roman" fontSize:20];
    label.position = ccp(0,0);
    label.color = ccc3(0,0,0);
    [self addChild: label];
    
    xTarget = STARTTARGETX;
    yTarget = STARTTARGETY;
    ySpeed = STARTSPEED;
    
    return self;
}

- (void) update
{
    float dx = xTarget - self.position.x;
    float dy = yTarget - self.position.y;
    float dist = sqrt(dx*dx + dy*dy);
    
    if(dist < 5.0) {
        xSpeed = ySpeed = 0.0;
    } else {
        dx /= dist;
        dy /= dist;
        xSpeed = dx * STARTSPEED;
        ySpeed = dy * STARTSPEED;
    }
    
    self.position = ccp(self.position.x + xSpeed ,self.position.y + ySpeed);
    
    [[GameScene sharedScene] moveIncoming];
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
    return 50;
}

@end


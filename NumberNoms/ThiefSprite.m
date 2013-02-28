//
//  PlayerSprite.m
//  NumberNoms
//
//  Created by Alissa Hartenbaum on 2/11/13.
//
//

#import "ThiefSprite.h"
#import "SpaceGameLayer.h"
#import "CCBAnimationManager.h"

#define STARTTARGETX 0
#define STARTTARGETY 0
#define STARTSPEED 5

@implementation ThiefSprite

@synthesize xTarget;
@synthesize yTarget;

CCLabelTTF *label;

- (id) init
{
    self = [super init];
    if (!self) return NULL;
    
    CCSprite *epPic = [CCSprite spriteWithFile:@"sheep-1.png"];
    epPic.position = ccp(self.radius+220,self.radius);
    epPic.scale = 0.3;
    [self addChild:epPic];
    
    label = [CCLabelTTF labelWithString:@"player" fontName:@"Times New Roman" fontSize:20];
    label.position = ccp(245,30);
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
    
    if(dist < 20.0) {
        xSpeed = ySpeed = 0.0;
    } else {
        dx /= dist;
        dy /= dist;
        xSpeed = dx * STARTSPEED;
        ySpeed = dy * STARTSPEED;
    }
    
    self.position = ccp(self.position.x + xSpeed ,self.position.y + ySpeed);
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


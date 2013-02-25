//
//  GameScene.m
//  NumberNoms
//
//  Created by Alissa Hartenbaum on 2/12/13.
//
//

#import "GameScene.h"
#import "CCBReader.h"

static GameScene* sharedScene;
NSTimer *timer;

#define XSTART 22
#define XGAP 19
#define YGAP 18
#define YSTART 649

@implementation GameScene

@synthesize score;
@synthesize dotsArray;


+ (GameScene*) sharedScene
{
    return sharedScene;
}

- (void) handleTimer:(NSTimer *) theTimer
{
    // NSLog(@"timerFired @ %@", [theTimer fireDate]);
    [self setScore:score+4];
}

- (void) didLoadFromCCB
{
    sharedScene = self;
    
    self.score = 3;
    
    // Load the level
    level = [CCBReader nodeGraphFromFile:@"SpaceLevel.ccbi"];
    
    // And add it to the game scene
    [levelLayer addChild:level];
    
    timer = [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(handleTimer:) userInfo:nil repeats:YES];
    dotsArray = [[NSMutableArray alloc] initWithCapacity:50];
   
    for(int ii=0; ii<5; ii++) {
        for(int i=0; i<10; i++) {
            CCSprite *dotPic = [CCSprite spriteWithFile:@"this-many-dot.png"];
            dotPic.position = ccp(XSTART+i*XGAP,YSTART-ii*YGAP);
            [self addChild: dotPic];
            [dotsArray addObject:dotPic];
        }
    }
}

- (void) setScore:(int)s
{
    score = s;
    if(score < 0) {
        score = 0;
    }
    if(score > 50) {
        score = 0; // stop at 50 instead of resetting?
    }
    
    // [goalLabel setString:[NSString stringWithFormat:@"%d",s]];
     [goalLabel setString:[NSString stringWithFormat:@""]]; // don't use the label!
    
   int counter = 0;
    for (CCSprite *i in dotsArray) {
        i.visible = counter < score;
        counter++;
    }
}



- (void) handleGameOver
{
    [[CCDirector sharedDirector] replaceScene:[CCBReader sceneWithNodeGraphFromFile:@"MainMenu2Scene.ccbi"]];
}

- (void) handleLevelComplete
{
    [[CCDirector sharedDirector] replaceScene:[CCBReader sceneWithNodeGraphFromFile:@"MainMenu2Scene.ccbi"]];
}

@end
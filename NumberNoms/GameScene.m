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

#define XSTART 22
#define XGAP 19
#define YGAP 18
#define YSTART 649

@implementation GameScene

@synthesize score;
@synthesize dotsArray;

CCLabelTTF *afterShipLabel;
CCLabelTTF *incomingAfterShipLabel;
CCSprite *incomingEpPic;
CCSprite *sidebarEpPic;
CCLabelTTF *afterLabel;
float xIncomingEPSpeed;
float yIncomingEPSpeed;
#define INCOMING_COLLECTED_SPEED 18

- (int) interfaceBarWidth
{
    return 220;
}

+ (GameScene*) sharedScene
{
    return sharedScene;
}

- (void) changeAfterShipBasedOnIncomingShip
{
    xIncomingEPSpeed = yIncomingEPSpeed = 0.0;
    
    [sidebarEpPic removeChild:afterShipLabel cleanup:YES];
    afterShipLabel = [CCLabelTTF labelWithString:[NSString stringWithFormat:@"%@",[incomingAfterShipLabel string] ] fontName:@"Times New Roman" fontSize:64];
    afterShipLabel.position = ccp(sidebarEpPic.boundingBox.size.width*0.5,
                                  sidebarEpPic.boundingBox.size.height*0.5);
    afterShipLabel.color = ccc3(0,0,0);
    [sidebarEpPic addChild: afterShipLabel];
    
    incomingEpPic.visible = false;
}

- (void) moveIncoming
{
    float dx = sidebarEpPic.position.x - incomingEpPic.position.x;
    float dy = sidebarEpPic.position.y - incomingEpPic.position.y;
    float dist = sqrt(dx*dx + dy*dy);
    
    if(dist < INCOMING_COLLECTED_SPEED) {
        [self changeAfterShipBasedOnIncomingShip];
    } else {
        dx /= dist;
        dy /= dist;
        xIncomingEPSpeed = dx * INCOMING_COLLECTED_SPEED;
        yIncomingEPSpeed = dy * INCOMING_COLLECTED_SPEED;
    }
    
    incomingEpPic.position = ccp(incomingEpPic.position.x + xIncomingEPSpeed ,incomingEpPic.position.y + yIncomingEPSpeed);
}

- (void) gotShipNumber:(int)numberToAnimate startAtX:(float)atX  startAtY:(float)atY
{
    if(incomingEpPic.visible) {
        [self changeAfterShipBasedOnIncomingShip];
    }
    
    if(numberToAnimate == 1) {
        [self removeChild:afterLabel cleanup:YES];
        afterLabel = [CCLabelTTF labelWithString:@"After" fontName:@"Arial" fontSize:64];
        afterLabel.position = ccp(100,400);
        afterLabel.color = ccc3(0,0,0);
        [self addChild: afterLabel];
    }
    
    [self setScore:numberToAnimate+1]; // when it says "After 9" we want to show 10 dots
    
    [incomingEpPic removeChild:incomingAfterShipLabel cleanup:YES];
    incomingAfterShipLabel = [CCLabelTTF labelWithString:[NSString stringWithFormat:@"%i", numberToAnimate] fontName:@"Times New Roman" fontSize:64];
    
    incomingAfterShipLabel.position = ccp(incomingEpPic.boundingBox.size.width*0.5,
                                          incomingEpPic.boundingBox.size.height*0.5);
    incomingAfterShipLabel.color = ccc3(0,0,0);
    [incomingEpPic addChild: incomingAfterShipLabel];

    incomingEpPic.position = ccp(atX,atY);
    incomingEpPic.visible = true;
}

- (void) didLoadFromCCB
{
    sharedScene = self;
    
    self.score = 3;
    
    // Load the level
    level = [CCBReader nodeGraphFromFile:@"SpaceLevel.ccbi"];
    
    // And add it to the game scene
    [levelLayer addChild:level];
    
    dotsArray = [[NSMutableArray alloc] initWithCapacity:50];
   
    for(int ii=0; ii<5; ii++) {
        for(int i=0; i<10; i++) {
            CCSprite *dotPic = [CCSprite spriteWithFile:@"this-many-dot.png"];
            dotPic.position = ccp(XSTART+i*XGAP,YSTART-ii*YGAP);
            [self addChild: dotPic];
            [dotsArray addObject:dotPic];
        }
    }
    
    [self setScore:1];
    
    sidebarEpPic = [CCSprite spriteWithFile:@"EscapePod.png"];
    sidebarEpPic.position = ccp(100.0,300.0);
    [self addChild:sidebarEpPic];
    
    afterShipLabel = [CCLabelTTF labelWithString:@"0" fontName:@"Times New Roman" fontSize:64];
    afterShipLabel.position = ccp(sidebarEpPic.boundingBox.size.width*0.5,
                                  sidebarEpPic.boundingBox.size.height*0.5);
    afterShipLabel.color = ccc3(0,0,0);
    [sidebarEpPic addChild: afterShipLabel];    

    incomingEpPic = [CCSprite spriteWithFile:@"EscapePod.png"];
    incomingEpPic.position = ccp(175.0,200.0);
    [self addChild:incomingEpPic];
    
    incomingAfterShipLabel = [CCLabelTTF labelWithString:@"1" fontName:@"Arial" fontSize:64];
    incomingAfterShipLabel.position = ccp(incomingEpPic.boundingBox.size.width*0.5,
                                            incomingEpPic.boundingBox.size.height*0.5);
    incomingAfterShipLabel.color = ccc3(0,0,0);
    [incomingEpPic addChild: incomingAfterShipLabel];

    incomingEpPic.visible = false; // hide it until it's needed
    
    CCLabelTTF* topLabel = [CCLabelTTF labelWithString:@"Catch" fontName:@"Arial" fontSize:64];
    topLabel.position = ccp(100,692);
    topLabel.color = ccc3(0,0,0);
    [self addChild: topLabel];
    
    afterLabel = [CCLabelTTF labelWithString:@"Get" fontName:@"Arial" fontSize:64];
    afterLabel.position = ccp(100,400);
    afterLabel.color = ccc3(0,0,0);
    [self addChild: afterLabel];
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

- (void) pressedClose:(id)sender
{
    
    [[CCDirector sharedDirector] replaceScene:[CCBReader sceneWithNodeGraphFromFile:@"MainMenu2Scene.ccbi"]];
}

@end
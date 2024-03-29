//
//  GameScene.m
//  NumberNoms
//
//  Created by Alissa Hartenbaum on 2/12/13.
//
//

#import "GameScene.h"
#import "CCBReader.h"
#import "SimpleAudioEngine.h"
#import "ThemeSelectScene.h"

extern int difficulty;

static GameScene* sharedScene;
static int highscore = 0;

#define XSTART 22
#define XGAP 19
#define YGAP 18
#define YSTART 649

@implementation GameScene

@synthesize score;
@synthesize dotsArray;

bool gameIsInPlay;
CCLabelTTF *afterShipLabel;
CCLabelTTF *incomingAfterShipLabel;
CCSprite *incomingEpPic;
CCSprite *sidebarEpPic;
CCLabelTTF *afterLabel;

CCLabelTTF *endScreenText = NULL;
float xIncomingEPSpeed;
float yIncomingEPSpeed;
#define INCOMING_COLLECTED_SPEED 18
float endcounter=0;
bool setupCaughtIconAndNumber = false;

float countDownTilGameOver = 0.0;

extern int leveltheme2;

- (int) interfaceBarWidth
{
    return 220;
}

+ (int) highscore;
{
    NSUserDefaults *defs = [NSUserDefaults standardUserDefaults];
    highscore = (int)[defs integerForKey:@"score"];
    return highscore;
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
    if(leveltheme2==3){
        afterShipLabel = [CCLabelTTF labelWithString:[NSString stringWithFormat:@"%@",[incomingAfterShipLabel string] ] fontName:@"Times New Roman" fontSize:43];
    }
    afterShipLabel.position = ccp(sidebarEpPic.boundingBox.size.width*0.5,
                                  sidebarEpPic.boundingBox.size.height*0.5);
    if(leveltheme2==3){
        afterShipLabel.position = ccp(sidebarEpPic.boundingBox.size.width*0.5 -25,
        sidebarEpPic.boundingBox.size.height*0.5 -14) ;

    }
    
    if(setupCaughtIconAndNumber) {
        [self removeChild:afterLabel cleanup:YES];
        afterLabel = [CCLabelTTF labelWithString:@"Caught" fontName:@"Arial" fontSize:64];
        afterLabel.position = ccp(100,400);
        afterLabel.color = ccc3(0,0,0);
        [self addChild: afterLabel];
        
        if(sidebarEpPic.visible == false) {
            sidebarEpPic.visible = true;
        }
        setupCaughtIconAndNumber = false;
    }
    
    afterShipLabel.color = ccc3(0,0,0);
    [sidebarEpPic addChild: afterShipLabel];
    
    incomingEpPic.visible = false;
}

- (void) moveIncoming // called every frame
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
    
    // hacky crummy placement:
    if(countDownTilGameOver > 0.0) { // round is over/frozen, count down then exit
        countDownTilGameOver -= 0.02;
        if(countDownTilGameOver < 0.0) {
            [self handleGameOverTimeOut];
        }
    }
}

- (void) gotShipNumber:(int)numberToAnimate startAtX:(float)atX  startAtY:(float)atY
{
    if(incomingEpPic.visible) {
        [self changeAfterShipBasedOnIncomingShip];
    }
    
    if(numberToAnimate == 1) {
        setupCaughtIconAndNumber = true;
    }
    
    [self setScore:numberToAnimate+1]; // when it says "After 9" we want to show 10 dots
    
    [incomingEpPic removeChild:incomingAfterShipLabel cleanup:YES];
    incomingAfterShipLabel = [CCLabelTTF labelWithString:[NSString stringWithFormat:@"%i", numberToAnimate] fontName:@"Times New Roman" fontSize:64];
    
    incomingAfterShipLabel.position = ccp(incomingEpPic.boundingBox.size.width*0.5,
                                          incomingEpPic.boundingBox.size.height*0.5);
    //HANDLES UNICORN OFFSET when moving catchable to sidebar
    if(leveltheme2==3){
        incomingAfterShipLabel = [CCLabelTTF labelWithString:[NSString stringWithFormat:@"%i", numberToAnimate] fontName:@"Times New Roman" fontSize:43];
        incomingAfterShipLabel.position = ccp(sidebarEpPic.boundingBox.size.width*0.5 -25,
                                      sidebarEpPic.boundingBox.size.height*0.5 -14) ;
        
    }
    incomingAfterShipLabel.color = ccc3(0,0,0);
    [incomingEpPic addChild: incomingAfterShipLabel];

    incomingEpPic.position = ccp(atX,atY);
    incomingEpPic.visible = true;
}

- (void) didLoadFromCCB
{
    gameIsInPlay = YES;
    sharedScene = self;
    
    NSUserDefaults *defs = [NSUserDefaults standardUserDefaults];
    highscore = (int)[defs integerForKey:@"score"];
    
    countDownTilGameOver = 0.0;
    
    setupCaughtIconAndNumber = false;
    
    if(leveltheme2==1){
        [[SimpleAudioEngine sharedEngine] playBackgroundMusic:@"MoreSpaceLoop.wav"];
    }
    else if(leveltheme2==2){
        [[SimpleAudioEngine sharedEngine] playBackgroundMusic:@"NumNomsForDwaggins.mp3"];
    }
    else if(leveltheme2==3){
        [[SimpleAudioEngine sharedEngine] playBackgroundMusic:@"NumNomsForPonies.mp3"];
    }
    else if(leveltheme2==4){
        [[SimpleAudioEngine sharedEngine] playBackgroundMusic:@"NumNomsForKittehs.mp3"];
    }
    else{
        [[SimpleAudioEngine sharedEngine] playBackgroundMusic:@"MoreSpaceLoop.mp3"];
    }
    
    // Load the level
    
    if(leveltheme2==1){
        level = [CCBReader nodeGraphFromFile:@"SpaceLevel.ccbi"];
    }
    else if(leveltheme2==2){
        level = [CCBReader nodeGraphFromFile:@"DragonLevel.ccbi"];
    }
    else if(leveltheme2==3){
        level = [CCBReader nodeGraphFromFile:@"UnicornLevel.ccbi"];
    }
    else if(leveltheme2==4){
        level = [CCBReader nodeGraphFromFile:@"KittenLevel.ccbi"];
    }
    else{
        level = [CCBReader nodeGraphFromFile:@"SpaceLevel.ccbi"];
    }
    
    // And add it to the game scene
    [levelLayer addChild:level];
    
    dotsArray = [[NSMutableArray alloc] initWithCapacity:50];
   
    for(int ii=0; ii<5; ii++) {
        for(int i=0; i<10; i++) {
            CCSprite *dotPic = [CCSprite spriteWithFile:@"coin-filled-only.png"];
            dotPic.position = ccp(XSTART+i*XGAP,YSTART-ii*YGAP);
            [self addChild: dotPic];
            [dotsArray addObject:dotPic];
        }
    }
    
    [self setScore:1];
    
    if(leveltheme2==1){
        sidebarEpPic = [CCSprite spriteWithFile:@"EscapePod.png"];
        sidebarEpPic.position = ccp(100.0,300.0);
    }
    else if(leveltheme2==2){
        sidebarEpPic = [CCSprite spriteWithFile:@"coin.png"];
        //sidebarEpPic.scale = 0.4;
        sidebarEpPic.position = ccp(100.0,300.0);
    }
    else if(leveltheme2==3){
        sidebarEpPic = [CCSprite spriteWithFile:@"catchable.png"];
        //sidebarEpPic.scale = 0.4;
        sidebarEpPic.position = ccp(100.0,300.0);
    }
    else if(leveltheme2==4){
        sidebarEpPic = [CCSprite spriteWithFile:@"yarnspace.png"];
        //sidebarEpPic.scale = 0.3;
        sidebarEpPic.position = ccp(100.0,300.0);
    }
    else{
        sidebarEpPic = [CCSprite spriteWithFile:@"EscapePod.png"];
        sidebarEpPic.position = ccp(100.0,300.0);
    }
    [self addChild:sidebarEpPic];
    sidebarEpPic.visible = false;
    
    afterShipLabel = [CCLabelTTF labelWithString:@"0" fontName:@"Times New Roman" fontSize:64];
    if(leveltheme2==3) afterShipLabel = [CCLabelTTF labelWithString:@"0" fontName:@"Times New Roman" fontSize:43];
    afterShipLabel.position = ccp(sidebarEpPic.boundingBox.size.width*0.5,
                                  sidebarEpPic.boundingBox.size.height*0.5);
    if(leveltheme2==3) {afterShipLabel.position = ccp(sidebarEpPic.boundingBox.size.width*0.5 -25,
                                                      sidebarEpPic.boundingBox.size.height*0.5 -14) ;}
    afterShipLabel.color = ccc3(0,0,0);
    [sidebarEpPic addChild: afterShipLabel];
    
    if(leveltheme2==1){
        incomingEpPic = [CCSprite spriteWithFile:@"EscapePod.png"];
        incomingEpPic.position = ccp(175.0,200.0);
    }
    else if(leveltheme2==2){
        incomingEpPic = [CCSprite spriteWithFile:@"coin.png"];
        //incomingEpPic.scale = 0.4;
        incomingEpPic.position = ccp(175.0,200.0);
    }
    else if(leveltheme2==3){
        incomingEpPic = [CCSprite spriteWithFile:@"catchable.png"];
        //incomingEpPic.scale = 0.4;
        incomingEpPic.position = ccp(175.0,200.0);
    }
    else if(leveltheme2==4){
        incomingEpPic = [CCSprite spriteWithFile:@"yarnspace.png"];
        //incomingEpPic.scale = 0.3;
        incomingEpPic.position = ccp(175.0,200.0);
    }
    else{
        incomingEpPic = [CCSprite spriteWithFile:@"EscapePod.png"];
        incomingEpPic.position = ccp(175.0,200.0);
    }
    [self addChild:incomingEpPic];
    
    
    incomingAfterShipLabel = [CCLabelTTF labelWithString:@"1" fontName:@"Arial" fontSize:64];
    if(leveltheme2==3) incomingAfterShipLabel = [CCLabelTTF labelWithString:@"1" fontName:@"Arial" fontSize:43];
    incomingAfterShipLabel.position = ccp(incomingEpPic.boundingBox.size.width*0.5,
                                            incomingEpPic.boundingBox.size.height*0.5);
    if(leveltheme2==3) {incomingAfterShipLabel.position = ccp(incomingEpPic.boundingBox.size.width*0.5 -25,
                                                              incomingEpPic.boundingBox.size.height*0.5 -14) ;}

    incomingAfterShipLabel.color = ccc3(0,0,0);
    [incomingEpPic addChild: incomingAfterShipLabel];

    incomingEpPic.visible = false; // hide it until it's needed
    
    CCLabelTTF* topLabel = [CCLabelTTF labelWithString:@"Catch" fontName:@"Arial" fontSize:64];
    topLabel.position = ccp(100,692);
    topLabel.color = ccc3(0,0,0);
    [self addChild: topLabel];
    
    afterLabel = [CCLabelTTF labelWithString:@"" fontName:@"Arial" fontSize:64];
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
    if(score > 5*difficulty) {
        score = 5*difficulty; // stop at 50 instead of resetting?
        [self handleLevelComplete];
    }
    
    // [goalLabel setString:[NSString stringWithFormat:@"%d",s]];
     [goalLabel setString:[NSString stringWithFormat:@""]]; // don't use the label!
    
   int counter = 0;
    for (CCSprite *i in dotsArray) {
        i.visible = counter < score;
        counter++;
    }
}

- (void) stopMusicAndGotoMainMenu
{
    [[SimpleAudioEngine sharedEngine] stopBackgroundMusic];
    //[[CCDirector sharedDirector] replaceScene:[CCBReader sceneWithNodeGraphFromFile:@"MainMenu2Scene.ccbi"]];
    [[CCDirector sharedDirector] replaceScene:[CCTransitionCrossFade transitionWithDuration:1.0 scene:[CCBReader sceneWithNodeGraphFromFile:@"MainMenu2Scene.ccbi"]]];
}

- (void) handleGameOverTimeOut
{
    //[[CCDirector sharedDirector] replaceScene:[CCBReader sceneWithNodeGraphFromFile:@"EndBadCatchScene.ccbi"]];
    [[CCDirector sharedDirector] replaceScene:[CCTransitionCrossFade transitionWithDuration:1.0 scene:[CCBReader sceneWithNodeGraphFromFile:@"EndBadCatchScene.ccbi"]]];
    [[SimpleAudioEngine sharedEngine] stopBackgroundMusic];    
}

- (void) handleGameOver
{
    if(gameIsInPlay == YES) {
        if(countDownTilGameOver <= 0.0) {
            countDownTilGameOver = 1.0;
        }
        if([GameScene highscore] < score-1) {
            [[GameScene sharedScene] setHighscore:score-1];
        }
        endScreenText = [CCLabelTTF labelWithString:@"INCORRECT!" fontName:@"Arial" fontSize:54];
        endScreenText.position = ccp(512,384);
        endScreenText.color = ccc3(255,255,255);
        //[self addChild: endScreenText];
        gameIsInPlay = NO;
    }

    // [self stopMusicAndGotoMainMenu];
}

- (void) handleLevelComplete
{
    if(gameIsInPlay == YES) {
        if([GameScene highscore] < score) {
            [[GameScene sharedScene] setHighscore:score];
        }
        gameIsInPlay = NO;
    }

    //[[CCDirector sharedDirector] replaceScene:[CCBReader sceneWithNodeGraphFromFile:@"EndReachHundredScene.ccbi"]];
    [[CCDirector sharedDirector] replaceScene:[CCTransitionCrossFade transitionWithDuration:1.0 scene:[CCBReader sceneWithNodeGraphFromFile:@"EndReachHundredScene.ccbi"]]];
    [[SimpleAudioEngine sharedEngine] stopBackgroundMusic];

}

- (void) setHighscore:(int)newHS
{
    highscore = newHS;
    NSUserDefaults *defs = [NSUserDefaults standardUserDefaults];
    [defs setInteger:highscore forKey:@"score"];
    [defs synchronize];
}

- (Boolean) getGameIsInPlay
{
    return gameIsInPlay;
}

- (float) getCountDownTilGameOver
{
    return countDownTilGameOver;
}

- (void) pressedClose:(id)sender
{
    if([GameScene highscore] < score-1) {
        [[GameScene sharedScene] setHighscore:score-1];
    }
    [self stopMusicAndGotoMainMenu];
}

@end
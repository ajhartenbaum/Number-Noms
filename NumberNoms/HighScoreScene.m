//
//  HighScoreScene.m
//  NumberNoms
//
//  Created by Alissa Hartenbaum on 2/14/13.
//
//

#import "HighScoreScene.h"
#import "GameScene.h"
#import "CCBReader.h"

@implementation HighScoreScene

CCLabelTTF *endScreenText2 = NULL;

- (void) didLoadFromCCB
{
    endScreenText2 = [CCLabelTTF labelWithString:[NSString stringWithFormat:@"%i", [GameScene highscore]] fontName:@"Arial" fontSize:150];
    endScreenText2.position = ccp(512,350);
    endScreenText2.color = ccc3(255,255,255);
    [self addChild: endScreenText2];
}

- (void) pressedBack:(id)sender
{
    //[[CCDirector sharedDirector] replaceScene:[CCBReader sceneWithNodeGraphFromFile:@"MainMenu2Scene.ccbi"]];
    [[CCDirector sharedDirector] replaceScene:[CCTransitionCrossFade transitionWithDuration:1.0 scene:[CCBReader sceneWithNodeGraphFromFile:@"MainMenu2Scene.ccbi"]]];
}

- (void) pressedReset:(id)sender
{
    [[GameScene sharedScene] setHighscore:0];
    [self removeChild:endScreenText2 cleanup:YES];
    endScreenText2 = [CCLabelTTF labelWithString:[NSString stringWithFormat:@"%i", [GameScene highscore]] fontName:@"Arial" fontSize:150];
    endScreenText2.position = ccp(512,350);
    endScreenText2.color = ccc3(255,255,255);
    [self addChild: endScreenText2];
    
}



@end

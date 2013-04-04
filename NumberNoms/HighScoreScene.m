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
    endScreenText2 = [CCLabelTTF labelWithString:[NSString stringWithFormat:@"%i", [GameScene highscore]] fontName:@"Arial" fontSize:54];
    endScreenText2.position = ccp(512,384);
    endScreenText2.color = ccc3(255,255,255);
    [self addChild: endScreenText2];
}

- (void) pressedBack:(id)sender
{
    // Load the game scene
    //CCScene* mainScene = [CCBReader sceneWithNodeGraphFromFile:@"MainMenu2Scene.ccbi"];
    
    // Go to the game scene
    //[[CCDirector sharedDirector] replaceScene:mainScene];
    
    [[CCDirector sharedDirector] replaceScene:[CCBReader sceneWithNodeGraphFromFile:@"MainMenu2Scene.ccbi"]];
}



@end

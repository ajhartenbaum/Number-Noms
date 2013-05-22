//
//  MainMenu2Scene.m
//  NumberNoms
//
//  Created by Alissa Hartenbaum on 2/7/13.
//
//

#import "MainMenu2Scene.h"
#import "CCBReader.h"

@implementation MainMenu2Scene

- (void) pressedPlay:(id)sender
{
    // Load the game scene
    CCScene* themeScene = [CCBReader sceneWithNodeGraphFromFile:@"ThemeSelectScene.ccbi"];
    
    // Go to the game scene
    //[[CCDirector sharedDirector] replaceScene:themeScene];
    [[CCDirector sharedDirector] replaceScene:[CCTransitionCrossFade transitionWithDuration:1.0 scene:themeScene]];
}

- (void) pressedHighScore:(id)sender
{
    // Load the game scene
    CCScene* scoreScene = [CCBReader sceneWithNodeGraphFromFile:@"HighScoreScene.ccbi"];
    
    // Go to the game scene
    //[[CCDirector sharedDirector] replaceScene:scoreScene];
    [[CCDirector sharedDirector] replaceScene:[CCTransitionCrossFade transitionWithDuration:1.0 scene:scoreScene]];
}

- (void) pressedOptions:(id)sender
{
    // Load the game scene
     CCScene* optScene = [CCBReader sceneWithNodeGraphFromFile:@"OptionScene.ccbi"];
    [[CCDirector sharedDirector] replaceScene:[CCTransitionCrossFade transitionWithDuration:1.0 scene:optScene]];
    // Go to the game scene
    //[[CCDirector sharedDirector] replaceScene:optScene];
}

- (void) pressedCredits:(id)sender
{
    // Load the game scene
    CCScene* credScene = [CCBReader sceneWithNodeGraphFromFile:@"CreditsScene.ccbi"];
    
    // Go to the game scene
    //[[CCDirector sharedDirector] replaceScene:credScene];
    [[CCDirector sharedDirector] replaceScene:[CCTransitionCrossFade transitionWithDuration:1.0 scene:credScene]];
}

- (void) pressedInstruct:(id)sender
{
    // Load the game scene
    CCScene* instrScene = [CCBReader sceneWithNodeGraphFromFile:@"InstructionScene.ccbi"];
    
    // Go to the game scene
    [[CCDirector sharedDirector] replaceScene:[CCTransitionCrossFade transitionWithDuration:1.0 scene:instrScene]];
}

@end




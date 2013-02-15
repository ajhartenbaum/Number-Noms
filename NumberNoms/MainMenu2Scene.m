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
    CCScene* gameScene = [CCBReader sceneWithNodeGraphFromFile:@"GameScene.ccbi"];
    
    // Go to the game scene
    [[CCDirector sharedDirector] replaceScene:gameScene];
}

- (void) pressedHighScore:(id)sender
{
    // Load the game scene
    CCScene* scoreScene = [CCBReader sceneWithNodeGraphFromFile:@"HighScoreScene.ccbi"];
    
    // Go to the game scene
    [[CCDirector sharedDirector] replaceScene:scoreScene];
}

- (void) pressedOptions:(id)sender
{
    // Load the game scene
     CCScene* optScene = [CCBReader sceneWithNodeGraphFromFile:@"OptionScene.ccbi"];
    
    // Go to the game scene
    [[CCDirector sharedDirector] replaceScene:optScene];
}

@end




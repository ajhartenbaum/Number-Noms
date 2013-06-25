//
//  DifficultyScene.m
//  NumberNoms
//
//  Created by Alissa Hartenbaum on 6/24/13.
//
//

#import "DifficultyScene.h"
#import "CCBReader.h"

@implementation DifficultyScene

- (void) pressedEasy:(id)sender
{
    
    // Load the game scene
    CCScene* gameScene = [CCBReader sceneWithNodeGraphFromFile:@"GameScene.ccbi"];
    
    // Go to the game scene
    [[CCDirector sharedDirector] replaceScene:[CCTransitionCrossFade transitionWithDuration:1.0 scene:gameScene]];
    
}

- (void) pressedMedium:(id)sender
{
    
    // Load the game scene
    CCScene* gameScene = [CCBReader sceneWithNodeGraphFromFile:@"GameScene.ccbi"];
    
    // Go to the game scene
    [[CCDirector sharedDirector] replaceScene:[CCTransitionCrossFade transitionWithDuration:1.0 scene:gameScene]];
}

- (void) pressedHard:(id)sender
{
    
    // Load the game scene
    CCScene* gameScene = [CCBReader sceneWithNodeGraphFromFile:@"GameScene.ccbi"];
    
    // Go to the game scene
    [[CCDirector sharedDirector] replaceScene:[CCTransitionCrossFade transitionWithDuration:1.0 scene:gameScene]];
    
}

- (void) pressedBack:(id)sender
{
    
    [[CCDirector sharedDirector] replaceScene:[CCTransitionCrossFade transitionWithDuration:1.0 scene:[CCBReader sceneWithNodeGraphFromFile:@"ThemeSelectScene.ccbi"]]];
}


@end

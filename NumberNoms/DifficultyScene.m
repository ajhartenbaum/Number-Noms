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

extern int difficulty;

- (void) pressedEasy:(id)sender
{
    [self setDifficulty:4];
    
    // Load the game scene
    CCScene* gameScene = [CCBReader sceneWithNodeGraphFromFile:@"GameScene.ccbi"];
    
    // Go to the game scene
    [[CCDirector sharedDirector] replaceScene:[CCTransitionCrossFade transitionWithDuration:1.0 scene:gameScene]];
    
}

- (void) pressedMedium:(id)sender
{
    [self setDifficulty:7];
    
    // Load the game scene
    CCScene* gameScene = [CCBReader sceneWithNodeGraphFromFile:@"GameScene.ccbi"];
    
    // Go to the game scene
    [[CCDirector sharedDirector] replaceScene:[CCTransitionCrossFade transitionWithDuration:1.0 scene:gameScene]];
}

- (void) pressedHard:(id)sender
{
    [self setDifficulty:10];
    
    // Load the game scene
    CCScene* gameScene = [CCBReader sceneWithNodeGraphFromFile:@"GameScene.ccbi"];
    
    // Go to the game scene
    [[CCDirector sharedDirector] replaceScene:[CCTransitionCrossFade transitionWithDuration:1.0 scene:gameScene]];
    
}

- (void) pressedBack:(id)sender
{
    
    [[CCDirector sharedDirector] replaceScene:[CCTransitionCrossFade transitionWithDuration:1.0 scene:[CCBReader sceneWithNodeGraphFromFile:@"ThemeSelectScene.ccbi"]]];
}

- (void) setDifficulty:(int)s
{
    difficulty = s;
}


@end

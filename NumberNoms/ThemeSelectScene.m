//
//  ThemeSelectScene.m
//  NumberNoms
//
//  Created by Alissa Hartenbaum on 3/7/13.
//
//

#import "ThemeSelectScene.h" 
#import "CCBReader.h"

@implementation ThemeSelectScene


extern int leveltheme2;

- (void) pressedRocket:(id)sender
{
    [self setTheme:1];
    
    // Load the game scene
    CCScene* gameScene = [CCBReader sceneWithNodeGraphFromFile:@"GameScene.ccbi"];
    
    // Go to the game scene
    //[[CCDirector sharedDirector] replaceScene:gameScene];
    [[CCDirector sharedDirector] replaceScene:[CCTransitionCrossFade transitionWithDuration:1.0 scene:gameScene]];
    
}

- (void) pressedCat:(id)sender
{
    [self setTheme:4];
    
    // Load the game scene
    CCScene* gameScene = [CCBReader sceneWithNodeGraphFromFile:@"GameScene.ccbi"];
    
    // Go to the game scene
    //[[CCDirector sharedDirector] replaceScene:gameScene];
    [[CCDirector sharedDirector] replaceScene:[CCTransitionCrossFade transitionWithDuration:1.0 scene:gameScene]];
}

- (void) pressedDragon:(id)sender
{
    [self setTheme:2];
    
     // Load the game scene
    CCScene* gameScene = [CCBReader sceneWithNodeGraphFromFile:@"GameScene.ccbi"];
    
    // Go to the game scene
    //[[CCDirector sharedDirector] replaceScene:gameScene];
    [[CCDirector sharedDirector] replaceScene:[CCTransitionCrossFade transitionWithDuration:1.0 scene:gameScene]];
     
}

- (void) pressedUnicorn:(id)sender
{
    [self setTheme:3];
    
    // Load the game scene
    CCScene* gameScene = [CCBReader sceneWithNodeGraphFromFile:@"GameScene.ccbi"];
    
    // Go to the game scene
    //[[CCDirector sharedDirector] replaceScene:gameScene];
    [[CCDirector sharedDirector] replaceScene:[CCTransitionCrossFade transitionWithDuration:1.0 scene:gameScene]];
}

- (void) pressedBack:(id)sender
{
    
    //[[CCDirector sharedDirector] replaceScene:[CCBReader sceneWithNodeGraphFromFile:@"MainMenu2Scene.ccbi"]];
    [[CCDirector sharedDirector] replaceScene:[CCTransitionCrossFade transitionWithDuration:1.0 scene:[CCBReader sceneWithNodeGraphFromFile:@"MainMenu2Scene.ccbi"]]];
}

- (void) setTheme:(int)s
{
    leveltheme2=s;
}


@end

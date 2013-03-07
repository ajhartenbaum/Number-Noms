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

- (void) pressedRocket:(id)sender
{
    // Load the game scene
    CCScene* gameScene = [CCBReader sceneWithNodeGraphFromFile:@"GameScene.ccbi"];
    
    // Go to the game scene
    [[CCDirector sharedDirector] replaceScene:gameScene];
}

- (void) pressedCat:(id)sender
{
   /*
    // Load the game scene
    CCScene* gameScene = [CCBReader sceneWithNodeGraphFromFile:@"GameScene.ccbi"];
    
    // Go to the game scene
    [[CCDirector sharedDirector] replaceScene:gameScene];
    */
}

- (void) pressedDragon:(id)sender
{
    /*
     // Load the game scene
    CCScene* gameScene = [CCBReader sceneWithNodeGraphFromFile:@"GameScene.ccbi"];
    
    // Go to the game scene
    [[CCDirector sharedDirector] replaceScene:gameScene];
     */
}

- (void) pressedBack:(id)sender
{
    
    [[CCDirector sharedDirector] replaceScene:[CCBReader sceneWithNodeGraphFromFile:@"MainMenu2Scene.ccbi"]];
}


@end

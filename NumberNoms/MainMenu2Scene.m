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
    CCScene* gameScene = [CCBReader sceneWithNodeGraphFromFile:@"SpaceGameLayer.ccbi"];
    
    // Go to the game scene
    [[CCDirector sharedDirector] replaceScene:gameScene];
}

@end




//
//  EndQuitScene.m
//  NumberNoms
//
//  Created by Alissa Hartenbaum on 3/28/13.
//
//

#import "EndQuitScene.h"
#import "CCBReader.h"

@implementation EndQuitScene

- (void) pressedHome:(id)sender
{
    
    //[[CCDirector sharedDirector] replaceScene:[CCBReader sceneWithNodeGraphFromFile:@"MainMenu2Scene.ccbi"]];
    [[CCDirector sharedDirector] replaceScene:[CCTransitionCrossFade transitionWithDuration:1.0 scene:[CCBReader sceneWithNodeGraphFromFile:@"MainMenu2Scene.ccbi"]]];
}

- (void) pressedReplay:(id)sender
{
    //[[CCDirector sharedDirector] replaceScene:[CCBReader sceneWithNodeGraphFromFile:@"GameScene.ccbi"]];
    [[CCDirector sharedDirector] replaceScene:[CCTransitionCrossFade transitionWithDuration:1.0 scene:[CCBReader sceneWithNodeGraphFromFile:@"GameScene.ccbi"]]];
}

@end

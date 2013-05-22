//
//  InstructionScene.m
//  NumberNoms
//
//  Created by Alissa Hartenbaum on 5/21/13.
//
//

#import "InstructionScene.h"
#import "CCBReader.h"

@implementation InstructionScene

- (void) pressedBack:(id)sender
{
    
    [[CCDirector sharedDirector] replaceScene:[CCTransitionCrossFade transitionWithDuration:1.0 scene:[CCBReader sceneWithNodeGraphFromFile:@"MainMenu2Scene.ccbi"]]];
}

@end

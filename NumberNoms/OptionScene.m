//
//  OptionScene.m
//  NumberNoms
//
//  Created by Alissa Hartenbaum on 2/14/13.
//
//

#import "OptionScene.h"
#import "CCBReader.h"

@implementation OptionScene

- (void) pressedBack:(id)sender
{
    
    //[[CCDirector sharedDirector] replaceScene:[CCBReader sceneWithNodeGraphFromFile:@"MainMenu2Scene.ccbi"]];
    [[CCDirector sharedDirector] replaceScene:[CCTransitionCrossFade transitionWithDuration:1.0 scene:[CCBReader sceneWithNodeGraphFromFile:@"MainMenu2Scene.ccbi"]]];
}


@end

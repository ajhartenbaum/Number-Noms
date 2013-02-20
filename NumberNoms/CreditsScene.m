//
//  CreditsScene.m
//  NumberNoms
//
//  Created by Alissa Hartenbaum on 2/20/13.
//
//

#import "CreditsScene.h"
#import "CCBReader.h"

@implementation CreditsScene

- (void) pressedBack:(id)sender
{
    
    [[CCDirector sharedDirector] replaceScene:[CCBReader sceneWithNodeGraphFromFile:@"MainMenu2Scene.ccbi"]];
}


@end
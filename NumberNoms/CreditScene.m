//
//  CreditScene.m
//  NumberNoms
//
//  Created by Alissa Hartenbaum on 2/20/13.
//
//

#import "CreditScene.h"
#import "CCBReader.h"

@implementation CreditScene

- (void) pressedBack:(id)sender
{
    // Load the game scene
    //CCScene* mainScene = [CCBReader sceneWithNodeGraphFromFile:@"MainMenu2Scene.ccbi"];
    
    // Go to the game scene
    //[[CCDirector sharedDirector] replaceScene:mainScene];
    
    [[CCDirector sharedDirector] replaceScene:[CCBReader sceneWithNodeGraphFromFile:@"MainMenu2Scene.ccbi"]];
}


@end

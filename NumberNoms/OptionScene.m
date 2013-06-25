//
//  OptionScene.m
//  NumberNoms
//
//  Created by Alissa Hartenbaum on 2/14/13.
//
//

#import "OptionScene.h"
#import "CCBReader.h"
#import "SimpleAudioEngine.h"

@implementation OptionScene

- (void) onEnter
{
    [super onEnter];
    
    if([SimpleAudioEngine sharedEngine].mute==0){
        [onbutton setIsEnabled:NO];
        [onback setIsEnabled:NO];
        
        [offbutton setIsEnabled:YES];
        [offback setIsEnabled:YES];
    }
    else{
        [onbutton setIsEnabled:YES];
        [onback setIsEnabled:YES];
        
        [offbutton setIsEnabled:NO];
        [offback setIsEnabled:NO];
    }
    
}

- (void) pressedBack:(id)sender
{
    
    //[[CCDirector sharedDirector] replaceScene:[CCBReader sceneWithNodeGraphFromFile:@"MainMenu2Scene.ccbi"]];
    [[CCDirector sharedDirector] replaceScene:[CCTransitionCrossFade transitionWithDuration:1.0 scene:[CCBReader sceneWithNodeGraphFromFile:@"MainMenu2Scene.ccbi"]]];
}

- (void) pressedOn:(id)sender
{
    [onbutton setIsEnabled:NO];
    [onback setIsEnabled:NO];
    
    [offbutton setIsEnabled:YES];
    [offback setIsEnabled:YES];
    
    [[SimpleAudioEngine sharedEngine] setMute:0];
}

- (void) pressedOff:(id)sender
{
    [onbutton setIsEnabled:YES];
    [onback setIsEnabled:YES];
    
    [offbutton setIsEnabled:NO];
    [offback setIsEnabled:NO];
    
    [[SimpleAudioEngine sharedEngine] setMute:1];

}


@end

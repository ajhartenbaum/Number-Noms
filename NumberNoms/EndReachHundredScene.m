//
//  EndReachHundredScene.m
//  NumberNoms
//
//  Created by Alissa Hartenbaum on 3/28/13.
//
//

#import "EndReachHundredScene.h"
#import "CCBReader.h"

@implementation EndReachHundredScene

extern int difficulty;

- (void) onEnter
{
    [super onEnter];
    
    CCSprite *winningText;
    
    if (difficulty == 4)
        winningText= [CCSprite spriteWithFile:@"winscreenEasy.png"];
    else if (difficulty == 7)
        winningText= [CCSprite spriteWithFile:@"winscreenMedium.png"];
    else // difficulty == 10
        winningText= [CCSprite spriteWithFile:@"winscreen.png"];
    winningText.position = ccp(516, 534);
    winningText.scale = .5;
    [self addChild:winningText];
}


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

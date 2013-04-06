//
//  EndBadCatchScene.m
//  NumberNoms
//
//  Created by Alissa Hartenbaum on 3/28/13.
//
//

#import "EndBadCatchScene.h"
#import "CCBReader.h"

@implementation EndBadCatchScene

extern int next, grabbed;
CCLabelTTF *nextLabel = NULL;
CCLabelTTF *caughtLabel = NULL;

- (void) onEnter
{
    [super onEnter];
    
    caughtLabel = [CCLabelTTF labelWithString:[NSString stringWithFormat:@"%d", grabbed] fontName:@"Arial" fontSize:120];
    caughtLabel.position = ccp(752,455);
    caughtLabel.color = ccc3(2,128,21);
    [self addChild: caughtLabel];
    
    
    nextLabel = [CCLabelTTF labelWithString:[NSString stringWithFormat:@"%d", next] fontName:@"Arial" fontSize:120];
    nextLabel.position = ccp(752,615);
    nextLabel.color = ccc3(255,0,0);
    [self addChild: nextLabel];
}


- (void) pressedHome:(id)sender
{
    
    //[[CCDirector sharedDirector] replaceScene:[CCBReader sceneWithNodeGraphFromFile:@"MainMenu2Scene.ccbi"]];
    //I Love cheese so much I want to eat some cheese right now!!!!!!!!!
    //This game is totally awesome and I want to play it all night long
    //Also I want lots of pizza!!!!!!!!! It's so dwlicious and I want to eat it!!!! Lots of pizza and lots and lots of pizza for EVERYONE!!!!!!!
    //So what's new?
    //Okay so I need to do some serious thinking
    [[CCDirector sharedDirector] replaceScene:[CCTransitionCrossFade transitionWithDuration:1.0 scene:[CCBReader sceneWithNodeGraphFromFile:@"MainMenu2Scene.ccbi"]]];
}

- (void) pressedReplay:(id)sender
{
    //[[CCDirector sharedDirector] replaceScene:[CCBReader sceneWithNodeGraphFromFile:@"GameScene.ccbi"]];
    [[CCDirector sharedDirector] replaceScene:[CCTransitionCrossFade transitionWithDuration:1.0 scene:[CCBReader sceneWithNodeGraphFromFile:@"GameScene.ccbi"]]];
}

@end

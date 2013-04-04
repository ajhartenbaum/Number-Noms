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
    
    caughtLabel = [CCLabelTTF labelWithString:[NSString stringWithFormat:@"%d", grabbed] fontName:@"Arial" fontSize:64];
    caughtLabel.position = ccp(752,600);
    caughtLabel.color = ccc3(255,255,255);
    [self addChild: caughtLabel];
    
    
    nextLabel = [CCLabelTTF labelWithString:[NSString stringWithFormat:@"%d", next] fontName:@"Arial" fontSize:64];
    nextLabel.position = ccp(752,450);
    nextLabel.color = ccc3(255,255,255);
    [self addChild: nextLabel];
}


- (void) pressedHome:(id)sender
{
    
    [[CCDirector sharedDirector] replaceScene:[CCBReader sceneWithNodeGraphFromFile:@"MainMenu2Scene.ccbi"]];
}

- (void) pressedReplay:(id)sender
{
    [[CCDirector sharedDirector] replaceScene:[CCBReader sceneWithNodeGraphFromFile:@"GameScene.ccbi"]];
}

@end

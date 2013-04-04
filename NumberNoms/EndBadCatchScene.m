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
    caughtLabel.position = ccp(752,625);
    caughtLabel.color = ccc3(255,0,0);
    [self addChild: caughtLabel];
    
    
    nextLabel = [CCLabelTTF labelWithString:[NSString stringWithFormat:@"%d", next] fontName:@"Arial" fontSize:120];
    nextLabel.position = ccp(752,455);
    nextLabel.color = ccc3(2,128,21);
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

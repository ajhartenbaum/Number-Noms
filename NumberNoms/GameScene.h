//
//  GameScene.h
//  NumberNoms
//
//  Created by Alissa Hartenbaum on 2/12/13.
//
//

#import "CCLayer.h"

@class SpaceLevel;

@interface GameScene : CCLayer
{
    CCLayer* levelLayer;
    CCLabelTTF* goalLabel;
    CCNode* level;
    int score;
}

@property (nonatomic,assign) int score;

+ (GameScene*) sharedScene;

//- (void) pressedCheck;

- (void) handleGameOver;
- (void) handleLevelComplete;

@end
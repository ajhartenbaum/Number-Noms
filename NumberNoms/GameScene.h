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
    NSMutableArray *dotsArray;
    int score;
    CCLabelTTF* blahLabel;
}

@property (nonatomic,assign) int score;
@property (nonatomic, retain) NSMutableArray *dotsArray;

- (int) interfaceBarWidth;

+ (int) highscore;
+ (GameScene*) sharedScene;
- (void) gotShipNumber:(int)numberToAnimate startAtX:(float)atX  startAtY:(float)atY;

- (void) setHighscore:(int)newHS;
- (void) moveIncoming;
- (void) handleGameOver;
- (void) handleLevelComplete;
- (Boolean) getGameIsInPlay;

@end
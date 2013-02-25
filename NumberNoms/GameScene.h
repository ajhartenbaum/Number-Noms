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


+ (GameScene*) sharedScene;
- (void) handleTimer:(NSTimer *) theTimer;



- (void) handleGameOver;
- (void) handleLevelComplete;

@end
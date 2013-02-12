//
//  SpaceLevel.h
//  NumberNoms
//
//  Created by Alissa Hartenbaum on 2/11/13.
//
//

#import "CCLayer.h"

@class Level; //MAY NEED TO REMOVE

@interface SpaceGameLayer : CCLayer
{
    CCLabelTTF* scoreLabel;
    CCLabelTTF* nextSpawnLabel;
    CCNode* level;
    int score;
}

@property (nonatomic,assign) int score;

+ (SpaceGameLayer*) sharedScene;

- (void) handleGameOver;
- (void) handleLevelComplete;

@end

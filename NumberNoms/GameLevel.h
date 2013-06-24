//
//  GameLevel.h
//  NumberNoms
//
//  Created by Anthony Taormina on 5/14/13.
//
//

#import "GameScene.h"
#import "CatchEscapePod.h"
#import "ThiefSprite.h"

@interface GameLevel : CCLayer {

    @protected
    NSMutableArray *escapePodArray, *entryQueue;
    ThiefSprite* sprite;
    CGPoint entryPoint;
    int currentTarget;
}

- (void) caughtShip:(CatchEscapePod*)pod;
- (CCNode*) pop: (NSMutableArray*) queue;

@end

//
//  PlayerObject.h
//  NumberNoms
//
//  Created by Alissa Hartenbaum on 2/11/13.
//
//

#import "CCNode.h"

@interface GameObject : CCNode
{
    BOOL isScheduledForRemove;
}

@property (nonatomic,assign) BOOL isScheduledForRemove;
@property (nonatomic,readonly) float radius;

- (void) update;

- (void) handleCollisionWith:(GameObject*)gameObject;

@end
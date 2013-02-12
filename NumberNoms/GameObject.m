//
//  PlayerObject.m
//  NumberNoms
//
//  Created by Alissa Hartenbaum on 2/11/13.
//
//

#import "GameObject.h"

@implementation GameObject

@synthesize isScheduledForRemove;

// Update is called for every game object once every frame
- (void) update
{}

// If this game object has collided with another game object this method is called
- (void) handleCollisionWith:(GameObject *)gameObject
{}

// Returns the radius of this game object
- (float) radius
{
    return 0;
}


@end

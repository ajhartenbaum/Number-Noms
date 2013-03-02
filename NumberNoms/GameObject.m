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

// Returns a point representing the center of the object since position is based off the
// bottom left
- (CGPoint) getCenter
{
    CGPoint center = self.position;
    center.x += [self radius];
    center.y += [self radius];
    return center;
    
}

@end

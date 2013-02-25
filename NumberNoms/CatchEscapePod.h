//
//  CatchEscapePod.h
//  NumberNoms
//
//  Created by Alissa Hartenbaum on 2/13/13.
//
//

#import "GameObject.h"

@interface CatchEscapePod : GameObject
{
    float epxSpeed;
    float epySpeed;
}

- (void) xSpeedReverse;
- (void) ySpeedReverse;
- (void) setLabel:(int)num;

@end

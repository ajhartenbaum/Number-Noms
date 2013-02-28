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
    int myNumber;
    CCLabelTTF *label;
}

- (void) collectThisShip;
- (void) xSpeedReverse;
- (void) ySpeedReverse;
- (void) zeroSpeed;
- (int) getMyNumber;
- (CGPoint) getPos;
- (void) setLabel:(int)num;

@end

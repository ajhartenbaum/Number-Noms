//
//  SpaceLevel.h
//  NumberNoms
//
//  Created by Alissa Hartenbaum on 2/12/13.
//
//

#import "CCLayer.h"

@class Catchable;
@class CatchEscapePod;

@interface SpaceLevel : CCLayer
{
    Catchable* escapePod;
    CatchEscapePod* ep1;
    //CCLayer* binArea;
}

@end

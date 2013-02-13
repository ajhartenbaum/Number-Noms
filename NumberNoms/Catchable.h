//
//  Catchable.h
//  NumberNoms
//
//  Created by Alissa Hartenbaum on 2/11/13.
//
//

#import "GameObject.h"

@interface Catchable : GameObject
{
    float cxTarget;
    float cyTarget;
}

@property (nonatomic,assign) float cxTarget;
@property (nonatomic,assign) float cyTarget;


@end

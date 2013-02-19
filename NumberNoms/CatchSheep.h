//
//  Sheep.h
//  NumberNoms
//
//  Created by Alissa Hartenbaum on 2/14/13.
//
//

#import "GameObject.h"

@interface CatchSheep : GameObject
{
    float epxSpeed;
    float epySpeed;
    float epxTarget;
    float epyTarget;
}

@property (nonatomic,assign) float epxSpeed;
@property (nonatomic,assign) float epySpeed;

@property (nonatomic,assign) float epxTarget;
@property (nonatomic,assign) float epyTarget;


@end

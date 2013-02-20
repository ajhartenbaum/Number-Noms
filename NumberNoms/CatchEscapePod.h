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
    float epxTarget;
    float epyTarget;
    CCLabelTTF* podLabel;
    int value;

    
}

@property (nonatomic,assign) float epxSpeed;
@property (nonatomic,assign) float epySpeed;

@property (nonatomic,assign) float epxTarget;
@property (nonatomic,assign) float epyTarget;

@property (nonatomic,assign) int value;



@end

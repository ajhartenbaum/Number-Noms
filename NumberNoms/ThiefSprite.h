//
//  PlayerSprite.h
//  NumberNoms
//
//  Created by Alissa Hartenbaum on 2/11/13.
//
//

#import "GameObject.h"

@interface ThiefSprite : GameObject
{
    float xSpeed;
    float ySpeed;
    float xTarget;
    float yTarget;
}

@property (nonatomic,assign) float xTarget;
@property (nonatomic,assign) float yTarget;


@end
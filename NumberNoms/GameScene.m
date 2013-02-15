//
//  GameScene.m
//  NumberNoms
//
//  Created by Alissa Hartenbaum on 2/12/13.
//
//

#import "GameScene.h"
#import "CCBReader.h"

static GameScene* sharedScene;

@implementation GameScene

@synthesize score;

+ (GameScene*) sharedScene
{
    return sharedScene;
}

- (void) didLoadFromCCB
{
    sharedScene = self;
    
    self.score = 3;
    
    // Load the level
    level = [CCBReader nodeGraphFromFile:@"SpaceLevel.ccbi"];
    
    // And add it to the game scene
    [levelLayer addChild:level];
}

- (void) setScore:(int)s
{
    score = s;
    [goalLabel setString:[NSString stringWithFormat:@"%d",s]];
}

- (void) pressedCheck:(id)sender
{
    
    
}


- (void) handleGameOver
{
    [[CCDirector sharedDirector] replaceScene:[CCBReader sceneWithNodeGraphFromFile:@"MainMenu2Scene.ccbi"]];
}

- (void) handleLevelComplete
{
    [[CCDirector sharedDirector] replaceScene:[CCBReader sceneWithNodeGraphFromFile:@"MainMenu2Scene.ccbi"]];
}

@end
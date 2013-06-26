//
//  SpaceLevel.m
//  NumberNoms
//
//  Created by Alissa Hartenbaum on 2/12/13.
//
//

#import "SpaceLevel.h"

#define EASY

#ifdef EASY
    #define NUM_TO_SPAWN 4
#endif

#ifdef MEDIUM
    #define NUM_TO_SPAWN 7
#endif

#ifdef HARD
    #define NUM_TO_SPAWN 10
#endif

#ifndef NUM_TO_SPAWN
    #define NUM_TO_SPAWN 7
#endif

@implementation SpaceLevel

- (void) onEnter
{
    [super onEnter];
    
    currentTarget = 1;
    
    // Schedule a selector that is called every frame
    [self schedule:@selector(update:)];
    
    // Make sure touches are enabled
    self.isTouchEnabled = YES;
    
    sprite = [[ThiefSprite alloc] init];
    [self addChild:sprite];
    
    //timer = [NSTimer scheduledTimerWithTimeInterval:2 target:self selector:@selector(handleTimer:) userInfo:nil repeats:YES];
    escapePodArray = [[NSMutableArray alloc] initWithCapacity:NUM_TO_SPAWN];
    entryQueue = [[NSMutableArray alloc] initWithCapacity:NUM_TO_SPAWN];
    
    for (int i = 1; i <= NUM_TO_SPAWN; i++)
    {
        CatchEscapePod* cep = [[CatchEscapePod alloc] init];
        [cep setLabel:i];
        //[self addChild:cep];
        [escapePodArray addObject:cep];
        [entryQueue addObject:cep];
    }
    
    [self addChild:[self pop:entryQueue]];
    // CatchSheep *ep1 = nil;
    
    int shipRadius = [entryQueue[0] radius];
    entryPoint = ccp(shipRadius + 240, shipRadius);
}

@end

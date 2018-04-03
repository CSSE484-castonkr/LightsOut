//
//  LinearLightsOutGame.m
//  LightsOut
//
//  Created by Kiana Caston on 4/2/18.
//  Copyright © 2018 Kiana Caston. All rights reserved.
//

#import "LinearLightsOutGame.h"


@implementation LinearLightsOutGame

- (id) initWithNumLights:(NSInteger) numLights {
    self = [super init];
    if (self) {
        self.gameState = @"setup";
        self.numLights = numLights;
        self.movesTaken = 0;
        for (int i = 0; i < numLights; ++i){
            lightStates[i] = NO;
        }
        [self randomize];
      
        
    }
    return self;
}

- (void) randomize {
    for(int i = 0; i <100; i++){
        int randomNumber = arc4random_uniform(self.numLights);
        [self pressedLightAtIndex: randomNumber];
    }
    self.gameState = @"play";
}

- (BOOL) pressedLightAtIndex: (NSInteger) lightIndex {
    if ([self checkWin] && ![self.gameState isEqual: @"setup"]){
        return YES;
    }
    if (lightIndex > 0){
        lightStates[lightIndex - 1] = !lightStates[lightIndex - 1];
    }
    if (lightIndex < self.numLights - 1){
        lightStates[lightIndex + 1] = !lightStates[lightIndex + 1];
    }
    lightStates[lightIndex] = !lightStates[lightIndex];
    
    if (![self.gameState isEqual: @"setup"]){
        self.movesTaken++;
    }
    
    return [self checkWin];
}

- (BOOL) isLightOnAtIndex: (NSInteger) lightIndex {
    if (lightStates[lightIndex]){
        return YES;
    }
    return NO;
}

- (BOOL) checkWin{
    for (int i = 0; i < self.numLights; ++i){
        if ([self isLightOnAtIndex:i]){
            return NO;
        }
    }
    return YES;
}

@end

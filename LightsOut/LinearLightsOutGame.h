//
//  LinearLightsOutGame.h
//  LightsOut
//
//  Created by Kiana Caston on 4/2/18.
//  Copyright © 2018 Kiana Caston. All rights reserved.
//

#import <Foundation/Foundation.h>

#define MAX_NUM_LIGHTS 100

@interface LinearLightsOutGame : NSObject {
    BOOL lightStates[MAX_NUM_LIGHTS];
}

@property (nonatomic) NSInteger movesTaken;
@property (nonatomic) NSInteger numLights;
@property (nonatomic) NSString* gameState;

- (id) initWithNumLights: (NSInteger) numLights;
- (BOOL) pressedLightAtIndex: (NSInteger) lightIndex; // returns YES if won
- (BOOL) isLightOnAtIndex: (NSInteger) lightIndex;
- (BOOL) checkWin;
- (void) randomize;

@end

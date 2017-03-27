//
//  Output.h
//  MusicGame
//
//  Created by Constantine on 27.03.17.
//  Copyright © 2017 Constantine Zubovich. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <AudioToolbox/AudioToolbox.h>

@class Output;

@protocol OutputDataSource <NSObject>

- (void)readFrames:(UInt32)frames
   audioBufferList:(AudioBufferList *)audioBufferList
        bufferSize:(UInt32 *)bufferSize;

@end

@interface Output : NSObject

@property (strong, nonatomic) id outputDataSource;

- (void)startOutputUnit;
- (void)stopOutputUnit;


@end

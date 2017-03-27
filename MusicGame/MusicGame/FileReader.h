//
//  FileReader.h
//  MusicGame
//
//  Created by Constantine on 27.03.17.
//  Copyright © 2017 Constantine Zubovich. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <AudioToolbox/AudioToolbox.h>

@class FileReader;

@protocol FileReaderDelegate <NSObject>

@optional

- (void)audioFile:(FileReader*)audioFile
  updatedPosition:(SInt64)framePosition;

@end

@interface FileReader : NSObject

@property (assign, nonatomic) SInt64 totalFramesInFile;
@property (assign, nonatomic) AudioStreamBasicDescription fileFormat;
@property (assign, nonatomic) AudioStreamBasicDescription clientFormat;
@property (strong, nonatomic) id delegate;

@property (assign, nonatomic) BOOL isReading;
@property (assign, nonatomic) BOOL reversePlayback;

@property (assign, nonatomic) SInt64 startOfFile;
@property (assign, nonatomic) SInt64 endOfFile;

@property (strong, nonatomic) NSDate *lastSeekTime;

- (FileReader *)initWithFileURL:(NSURL*)url;

- (void)readFrames:(UInt32)frames
   audioBufferList:(AudioBufferList *)audioBufferList
        bufferSize:(UInt32 *)bufferSize;

- (void)seekToFrame:(SInt64)frame;

@end

//
//  Utilities.h
//  MusicGame
//
//  Created by Constantine on 27.03.17.
//  Copyright © 2017 Constantine Zubovich. All rights reserved.
//

#import <Foundation/Foundation.h>
@import AudioToolbox;

@interface Utilities : NSObject

extern void CheckError(OSStatus error, const char *operation);

+ (void)printErrorMessage: (NSString *) errorString withStatus: (OSStatus) result;

+ (void) printASBD: (AudioStreamBasicDescription) asbd;

+ (NSString*)descriptionForAudioFormat:(AudioStreamBasicDescription) audioFormat;

+ (NSString*)descriptionForStandardFlags:(UInt32) mFormatFlags;

@end

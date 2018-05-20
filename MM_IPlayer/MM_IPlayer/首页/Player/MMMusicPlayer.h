//
//  MMMusicPlayer.h
//  MM_IPlayer
//
//  Created by MM on 2018/5/19.
//  Copyright © 2018年 MM. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <AVFoundation/AVFoundation.h>

@interface MMMusicPlayer : NSObject

+ (instancetype)defaultMusicPlayer;

- (void)nextMusicWithPath:(NSString *)path;

- (void)pauseMusic;

- (void)playerMusic;
@end

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

+ (instancetype)defaultMusicPlayerWithMusicArray:(NSArray *)array;

- (void)nextMusicWithPath:(NSString *)path;

- (void)nextMusicWithIndex:(NSInteger)index;

- (void)pauseMusic;

- (void)playerMusic;
@end

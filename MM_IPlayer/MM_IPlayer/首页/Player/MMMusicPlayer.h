//
//  MMMusicPlayer.h
//  MM_IPlayer
//
//  Created by MM on 2018/5/19.
//  Copyright © 2018年 MM. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <AVFoundation/AVFoundation.h>

typedef void(^MusicPlayEndBlock)(NSInteger index);

@class MMMusicModel;
@interface MMMusicPlayer : NSObject



@property (nonatomic,assign) MusicPlayEndBlock playEndBlock;

+ (instancetype)defaultMusicPlayer;

- (void)setUpPlayerArray:(NSArray *)array withPlayEndBlock:(MusicPlayEndBlock)handler;

- (void)nextMusicWithPath:(NSString *)path;

- (void)nextMusicWithIndex:(NSInteger)index;

- (void)pauseMusic;

- (void)playerMusic;
@end

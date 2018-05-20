//
//  MMMusicPlayer.m
//  MM_IPlayer
//
//  Created by MM on 2018/5/19.
//  Copyright © 2018年 MM. All rights reserved.
//

#import "MMMusicPlayer.h"
#import <UIKit/UIKit.h>

@interface MMMusicPlayer ()
@property (nonatomic,strong) AVPlayer *mMusicPlayer;

@property (nonatomic,copy) NSString *currentPath;
@end

@implementation MMMusicPlayer
static MMMusicPlayer *shareInstance = nil;

+ (instancetype)defaultMusicPlayer
{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        shareInstance = [[self alloc] init];
        [shareInstance setUpMusicPlayer];
    });
    return shareInstance;
}

+ (instancetype)allocWithZone:(struct _NSZone *)zone
{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        if (shareInstance == nil) {
            shareInstance = [super allocWithZone:zone];
        }
    });
    return shareInstance;
}

- (void)setUpMusicPlayer
{
    self.mMusicPlayer = [[AVPlayer alloc] init];
    
    AVAudioSession *session = [AVAudioSession sharedInstance];
    [session setActive:YES error:nil];
    [session setCategory:AVAudioSessionCategoryPlayback error:nil];
    
    [[UIApplication sharedApplication] beginReceivingRemoteControlEvents];
}

- (void)playerMusic
{
    [self.mMusicPlayer play];
}
- (void)pauseMusic
{
    [self.mMusicPlayer pause];
}
- (void)stopMusic
{
//    self.mMusicPlayer
}
- (void)nextMusicWithPath:(NSString *)path
{
    if ([path isEqualToString:self.currentPath]) {
        return;
    }
    self.currentPath = path;
    AVPlayerItem *item = [AVPlayerItem playerItemWithURL:[NSURL fileURLWithPath:path]];
    [self.mMusicPlayer replaceCurrentItemWithPlayerItem:item];
    [self playerMusic];
}
- (void)lastMusic
{
    
}
@end

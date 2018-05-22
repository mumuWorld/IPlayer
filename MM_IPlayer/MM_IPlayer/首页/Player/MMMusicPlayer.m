//
//  MMMusicPlayer.m
//  MM_IPlayer
//
//  Created by MM on 2018/5/19.
//  Copyright © 2018年 MM. All rights reserved.
//

#import "MMMusicPlayer.h"
#import <UIKit/UIKit.h>
#import "MMMusicModel.h"

@interface MMMusicPlayer ()
@property (nonatomic,strong) AVPlayer *mMusicPlayer;

@property (nonatomic,copy) NSString *currentPath;

@property (nonatomic,strong) NSMutableArray *playerArray;
@property (nonatomic,assign) NSInteger currentIndex;
@property (nonatomic,strong) MMMusicModel *currentPlayModel;
@end

@implementation MMMusicPlayer
static MMMusicPlayer *shareInstance = nil;

+ (instancetype)defaultMusicPlayerWithMusicArray:(NSArray *)array
{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        shareInstance = [[self alloc] init];
        [shareInstance setUpMusicPlayerWithArray:array];
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

- (void)setUpMusicPlayerWithArray:(NSArray *)array
{
    self.mMusicPlayer = [[AVPlayer alloc] init];
    self.playerArray =  [NSMutableArray arrayWithArray:array];
    AVAudioSession *session = [AVAudioSession sharedInstance];
    [session setActive:YES error:nil];
    [session setCategory:AVAudioSessionCategoryPlayback error:nil];
    [[UIApplication sharedApplication] beginReceivingRemoteControlEvents];
    [MM_NotificationCenter addObserver:self selector:@selector(nextObject) name:AVPlayerItemDidPlayToEndTimeNotification object:nil];
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
    [self playerMusicWithModelPath:path];
}
- (void)playerMusicWithModelPath:(NSString *)path
{
    AVPlayerItem *item = [AVPlayerItem playerItemWithURL:[NSURL fileURLWithPath:path]];
    [self.mMusicPlayer replaceCurrentItemWithPlayerItem:item];
    [self playerMusic];
}
- (void)nextMusicWithIndex:(NSInteger)index
{
    if (index ==self.currentIndex) {
        return;
    }
    self.currentPlayModel = self.playerArray[index];
    self.currentIndex = index;
    [self playerMusicWithModelPath:self.currentPlayModel.storePathName];
}
- (void)receivePlayEndNotify:(NSNotification *)notify
{
    self.currentIndex += 1;
    //判断是否是数组的最后
    if (self.currentIndex >= self.playerArray.count) {
        self.currentIndex = 0;
    }
    [self nextMusicWithIndex:self.currentIndex];
}
@end

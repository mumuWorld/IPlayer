//
//  MMPlayerViewCon.m
//  MM_IPlayer
//
//  Created by MM on 2018/5/19.
//  Copyright © 2018年 MM. All rights reserved.
//

#import "MMPlayerViewCon.h"
#import "MMMusicPlayer.h"
#import "MMMusicModel.h"

@interface MMPlayerViewCon ()
@property (weak, nonatomic) IBOutlet UIButton *pauseBtn;

@property (nonatomic,strong) NSMutableArray *playerArray;

@property (nonatomic,strong) MMMusicPlayer *mMusicPlayer;

@property (nonatomic,strong) MMMusicModel *currentPlayModel;

@property (nonatomic,assign) NSInteger currentIndex;

@property (weak, nonatomic) IBOutlet UILabel *titleLabel;

@property (weak, nonatomic) IBOutlet UIButton *titleLabelBtn;
@end

@implementation MMPlayerViewCon
+ (instancetype)playerViewControllerWithArray:(NSMutableArray *)arr indexPath:(NSIndexPath *)indexPath
{
    MMPlayerViewCon *playerVC = [[MMPlayerViewCon alloc] init];
    playerVC.currentIndex = indexPath.row;
    playerVC.playerArray = arr;
    playerVC.mMusicPlayer = [MMMusicPlayer defaultMusicPlayerWithMusicArray:playerVC.playerArray];

    return playerVC;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self startPlay];
    [self setupSubviews];
}
- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [self.navigationController setNavigationBarHidden:YES];
}
- (void)startPlay{
    self.currentPlayModel = self.playerArray[self.currentIndex];
    [self.mMusicPlayer nextMusicWithIndex:self.currentIndex];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (void)setupSubviews
{
    [self.pauseBtn setBackgroundImage:[UIImage imageNamed:@"播放"] forState:UIControlStateSelected];
    self.titleLabel.text = self.currentPlayModel.musicName;
}
#pragma mark - ----------------------Target
- (IBAction)lastBtnClick:(id)sender {
    //判断是否是第一个
    if (self.currentIndex == 0) {
        self.currentIndex = self.playerArray.count;
    } else {
        self.currentIndex -= 1;
    }
}
- (IBAction)playAndPauseClick:(id)sender {
    UIButton *btn = sender;
    if ((btn.selected = !btn.selected)) {
        [self.mMusicPlayer pauseMusic];
    } else {
        [self.mMusicPlayer playerMusic];
    }
    
}
- (IBAction)nextBtnClick:(id)sender {
    //判断是否是数组的最后
    if (self.currentIndex >= self.playerArray.count -1) {
        self.currentIndex = 0;
    } else {
        self.currentIndex += 1;
    }
}
- (void)setCurrentIndex:(NSInteger)currentIndex
{
    _currentIndex = currentIndex;
    [self startPlay];
}
- (IBAction)shareBtnClick:(id)sender {
}
- (IBAction)popBtnClick:(id)sender {
}
- (IBAction)titleBtnClick:(id)sender {
}

-(void)dealloc
{
    NSLog(@"%s",__func__);
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end

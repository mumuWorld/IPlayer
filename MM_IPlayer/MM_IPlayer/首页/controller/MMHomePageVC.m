//
//  MMHomePageVC.m
//  MM_IPlayer
//
//  Created by MM on 2018/5/16.
//  Copyright © 2018年 MM. All rights reserved.
//

#import "MMHomePageVC.h"
#import "MMManageMusicFile.h"
#import "MMMusicModel.h"
#import "MMMusicFileTVCell.h"
#import "MMPlayerViewCon.h"

@interface MMHomePageVC ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic,strong) UITableView *musTableView;

@property (nonatomic,strong) NSMutableArray *musArray;

@end

@implementation MMHomePageVC
static NSString *reuseID = @"musTableView";
- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor redColor];
    NSLog(@"%s->str=%@",__func__,NSHomeDirectory());
    // Do any additional setup after loading the view.
    [self setUpSubViews];
}
- (void)setUpSubViews
{
    [self.view addSubview:self.musTableView];
}
- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    [self.navigationController setNavigationBarHidden:NO];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
#pragma mark - ----------------------DataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.musArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    MMMusicFileTVCell *cell = [tableView dequeueReusableCellWithIdentifier:reuseID];
    cell.musicModel = self.musArray[indexPath.row];
    return cell;
}
#pragma mark - ----------------------Delegate
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    MMPlayerViewCon *playerVC = [MMPlayerViewCon playerViewControllerWithArray:self.musArray indexPath:indexPath];
    self.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:playerVC animated:YES];
    self.hidesBottomBarWhenPushed = NO;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 56;
}
#pragma mark - ----------------------GET
- (UITableView *)musTableView
{
    if (!_musTableView) {
        _musTableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, ScreenWidth, ScreenHeight) style:UITableViewStylePlain];
        _musTableView.delegate = self;
        _musTableView.dataSource = self;
//        _musTableView.estimatedRowHeight = 56.00;
//        _musTableView.rowHeight = UITableViewAutomaticDimension;
        [_musTableView registerNib:[UINib nibWithNibName:[MMMusicFileTVCell classString] bundle:nil] forCellReuseIdentifier:reuseID];
    }
    return _musTableView;
}
- (NSMutableArray *)musArray
{
    if (!_musArray) {
        NSArray *arr = [MMManageMusicFile getAllMusicArray];
        NSMutableArray *tmp = [NSMutableArray new];
        for (int i=0; i<arr.count; i++) {
            MMMusicModel *model = [MMMusicModel musicModelWithArray:arr[i]];
            [tmp addObject:model];
        }
        _musArray = tmp;
    }
    return _musArray;
}
- (void)dealloc
{
    NSLog(@"%s",__func__);
}
@end

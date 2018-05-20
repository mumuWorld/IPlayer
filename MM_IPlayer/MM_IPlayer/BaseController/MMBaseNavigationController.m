//
//  MMNavigationController.m
//  MM_IPlayer
//
//  Created by MM on 2018/5/16.
//  Copyright © 2018年 MM. All rights reserved.
//

#import "MMBaseNavigationController.h"

@interface MMBaseNavigationController ()<UIGestureRecognizerDelegate>

@end

@implementation MMBaseNavigationController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupPopGestureRecognizer];
    // Do any additional setup after loading the view.
}
- (void)setupPopGestureRecognizer
{
//    self.interactivePopGestureRecognizer.delegate = self;
    //    全屏滑动返回优化
    UIPanGestureRecognizer *panGes = [[UIPanGestureRecognizer alloc] initWithTarget:self.interactivePopGestureRecognizer.delegate action:@selector(handleNavigationTransition:)];
    [self.view addGestureRecognizer:panGes];
    panGes.delegate = self;
    //    禁止自己的边缘手势
    self.interactivePopGestureRecognizer.enabled = NO;
}
#pragma mark - ----------------------UIGestureRecognizerDelegate
- (BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldReceiveTouch:(UITouch *)touch
{
    return self.childViewControllers.count >1;
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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

//
//  MMTabBarViewController.m
//  MM_IPlayer
//
//  Created by MM on 2018/5/15.
//  Copyright © 2018年 MM. All rights reserved.
//

#import "MMTabBarViewController.h"
#import "MMHomeNavigationC.h"

@interface MMTabBarViewController ()

@end

@implementation MMTabBarViewController

+ (instancetype)tabBarViewController
{
    UIStoryboard *board = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    MMTabBarViewController *mainTabVC = [board instantiateViewControllerWithIdentifier:@"MMTabBarViewController"];
//    [mainTabVC addChildViewController:[MMHomeNavigationC homeNavigationController]];
    return mainTabVC;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
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

//
//  MMPlayerViewCon.h
//  MM_IPlayer
//
//  Created by MM on 2018/5/19.
//  Copyright © 2018年 MM. All rights reserved.
//

#import <UIKit/UIKit.h>

@class MMMusicModel;
@interface MMPlayerViewCon : UIViewController
+ (instancetype)playerViewControllerWithArray:(NSMutableArray *)arr indexPath:(NSIndexPath *)indexPath;
@end

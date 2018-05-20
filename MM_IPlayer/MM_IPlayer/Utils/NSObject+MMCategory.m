//
//  NSObject+MMCategory.m
//  MM_IPlayer
//
//  Created by MM on 2018/5/19.
//  Copyright © 2018年 MM. All rights reserved.
//

#import "NSObject+MMCategory.h"

@implementation NSObject (MMCategory)
+ (NSString *)classString
{
    return NSStringFromClass([self class]);
}
@end

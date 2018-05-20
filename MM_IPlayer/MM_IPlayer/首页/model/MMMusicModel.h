//
//  MMMusicModel.h
//  MM_IPlayer
//
//  Created by MM on 2018/5/19.
//  Copyright © 2018年 MM. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MMMusicModel : NSObject

@property (nonatomic,copy) NSString *FullName;

@property (nonatomic,copy) NSString *musicName;

@property (nonatomic,copy) NSString *storePathName;

+ (instancetype)musicModelWithArray:(NSString *)name;

@end

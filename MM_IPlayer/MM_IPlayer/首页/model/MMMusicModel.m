//
//  MMMusicModel.m
//  MM_IPlayer
//
//  Created by MM on 2018/5/19.
//  Copyright © 2018年 MM. All rights reserved.
//

#import "MMMusicModel.h"
#import "MMManageMusicFile.h"

@implementation MMMusicModel
+ (instancetype)musicModelWithArray:(NSString *)name
{
    if (!name) {
        return nil;
    }
    
    MMMusicModel *model = [MMMusicModel new];
    model.FullName = name;
    model.musicName = [name componentsSeparatedByString:@"."][0];
    model.storePathName = [[MMManageMusicFile getDocumentPath] stringByAppendingPathComponent:name];
    
    return model;
}
@end

//
//  MMManageMusicFile.h
//  MM_IPlayer
//
//  Created by MM on 2018/5/19.
//  Copyright © 2018年 MM. All rights reserved.
//

#import <UIKit/UIKit.h>



@interface MMManageMusicFile : NSObject
+ (NSArray *)getAllMusicArray;

+ (NSString *)getDocumentPath;
@end

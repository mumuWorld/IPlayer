//
//  MMManageMusicFile.m
//  MM_IPlayer
//
//  Created by MM on 2018/5/19.
//  Copyright © 2018年 MM. All rights reserved.
//

#import "MMManageMusicFile.h"


@implementation MMManageMusicFile

+ (NSArray *)getAllMusicArray
{
    NSFileManager *defaultManager = [NSFileManager defaultManager];
    NSArray *tmpArr = [defaultManager contentsOfDirectoryAtPath:[self getDocumentPath] error:nil];
    
    NSLog(@"%s->tmpArr=%@",__func__,tmpArr);
    int i = 0;
    NSString *path = nil;
    for (NSString *tmpStr in tmpArr) {
        path = [[self getDocumentPath] stringByAppendingPathComponent:tmpArr[i++]];
        NSDictionary *attribute = [defaultManager attributesOfItemAtPath:path error:nil];
//        NSLog(@"%s->attribute=%@",__func__,attribute);
    }
    
    return tmpArr;
}

+ (NSString *)getDocumentPath
{
    return [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) objectAtIndex:0];
}
//+ (NSString *)getSubDocumentPath
//{
//
//}
@end

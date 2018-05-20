//
//  NSDictionary+MMSafeCategory.m
//  MM_IPlayer
//
//  Created by MM on 2018/5/19.
//  Copyright © 2018年 MM. All rights reserved.
//

#import "NSDictionary+MMSafeCategory.h"

@implementation NSDictionary (MMSafeCategory)

- (id)safeObjectForKey:(id)aKey
{
    id object = [self objectForKey:aKey];
    if (object == [NSNull null]) {
        return nil;
    }
    return object;
}


@end
@implementation NSMutableDictionary (MMSafeCategory)

- (void)safeSetObject:(id)anObject forKey:(id)aKey{
    if(!aKey) {
        return;
    }
    if(anObject) {
        [self setObject:anObject forKey:aKey];
    }
}

- (void)safeRemoveObjectForKey:(id)aKey {
    if(aKey) {
        [self removeObjectForKey:aKey];
    }
}
@end
#pragma mark - ----------------------NSArray
@implementation NSArray (MMSafeCategory)

- (id)safeObjectAtIndex:(NSUInteger)index {
    if (index < self.count) {
        id object = self[index];
        if (object == [NSNull null]) {
            return nil;
        }
        return object;
    }
    return nil;
}

@end


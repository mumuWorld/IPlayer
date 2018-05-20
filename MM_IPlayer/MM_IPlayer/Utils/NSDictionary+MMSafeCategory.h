//
//  NSDictionary+MMSafeCategory.h
//  MM_IPlayer
//
//  Created by MM on 2018/5/19.
//  Copyright © 2018年 MM. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSDictionary (MMSafeCategory)

- (id)safeObjectForKey:(id)aKey;

@end

@interface NSMutableDictionary (MMSafeCategory)
- (void)safeSetObject:(id)anObject forKey:(id)aKey;
- (void)safeRemoveObjectForKey:(id)aKey;
@end


@interface NSArray (MMSafeCategory)

- (id)safeObjectAtIndex:(NSUInteger)index;
@end

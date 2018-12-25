//
//  XLClassUtils.h
//  XLFramework
//
//  Created by Jack Wang on 2018/11/9.
//  Copyright © 2018 Jack Wang. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface XLClassUtils : NSObject


/**
 获得父类的子类(NSArray <Class>*)

 @param baseClass 父类
 @return 子类的数组
 */
+ (NSArray <Class>*)findAllSubclassWithBaseClass:(Class)baseClass;

/**
 获得父类的子类(NSArray <NSString *>*)

 @param baseClass 父类
 @return 子类的数组
 */
+ (NSArray <NSString *>*)findAllSubclassStrWithBaseClass:(Class)baseClass;


@end

NS_ASSUME_NONNULL_END

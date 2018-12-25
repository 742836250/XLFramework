//
//  XLClassUtils.m
//  XLFramework
//
//  Created by Jack Wang on 2018/11/9.
//  Copyright © 2018 Jack Wang. All rights reserved.
//

#import "XLClassUtils.h"
#import <objc/runtime.h>

@implementation XLClassUtils

+ (NSArray <Class>*)findAllSubclassWithBaseClass:(Class)baseClass
{
    int count = objc_getClassList(NULL, 0);
    if (count <= 0)
        
    {
        @throw@"Couldn't retrieve Obj-C class-list";
        return [NSArray arrayWithObject:baseClass];
    }
    NSMutableArray *output = [NSMutableArray arrayWithObject:baseClass];
    Class *classes = (Class *) malloc(sizeof(Class) * count);
    objc_getClassList(classes, count);
    for (int i = 0; i < count; ++i)
    {
        if (baseClass == class_getSuperclass(classes[i]))//子类
        {
            [output addObject:classes[i]];
        }
    }
    free(classes);
    if ([output containsObject:baseClass])
    {
        [output removeObject:baseClass];
    }
    return [NSArray arrayWithArray:output];
}

/**
 获得父类的子类(NSArray <NSString *>*)
 
 @param baseClass 父类
 @return 子类的数组
 */
+ (NSArray <NSString *>*)findAllSubclassStrWithBaseClass:(Class)baseClass
{
    int count = objc_getClassList(NULL, 0);
    if (count <= 0)
        
    {
        @throw@"Couldn't retrieve Obj-C class-list";
        return [NSArray arrayWithObject:baseClass];
    }
    NSMutableArray *output = [NSMutableArray arrayWithObject:baseClass];
    Class *classes = (Class *) malloc(sizeof(Class) * count);
    objc_getClassList(classes, count);
    for (int i = 0; i < count; ++i)
    {
        if (baseClass == class_getSuperclass(classes[i]))//子类
        {
            NSString *classStr = NSStringFromClass(classes[i]);
            [output addObject:classStr];
        }
    }
    free(classes);
    if ([output containsObject:baseClass])
    {
        [output removeObject:baseClass];
    }
    return [NSArray arrayWithArray:output];
}

@end

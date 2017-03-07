//
//  Category.m
//  mycategory
//
//  Created by 希毛吹雪 on 2017/3/7.
//  Copyright © 2017年 希毛吹雪. All rights reserved.
//

#import "Category.h"

@implementation Category

+(instancetype)categoryWithDict:(NSDictionary *)dict
{
    Category *c = [[self alloc] init];
    [c setValuesForKeysWithDictionary:dict];
    return c;
}


@end

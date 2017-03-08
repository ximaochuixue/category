//
//  Category.h
//  mycategory
//
//  Created by 希毛吹雪 on 2017/3/7.
//  Copyright © 2017年 希毛吹雪. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Category : NSObject


@property (nonatomic,strong) NSArray *subcategories;

@property (nonatomic,strong) NSString *name;

@property (nonatomic,strong) NSString *icon;

@property (nonatomic,strong) NSString *highlighted_icon;

+(instancetype)categoryWithDict:(NSDictionary *)dict;

@end

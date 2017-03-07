//
//  ViewController.m
//  mycategory
//
//  Created by 希毛吹雪 on 2017/3/7.
//  Copyright © 2017年 希毛吹雪. All rights reserved.
//

#import "ViewController.h"
#import "Category.h"

@interface ViewController ()<UITableViewDelegate,UITableViewDataSource>

@property (weak, nonatomic) IBOutlet UITableView *categroyTableView;

@property (weak, nonatomic) IBOutlet UITableView *SubcategoryTableview;

@property (nonatomic, strong) NSArray *categories;

@end

@implementation ViewController

-(NSArray *) categories
{
    if (_categories == nil) {
        NSArray * dictArray = [NSArray arrayWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"categories" ofType:@"plist"]];
        
        NSMutableArray *categoryArray = [NSMutableArray array];
        
        for(NSDictionary *dict in dictArray){
            [categoryArray addObject:[Category categoryWithDict:dict]];
        }
        _categories = categoryArray;
    }
    return  _categories;
}


- (void)viewDidLoad {
    [super viewDidLoad];
   
    [self.categroyTableView selectRowAtIndexPath:[NSIndexPath indexPathForRow:0 inSection:0] animated:NO scrollPosition:UITableViewScrollPositionTop];
    
    self.SubcategoryTableview.contentInset = UIEdgeInsetsMake(64, 0, 0, 0);
    
}

//
//- (void) viewDidAppear:(BOOL)animated
//{
//    [super viewDidAppear:animated];
//    
//    
//}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (tableView == self.categroyTableView) {
        return self.categories.count;
    }
    
    Category *c = self.categories[self.categroyTableView.indexPathForSelectedRow.row];
    return c.SubCategory.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (tableView == self.categroyTableView) {
        static NSString *ID = @"category";
        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
        Category *c = self.categories[indexPath.row];
        
        cell.imageView.image = [UIImage imageNamed:c.icon];
        cell.imageView.highlightedImage = [UIImage imageNamed:c.highlighted_icon];
        cell.textLabel.text = c.name;
        cell.textLabel.highlightedTextColor = [UIColor greenColor];
        
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
        
        return cell;
        
    }else{
        static NSString *ID = @"subcategory";
        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
        
        Category *c = self.categories[self.categroyTableView.indexPathForSelectedRow.row];
        cell.textLabel.text = c.SubCategory[indexPath.row];
        
        return cell;
    }
    
    
}



-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (tableView == self.categroyTableView) {
        [self.SubcategoryTableview reloadData];
    }
}














@end

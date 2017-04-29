//
//  ViewController.m
//  HBIndexMenu
//
//  Created by Keen on 2017/4/24.
//  Copyright © 2017年 Keen. All rights reserved.
//

#import "ViewController.h"
#import "HBIndexView.h"

@interface ViewController () {
    IBOutlet HBIndexView *indexView;
    IBOutlet UILabel *labIndexTitle;
}

@property (nonatomic, copy) NSString *selectedTitle;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    labIndexTitle.alpha = 0.0;
    labIndexTitle.textColor = [UIColor orangeColor];
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    
    NSMutableArray *arr = [[NSMutableArray alloc] init];
    
//    for (int letter = 'A'; letter <= 'Z'; letter++) {
//        [arr addObject:[NSString stringWithFormat:@"%c",letter]];
//    }
    
    [arr addObjectsFromArray:@[
                               @"一鸣惊人",
                               @"两全其美",
                               @"三山五岳",
                               @"四海升平",
                               @"五花八门",
                               @"六神无主",
                               @"七情六欲",
                               @"八面玲珑",
                               @"九霄云外",
                               @"十面埋伏",
                               @"百发百中",
                               @"千秋万载",
                               @"万无一失"
                               ]];
    
    [indexView refreshIndexTitleArr:arr progress:^(NSInteger index) {

    } finish:^(NSInteger index) {
        self.selectedTitle = [arr objectAtIndex:index];
    }];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)setSelectedTitle:(NSString *)selectedTitle {
    _selectedTitle = selectedTitle;
    
    labIndexTitle.text = selectedTitle;
    labIndexTitle.alpha = 1.0;
    [UIView animateWithDuration:1.0 animations:^{
        labIndexTitle.alpha = 0.0;
    }];
}

@end

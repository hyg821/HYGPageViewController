//
//  myController.m
//  HYGPage
//
//  Created by 侯英格 on 16/4/29.
//  Copyright © 2016年 侯英格. All rights reserved.
//

#import "myController.h"

@interface myController ()
@property(nonatomic,strong)UILabel*lab;
@end

@implementation myController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor=[UIColor greenColor];
    self.lab=[UILabel new];
    self.lab.font=[UIFont systemFontOfSize:35];
    self.lab.textAlignment=NSTextAlignmentCenter;
    self.lab.text=@"xixixix";
    [self.view addSubview:self.lab];
}

-(void)viewDidLayoutSubviews{
    self.lab.frame=self.view.frame;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end

//
//  ViewController.m
//  HYGPage
//
//  Created by 侯英格 on 16/4/28.
//  Copyright © 2016年 侯英格. All rights reserved.
//

#import "ViewController.h"
#import "HYGProfessionPageViewController.h"
#import "myController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}
- (IBAction)pushToHYGVC:(id)sender {
    
    NSMutableDictionary*dic=[NSMutableDictionary dictionary];
    [dic setValue:[myController new] forKey:@"索尼"];
    [dic setValue:[myController new] forKey:@"苹果"];
    [dic setValue:[myController new] forKey:@"史克威尔艾尼克斯"];
    [dic setValue:[myController new] forKey:@"万代"];
    [dic setValue:[myController new] forKey:@"魔兽世界"];
    [dic setValue:[myController new] forKey:@"京东商城"];
    [dic setValue:[myController new] forKey:@"最终幻想"];
    [dic setValue:[myController new] forKey:@"口袋妖怪"];
    [dic setValue:[myController new] forKey:@"逆转裁判"];
    
    
    HYGProfessionPageViewController*vc=[HYGProfessionPageViewController creatPageVCWithTitle:@"题目" andVCDic:[dic copy] andHeaderViewLocationType:bottomNavigationBar andHeaderViewStyleType:styleOne andSelectIndex:2];
    [self.navigationController pushViewController:vc animated:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end

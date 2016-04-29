//
//  HYGProfessionPageViewController.h
//  HYGPage
//
//  Created by 侯英格 on 16/4/28.
//  Copyright © 2016年 侯英格. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "HYGHeaderRootView.h"
#import "HYGContainerRootView.h"

typedef NS_ENUM(NSInteger, headerViewLocationType) {
    onNavigantionBar=0,
    bottomNavigationBar
};

typedef NS_ENUM(NSInteger, headerViewStyleType) {
    styleOne=0
};

@interface HYGProfessionPageViewController : UIViewController
@property(nonatomic,strong)HYGHeaderRootView*headerRootView;
@property(nonatomic,strong)HYGContainerRootView*containerRootView;

@property(nonatomic,assign)NSInteger selectIndex;

@property(nonatomic,copy)NSString*HYG_title;
@property(nonatomic,strong)NSMutableArray*childTitleArray;
@property(nonatomic,strong)NSMutableArray*childVCArray;
@property(nonatomic,assign)headerViewLocationType locationType;
@property(nonatomic,assign)headerViewStyleType styleType;

@property(nonatomic,assign)CGFloat headerRootViewHeight;

+(HYGProfessionPageViewController*)creatPageVCWithTitle:(NSString*)title andVCDic:(NSDictionary*)vcDic andHeaderViewLocationType:(headerViewLocationType)locationType andHeaderViewStyleType:(headerViewStyleType)styleType andSelectIndex:(NSInteger)selectIndex;
-(void)creatPageVCWithTitle:(NSString*)title andVCDic:(NSDictionary*)vcDic andHeaderViewLocationType:(headerViewLocationType)locationType andHeaderViewStyleType:(headerViewStyleType)styleType andSelectIndex:(NSInteger)selectIndex;


@end

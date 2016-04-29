//
//  HYGProfessionPageViewController.m
//  HYGPage
//
//  Created by 侯英格 on 16/4/28.
//  Copyright © 2016年 侯英格. All rights reserved.
//

#import "HYGProfessionPageViewController.h"

#define UIX [[UIScreen mainScreen] bounds].origin.x
#define UIY [[UIScreen mainScreen] bounds].origin.y
#define UIH [[UIScreen mainScreen] bounds].size.height
#define UIW [[UIScreen mainScreen] bounds].size.width

#define NAVIBARHEIGHT 64

@interface HYGProfessionPageViewController ()
@property(nonatomic,strong)NSNotificationCenter*notificationCenter;
@end

@implementation HYGProfessionPageViewController

+(HYGProfessionPageViewController*)creatPageVCWithTitle:(NSString*)title andVCDic:(NSMutableDictionary*)vcDic andHeaderViewLocationType:(headerViewLocationType)locationType andHeaderViewStyleType:(headerViewStyleType)styleType andSelectIndex:(NSInteger)selectIndex{
    HYGProfessionPageViewController*pageVC=[[HYGProfessionPageViewController alloc] init];
    [pageVC creatPageVCWithTitle:title andVCDic:vcDic andHeaderViewLocationType:locationType andHeaderViewStyleType:styleType andSelectIndex:selectIndex];
    return pageVC;
}

-(void)creatPageVCWithTitle:(NSString*)title andVCDic:(NSMutableDictionary*)vcDic andHeaderViewLocationType:(headerViewLocationType)locationType andHeaderViewStyleType:(headerViewStyleType)styleType andSelectIndex:(NSInteger)selectIndex{
    self.HYG_title=title;
    self.childTitleArray=[[vcDic allKeys] mutableCopy];
    self.childVCArray=[[vcDic allValues] mutableCopy];
    self.locationType=locationType;
    self.styleType=styleType;
    self.selectIndex=selectIndex;
    [self layoutFrameWithType];
    [self creatNotificationCenter];
}

-(void)creatNotificationCenter{
    self.notificationCenter=[NSNotificationCenter defaultCenter];
    [self.notificationCenter addObserver:self selector:@selector(getHeaderViewNotification:) name:@"header" object:nil];
    [self.notificationCenter addObserver:self selector:@selector(getContainerViewNotification:) name:@"container" object:nil];
}

-(void)getHeaderViewNotification:(NSNotification*)notification{
    NSInteger selectIndex=[notification.userInfo[@"header"] integerValue];
    self.containerRootView.selectIndex=selectIndex;
}

-(void)getContainerViewNotification:(NSNotification*)notification{
    NSInteger selectIndex=[notification.userInfo[@"container"] integerValue];
    self.headerRootView.selectIndex=selectIndex;
}


-(instancetype)init{
    self=[super init];
    [self prepareForInitialize];
    return self;
}

-(instancetype)initWithCoder:(NSCoder *)aDecoder{
    self=[super initWithCoder:aDecoder];
    [self prepareForInitialize];
    return self;
}

-(instancetype)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil{
    self=[super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    [self prepareForInitialize];
    return self;
}

-(void)prepareForInitialize{
    self.view.backgroundColor=[UIColor whiteColor];
    self.automaticallyAdjustsScrollViewInsets=NO;
    //default
    self.headerRootViewHeight=45;
    self.hidesBottomBarWhenPushed=YES;
}

-(void)layoutFrameWithType{
    if (self.locationType==onNavigantionBar) {
        self.headerRootView.frame=CGRectMake(0, 0, UIW, self.headerRootViewHeight);
        if (self.navigationItem) {
            self.navigationItem.titleView=self.headerRootView;
        }
        self.containerRootView.frame=CGRectMake(0, NAVIBARHEIGHT, UIW, UIH-NAVIBARHEIGHT);
        [self.view addSubview:self.containerRootView];
        
    }else if (self.locationType==bottomNavigationBar){
        self.title=self.HYG_title;
        self.headerRootView.frame=CGRectMake(0, NAVIBARHEIGHT, UIW, self.headerRootViewHeight);
        self.containerRootView.frame=CGRectMake(0, CGRectGetMaxY(self.headerRootView.frame), UIW, UIH-NAVIBARHEIGHT-self.headerRootViewHeight);
        [self.view addSubview:self.headerRootView];
        [self.view addSubview:self.containerRootView];
    }
}

-(void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    NSLog(@"%@",self);
}


#pragma mark ----------setWay && getWay----------

-(void)setHYG_title:(NSString *)HYG_title{
    _HYG_title=HYG_title;
}

-(void)setChildVCArray:(NSMutableArray *)childVCArray{
    _childVCArray=childVCArray;
    for (id obj in _childVCArray) {
        if ([obj isKindOfClass:[UIViewController class]]) {
            [self addChildViewController:obj];
            NSLog(@"%@",obj);
        }
    }
    
}

-(void)setLocationType:(headerViewLocationType)locationType{
    _locationType=locationType;
}

-(void)setStyleType:(headerViewStyleType)styleType{
    _styleType=styleType;
}

-(void)setHeaderRootViewHeight:(CGFloat)headerRootViewHeight{
    _headerRootViewHeight=headerRootViewHeight;
}

-(HYGHeaderRootView *)headerRootView{
    if (!_headerRootView) {
        //待会要改
        _headerRootView=[[HYGHeaderRootView alloc] init];
        _headerRootView.titleArray=self.childTitleArray;
        [_headerRootView prepareForInitialize];
        _headerRootView.selectIndex=self.selectIndex;
    }
    return _headerRootView;
}

-(HYGContainerRootView *)containerRootView{
    if (!_containerRootView) {
        //待会要改
        _containerRootView=[[HYGContainerRootView alloc] init];
        _containerRootView.vcArray=self.childVCArray;
        [_containerRootView prepareForInitialize];
        _containerRootView.selectIndex=self.selectIndex;
    }
    return _containerRootView;
}

-(void)dealloc{
    NSLog(@"2");
}

@end

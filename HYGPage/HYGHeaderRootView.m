//
//  HYGHeaderRootView.m
//  HYGPage
//
//  Created by 侯英格 on 16/4/28.
//  Copyright © 2016年 侯英格. All rights reserved.
//

#import "HYGHeaderRootView.h"
#import "HeaderCollectionCell.h"

@interface HYGHeaderRootView()<UICollectionViewDelegate,UICollectionViewDataSource>
@property(nonatomic,assign)BOOL isNeedFull;
@property(nonatomic,assign)CGFloat totleWeight;
@property(nonatomic,strong)NSMutableArray*itemWeigthArray;
@end

@implementation HYGHeaderRootView

static NSString * cellIdentifier=@"HeaderCollectionCell";

-(HYGHeaderRootView*)init{
    self=[super init];
    return self;
}

-(void)prepareForInitialize{
    [self addSubview:self.headerCollectionView];
    [self addObserver:self forKeyPath:@"layer.bounds" options:NSKeyValueObservingOptionNew|
     NSKeyValueObservingOptionOld context:nil];
    [self.headerCollectionView registerNib:[UINib nibWithNibName:cellIdentifier bundle:[NSBundle mainBundle]] forCellWithReuseIdentifier:cellIdentifier];
    
    self.isNeedFull=NO;
    self.totleWeight=0;
    self.itemWeigthArray=[NSMutableArray array];
    for (NSString*str in self.titleArray) {
        CGSize strSize=[str sizeWithAttributes: @{NSFontAttributeName: [UIFont fontWithName:@"HelveticaNeue" size:14]}];
        CGFloat weight=strSize.width+20;
        self.totleWeight+=weight;
        [self.itemWeigthArray addObject:@(weight)];
    }
}

-(void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context
{
    if([keyPath isEqualToString:@"layer.bounds"]){
        [self layoutFrame];
    }
}

-(void)layoutFrame{
    self.headerCollectionView.frame=self.bounds;
    if (self.totleWeight<self.frame.size.width) {
        [self.itemWeigthArray removeAllObjects];
        for (int i=0; i<self.titleArray.count; i++) {
            CGFloat weight=self.bounds.size.width/self.titleArray.count;
            [self.itemWeigthArray addObject:@(weight)];
        }
        [self.headerCollectionView reloadData];
    }
}

-(HeaderCollectionView *)headerCollectionView{
    if (!_headerCollectionView) {
        UICollectionViewFlowLayout*layout=[[UICollectionViewFlowLayout alloc] init];
        layout.scrollDirection=UICollectionViewScrollDirectionHorizontal;
        layout.minimumLineSpacing=1;
        layout.minimumInteritemSpacing=1;
        _headerCollectionView=[[HeaderCollectionView alloc] initWithFrame:CGRectZero collectionViewLayout:layout];
        _headerCollectionView.showsVerticalScrollIndicator=NO;
        _headerCollectionView.showsHorizontalScrollIndicator=NO;
        _headerCollectionView.backgroundColor=[UIColor clearColor];
        _headerCollectionView.delegate=self;
        _headerCollectionView.dataSource=self;
    }
    return _headerCollectionView;
}


- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return self.titleArray.count;
}

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    return 1;
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath{
    return CGSizeMake([[self.itemWeigthArray objectAtIndex:indexPath.row] doubleValue], self.bounds.size.height);
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    HeaderCollectionCell*cell=[collectionView dequeueReusableCellWithReuseIdentifier:cellIdentifier forIndexPath:indexPath];
    cell.titleLab.text=[self.titleArray objectAtIndex:indexPath.row];
    if (indexPath.row==self.selectIndex) {
        cell.titleLab.textColor=[UIColor redColor];
        cell.titleLab.font=[UIFont systemFontOfSize:16];
    }else{
        cell.titleLab.textColor=[UIColor blackColor];
        cell.titleLab.font=[UIFont systemFontOfSize:14];
    }
    return cell;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    self.selectIndex=indexPath.row;
    [self.headerCollectionView reloadData];
    NSNotification *notification =[NSNotification notificationWithName:@"header" object:nil userInfo:@{@"header":@(self.selectIndex)}];
    [[NSNotificationCenter defaultCenter] postNotification:notification];
}


-(void)setSelectIndex:(NSInteger)selectIndex{
    _selectIndex=selectIndex;
    [self scrollToIndexWithAnimated:YES];
}

-(void)didMoveToSuperview{
    [super didMoveToSuperview];
    [self scrollToIndexWithAnimated:NO];
}

-(void)scrollToIndexWithAnimated:(BOOL)animated{
    [self.headerCollectionView reloadData];
    NSIndexPath*index=[NSIndexPath indexPathForRow:_selectIndex inSection:0];
    [self.headerCollectionView scrollToItemAtIndexPath:index atScrollPosition:UICollectionViewScrollPositionCenteredHorizontally animated:animated];
}

-(void)dealloc{
    [self removeObserver:self forKeyPath:@"layer.bounds" context:nil];
}

@end

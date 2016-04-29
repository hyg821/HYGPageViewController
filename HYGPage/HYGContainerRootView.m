//
//  HYGContainerRootView.m
//  HYGPage
//
//  Created by 侯英格 on 16/4/28.
//  Copyright © 2016年 侯英格. All rights reserved.
//

#import "HYGContainerRootView.h"
#import "ContainerCollectionCell.h"
@interface HYGContainerRootView()<UICollectionViewDelegate,UICollectionViewDataSource>
@end

@implementation HYGContainerRootView

static NSString * cellIdentifier=@"ContainerCollectionCell";

-(void)prepareForInitialize{
    [self addObserver:self forKeyPath:@"layer.bounds" options:NSKeyValueObservingOptionNew|
     NSKeyValueObservingOptionOld context:nil];
    self.containerCollectionView.backgroundColor=[UIColor yellowColor];
    [self.containerCollectionView registerNib:[UINib nibWithNibName:cellIdentifier bundle:[NSBundle mainBundle]] forCellWithReuseIdentifier:cellIdentifier];
    [self addSubview:self.containerCollectionView];
    [self.containerCollectionView reloadData];
}

-(void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context
{
    if([keyPath isEqualToString:@"layer.bounds"]){
        [self layoutFrame];
    }
}

-(void)layoutFrame{
    self.containerCollectionView.frame=self.bounds;
}

-(ContainerCollectionView *)containerCollectionView{
    if (!_containerCollectionView) {
        UICollectionViewFlowLayout*layout=[[UICollectionViewFlowLayout alloc] init];
        layout.scrollDirection=UICollectionViewScrollDirectionHorizontal;
        layout.minimumLineSpacing=0;
        layout.minimumInteritemSpacing=0;
        _containerCollectionView=[[ContainerCollectionView alloc] initWithFrame:CGRectZero collectionViewLayout:layout];
        _containerCollectionView.pagingEnabled=YES;
        _containerCollectionView.bounces=NO;
        _containerCollectionView.showsVerticalScrollIndicator=NO;
        _containerCollectionView.showsHorizontalScrollIndicator=NO;
        _containerCollectionView.backgroundColor=[UIColor clearColor];
        _containerCollectionView.delegate=self;
        _containerCollectionView.dataSource=self;
    }
    return _containerCollectionView;
}


- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return self.vcArray.count;
}

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    return 1;
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath{
    return CGSizeMake(self.bounds.size.width, self.bounds.size.height);
}


- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    ContainerCollectionCell*cell=[ContainerCollectionCell dequeueReusableCellWithReuseIdentifier:cellIdentifier forIndexPath:indexPath withCollectionView:self.containerCollectionView andChildVC:[self.vcArray objectAtIndex:indexPath.row]];
    [cell showChildController];
    return cell;
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
    NSIndexPath*index=[NSIndexPath indexPathForRow:_selectIndex inSection:0];
    [self.containerCollectionView scrollToItemAtIndexPath:index atScrollPosition:UICollectionViewScrollPositionCenteredHorizontally animated:animated];
}

-(void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView{
    NSInteger selectIndex=scrollView.contentOffset.x/self.frame.size.width;
    NSNotification *notification =[NSNotification notificationWithName:@"container" object:nil userInfo:@{@"container":@(selectIndex)}];
    [[NSNotificationCenter defaultCenter] postNotification:notification];
}


-(void)dealloc{
    [self removeObserver:self forKeyPath:@"layer.bounds" context:nil];
}


@end

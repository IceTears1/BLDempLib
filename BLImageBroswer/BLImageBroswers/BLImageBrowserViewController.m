//
//  BLImageBrowserViewController.m
//  BLImagePickerVCDemo
//
//  Created by 冰泪 on 2017/8/7.
//  Copyright © 2017年 冰泪. All rights reserved.
//

#import "BLImageBrowserViewController.h"
#import "BLImageBrowserCell.h"
#import "BLImageBrowserConfig.h"
#define DeviceMaxHeight ([UIScreen mainScreen].bounds.size.height)
#define DeviceMaxWidth ([UIScreen mainScreen].bounds.size.width)
@interface BLImageBrowserViewController ()<UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout>

@end

@implementation BLImageBrowserViewController
- (instancetype)init
{
    self = [super init];
    if (self) {
        self.zoom = 1.0;
        self.maxZoom = 2.0;
        self.minZoom = 1.0;
        self.contentMode = UIViewContentModeScaleAspectFit;
        self.bounces = NO;
        self.showShareBtn = YES;
        self.showIndexBtn = YES;
        self.isShuffling = YES;
    }
    return self;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor blackColor];
    [self.view addSubview:self.collectionView];
    [self.collectionView layoutIfNeeded];
    
    if(self.isShuffling){
         [self.collectionView scrollToItemAtIndexPath:[NSIndexPath indexPathForRow:self.index inSection:500] atScrollPosition:UICollectionViewScrollPositionCenteredHorizontally animated:YES];
    }
   
//    [self.navigationController popToRootViewControllerAnimated:YES];
    [self createBottomView];
    
}
- (void)createBottomView{
    UIView *bottomView = [[UIView alloc]initWithFrame:CGRectMake(0, SCREEN_HEIGHT - 44, SCREEN_WIDTH, 44)];
    bottomView.backgroundColor = [UIColor blackColor];

    bottomView.autoresizingMask = UIViewAutoresizingFlexibleHeight|UIViewAutoresizingFlexibleBottomMargin|UIViewAutoresizingFlexibleLeftMargin|UIViewAutoresizingFlexibleRightMargin;
    [self.view addSubview:bottomView];
    
    UIButton *shareBtn = [[UIButton alloc]initWithFrame:CGRectMake(SCREEN_WIDTH-80, 0, 80, 44)];
    [shareBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [shareBtn setTitle:@"分享" forState:UIControlStateNormal];
    [shareBtn addTarget:self action:@selector(shareBtnEvent:) forControlEvents:UIControlEventTouchUpInside];
    [bottomView addSubview:shareBtn];
    
    
    UIView *middleView = [[UIView alloc] initWithFrame:CGRectMake((SCREEN_WIDTH-120)/2, 0, 120, 44)];
//    middleView.backgroundColor = [UIColor redColor];
//    middle.center = bottomView.center;
    [bottomView addSubview:middleView];
    
    UILabel *numLabel = [[UILabel alloc]initWithFrame:CGRectMake((middleView.frame.size.width-40)/2, 0, 40, 44)];
//    numLabel.backgroundColor = [UIColor whiteColor];
    numLabel.textColor = [UIColor whiteColor];
    numLabel.textAlignment = NSTextAlignmentCenter;
    numLabel.text = @"0/10";
    [middleView addSubview:numLabel];
    
    UIButton *leftBtn = [[UIButton alloc]initWithFrame:CGRectMake(0, 0, 30, 44)];
    [leftBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [leftBtn setTitle:@"<<" forState:UIControlStateNormal];
    [leftBtn addTarget:self action:@selector(shareBtnEvent:) forControlEvents:UIControlEventTouchUpInside];
    [middleView addSubview:leftBtn];
    
    UIButton *rightBtn = [[UIButton alloc]initWithFrame:CGRectMake(CGRectGetMaxX(numLabel.frame)+10, 0, 30, 44)];
    [rightBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [rightBtn setTitle:@">>" forState:UIControlStateNormal];
    [rightBtn addTarget:self action:@selector(shareBtnEvent:) forControlEvents:UIControlEventTouchUpInside];
    [middleView addSubview:rightBtn];

    
}

- (void)shareBtnEvent:(UIButton *)btn{
    DDLOG(@"分享按钮");
}
-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    
}
-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    BLImageBrowserCell *cell = [self.collectionView dequeueReusableCellWithReuseIdentifier:@"BLImageBrowserCell" forIndexPath:indexPath];
    cell.backgroundColor = [UIColor blackColor];
    UIImage *img = self.dataSource[indexPath.item];
    cell.zoom = self.zoom;
    cell.minZoom = self.minZoom;
    cell.maxZoom = self.maxZoom;
    cell.contentMode = self.contentMode;
    cell.bounces = self.bounces;
    [cell initImage:img];
    return cell;
}
-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return self.dataSource.count;
}
-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    if(self.isShuffling){
        return 999;
    }else{
         return 1;
    }
}
- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout insetForSectionAtIndex:(NSInteger)section {
    return UIEdgeInsetsMake(0, 0, 0, 0);
}


-(CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath{
    return CGSizeMake(SCREEN_WIDTH, SCREEN_HEIGHT);
}

-(UICollectionView *)collectionView{
    if (!_collectionView) {
        UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc]init];
        //同一行相邻两个cell的最小间距
        layout.minimumInteritemSpacing = 0;
        //最小两行之间的间距
        layout.minimumLineSpacing = 0;
        
        layout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
        
        _collectionView = [[UICollectionView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT) collectionViewLayout:layout];
        _collectionView.dataSource = self;
        _collectionView.delegate = self;
        _collectionView.pagingEnabled = YES;
        _collectionView.backgroundColor = [UIColor whiteColor];
        [_collectionView registerClass:[BLImageBrowserCell class] forCellWithReuseIdentifier:@"BLImageBrowserCell"];
    }
    return _collectionView;
}
-(NSMutableArray *)dataSource{
    if (!_dataSource) {
        _dataSource = [[NSMutableArray alloc]initWithCapacity:0];
    }
    return _dataSource;
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
}
@end

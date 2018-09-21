//
//  UploadHistoryCell.m
//  Lywsale
//
//  Created by M on 2018/9/21.
//  Copyright © 2018年 黄锡凯. All rights reserved.
//

#import "UploadHistoryCell.h"
#import "UploadImgCell.h"

@interface UploadHistoryCell () <UICollectionViewDelegate, UICollectionViewDataSource>

@property (nonatomic, strong) UICollectionView *collectionView;

@end

@implementation UploadHistoryCell
@synthesize collectionView;

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        
        [self.collectionView reloadData];
    }
    
    return self;
}

#pragma mark - CollectionView
- (UICollectionView *)collectionView {
    
    if (!collectionView) {
        
        float width = ScreenWidth - 30;
        float height = (width - 60) / 3;
        
        UIView *bgView = [[UIView alloc] initWithFrame:CGRectMake(15, 0, ScreenWidth - 30, height + 55)];
        bgView.backgroundColor = [UIColor whiteColor];
        bgView.layer.cornerRadius = 3;
        bgView.layer.shadowColor = [UIColor grayColor].CGColor;
        bgView.layer.shadowOffset = CGSizeMake(3, 3);
        bgView.layer.shadowOpacity = 0.3;
        [self.contentView addSubview:bgView];
        
        UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
        layout.minimumLineSpacing = 15;
        layout.minimumInteritemSpacing = 15;
        layout.itemSize = CGSizeMake(height, height + 25);
        
        collectionView = [[UICollectionView alloc] initWithFrame:bgView.frame collectionViewLayout:layout];
        collectionView.x = 0;
        collectionView.backgroundColor = [UIColor whiteColor];
        collectionView.delegate = self;
        collectionView.dataSource = self;
        [collectionView registerClass:[UploadImgCell class] forCellWithReuseIdentifier:@"UploadImgCell"];
        [bgView addSubview:self.collectionView];
    }
    
    return collectionView;
}

#pragma mark - UICollectionViewDataSource
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 1;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return 3;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {

    UploadImgCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"UploadImgCell" forIndexPath:indexPath];
    return cell;
}

#pragma mark - UICollectionViewFlowLayout
- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout insetForSectionAtIndex:(NSInteger)section
{
    return UIEdgeInsetsMake(15, 15, 15, 15);
}

@end

//
//  ViewController.m
//  PINRemoteTest
//
//  Created by Kerr Miller on 30/09/2015.
//  Copyright © 2015 Kerr Marin Miller. All rights reserved.
//

#import "ViewController.h"

#import "PINTestCollectionViewCell.h"

@interface ViewController () <UICollectionViewDataSource>

@property (nonatomic, copy) NSArray *imageURLs;
@property (nonatomic, weak) IBOutlet UICollectionView *collectionView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    NSString *path = [[NSBundle mainBundle] pathForResource:@"images" ofType:@"json"];
    NSString *myJSON = [[NSString alloc] initWithContentsOfFile:path encoding:NSUTF8StringEncoding error:NULL];
    self.imageURLs = [NSJSONSerialization JSONObjectWithData:[myJSON dataUsingEncoding:NSUTF8StringEncoding]
                                                     options:0 error:NULL];
    
    [self.collectionView reloadData];
}


- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    PINTestCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"cell" forIndexPath:indexPath];
    cell.imageURL = [NSURL URLWithString:self.imageURLs[indexPath.row]];
    return cell;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return self.imageURLs.count;
}

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 1;
}

@end

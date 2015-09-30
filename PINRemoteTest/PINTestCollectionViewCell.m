//
//  PINTestCollectionViewCell.m
//  PINRemoteTest
//
//  Created by Kerr Miller on 30/09/2015.
//  Copyright © 2015 Kerr Marin Miller. All rights reserved.
//

#import "PINTestCollectionViewCell.h"

#import "UIImageView+PINRemoteImage.h"

@interface PINTestCollectionViewCell ()

@property (nonatomic, weak) IBOutlet UIImageView *imageView;

@end

@implementation PINTestCollectionViewCell

- (void)awakeFromNib {
    self.imageView.contentMode = UIViewContentModeScaleAspectFit;
}

-(void)setImageURL:(NSURL *)imageURL {
    self.imageView.image = nil;
    [self.imageView pin_setImageFromURL:imageURL completion:^(PINRemoteImageManagerResult *result) {
        if (result.error) {
            NSLog(@"%@", result.error);
        }
    }];
}

@end

//
//  BUKViewLabelVerticalButton.h
//  BUKButtonComponents
//
//  Created by Leppard on 3/3/16.
//  Copyright © 2016 Baixing. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BUKViewLabelVerticalButton : UIView

@property (nonatomic, readonly) UIImageView *imageView;
@property (nonatomic, readonly) UILabel *label;

- (void)setFrame:(CGRect)frame;
- (void)setImageForView:(UIImage *)image;

@end

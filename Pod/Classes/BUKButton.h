//
//  BUKButton.h
//  BUKButtonComponents
//
//  Created by Leppard on 3/21/16.
//  Copyright © 2016 Baixing. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BUKButton : UIView

@property (nonatomic, readonly) UIImageView *imageView;
@property (nonatomic, readonly) UILabel *label;

- (instancetype)initWithFrame:(CGRect)frame image:(UIImage *)image text:(NSString *)text;

- (void)setImageForView:(UIImage *)image;

- (void)addTarget:(id)target clickAction:(SEL)action;

@end

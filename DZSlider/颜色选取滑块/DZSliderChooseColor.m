//
//  DZSliderChooseColor.m
//  DZSlider
//
//  Created by 陈东芝 on 16/11/15.
//  Copyright © 2016年 陈东芝. All rights reserved.
//

#import "DZSliderChooseColor.h"

static CGFloat colorBarHeight = 15.0;
static CGFloat sliderWidth = 20.0;


@implementation DZSliderChooseColor{

    UIView *slider;
    
}


-(id)initWithFrame:(CGRect)frame{
    
    self = [super initWithFrame:frame];
    
    if(self){
        
        
        self.layer.masksToBounds =YES;
        [self sliderBar];
        [self slider];
        
    }
    
    return self;
}



-(void)sliderBar{
    
    CAGradientLayer *gradientLayer = [CAGradientLayer layer];
    
    gradientLayer.colors = @[(__bridge id)[UIColor blackColor].CGColor,(__bridge id)[UIColor redColor].CGColor];
    gradientLayer.locations = @[@0,@1];
    gradientLayer.startPoint = CGPointMake(0, 0.5);
    gradientLayer.endPoint = CGPointMake(1, 0.5);
    gradientLayer.frame = CGRectMake(sliderWidth/2.0, 0, CGRectGetWidth(self.bounds)-sliderWidth, colorBarHeight);
    gradientLayer.cornerRadius = 3.0;
    gradientLayer.masksToBounds = YES;
    [self.layer addSublayer:gradientLayer];
    
}


-(void)slider{
    
    slider = [[UIView alloc] initWithFrame:CGRectMake(0, colorBarHeight, sliderWidth, sliderWidth)];
    slider.backgroundColor = [UIColor blueColor];
    [self addSubview:slider];
    
}



@end

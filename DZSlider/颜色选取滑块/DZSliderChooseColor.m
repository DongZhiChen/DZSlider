//
//  DZSliderChooseColor.m
//  DZSlider
//
//  Created by 陈东芝 on 16/11/15.
//  Copyright © 2016年 陈东芝. All rights reserved.
//

#import "DZSliderChooseColor.h"

static CGFloat colorBarHeight = 6.0;
static CGFloat sliderWidth = 20.0;


@implementation DZSliderChooseColor{

    UIView *slider;
    CGFloat barWidth;
    CGFloat maxRight;
    CGFloat maxLeft;
    CAGradientLayer *gradientLayer;
    
}


-(id)initWithFrame:(CGRect)frame{
    
    self = [super initWithFrame:frame];
    
    if(self){
        
        frame.size.height = colorBarHeight + sliderWidth;
        self.frame = frame;
        self.layer.opaque = NO;
        
        [self initData];
        [self initView];
       
    }
    
    return self;
}


-(void)drawRect:(CGRect)rect{

    [super drawRect:rect];
    
    if(!gradientLayer)
    [self sliderBar];
    
}

-(void)initView{

    self.layer.masksToBounds =YES;

    [self slider];
    
}


-(void)initData{

    self.maxValue = 1;
    self.minVlaue = 0;
    _value = 0.5;
    barWidth = CGRectGetWidth(self.bounds)-sliderWidth;

    maxRight = CGRectGetWidth(self.bounds)-sliderWidth/2.0;
    
    maxLeft = sliderWidth/2.0;
    
}


-(void)changeValue:(UIGestureRecognizer *)GR{

    if(GR.state == UIGestureRecognizerStateChanged){
    
       CGPoint point = [GR locationInView:self];
        
        if(point.x <= maxRight && point.x > maxLeft){
        
            _value = (point.x * _maxValue) / barWidth;
            
            CGPoint barPoint = slider.center;
            barPoint.x = point.x;
            slider.center = barPoint;
            
        }else if(point.x < maxLeft){
        
            CGPoint barPoint = slider.center;
            barPoint.x = maxLeft;
            slider.center = barPoint;
            
            _value = _minVlaue;
            
        }else if(point.x > maxRight){
        
            CGPoint barPoint = slider.center;
            barPoint.x = maxRight;
            slider.center = barPoint;
            
            _value = _maxValue;
        }
       
        
    }
    
    [self sendActionsForControlEvents:UIControlEventValueChanged];
    
}



-(void)sliderBar{
    
    gradientLayer = [CAGradientLayer layer];
    
    if(_startColor == nil){
    
        _startColor = [UIColor whiteColor];
    }
    
    if(_endColor == nil){
    
        _endColor = [UIColor redColor];
        
    }
    
    gradientLayer.colors = @[(__bridge id)self.startColor.CGColor,(__bridge id)self.endColor.CGColor];
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
    
    UIPanGestureRecognizer *pan = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(changeValue:)];
    [slider addGestureRecognizer:pan];
    
    
}



@end

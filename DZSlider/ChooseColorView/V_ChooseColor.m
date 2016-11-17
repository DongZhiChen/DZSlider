//
//  V_ChooseColor.m
//  DZSlider
//
//  Created by 陈东芝 on 16/11/17.
//  Copyright © 2016年 陈东芝. All rights reserved.
//

#import "V_ChooseColor.h"

@implementation V_ChooseColor

-(id)initWithFrame:(CGRect)frame{

    self = [super initWithFrame:frame];
    
    if(self){
    
        self = [[NSBundle mainBundle] loadNibNamed:@"V_ChooseColor" owner:self options:nil][0];
        
        self.DZSliderR.endColor = [UIColor redColor];
        self.DZSliderG.endColor = [UIColor greenColor];
        self.DZSliderB.endColor = [UIColor blueColor];
        
        RGBType rgb = rgbWithUIColor([UIColor redColor]);
        HSVType hsv = RGB_to_HSV(rgb);
        
        NSLog(@"%f,%f,%f",rgb.r,rgb.g,rgb.b);
        NSLog(@"%f,%f,%f",hsv.h,hsv.s,hsv.v);
        
    }
    
    return self;
}

RGBType rgbWithUIColor(UIColor *color)
{
    const CGFloat *components = CGColorGetComponents(color.CGColor);
    
    CGFloat r,g,b;
    
    switch (CGColorSpaceGetModel(CGColorGetColorSpace(color.CGColor)))
    {
        case kCGColorSpaceModelMonochrome:
            r = g = b = components[0];
            break;
        case kCGColorSpaceModelRGB:
            r = components[0];
            g = components[1];
            b = components[2];
            break;
        default:	// We don't know how to handle this model
            return RGBTypeMake(0, 0, 0);
    }
    
    return RGBTypeMake(r, g, b);
}


@end

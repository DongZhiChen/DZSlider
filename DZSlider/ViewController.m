//
//  ViewController.m
//  DZSlider
//
//  Created by 陈东芝 on 16/11/15.
//  Copyright © 2016年 陈东芝. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    DZSliderChooseColor *slider = [[DZSliderChooseColor alloc] initWithFrame:CGRectMake(0, 100, 250, 35)];
    [self.view addSubview:slider];
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end

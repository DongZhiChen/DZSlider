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
    
//    DZSliderChooseColor *slider = [[DZSliderChooseColor alloc] initWithFrame:CGRectMake(0, 100, 250, 35)];
//    [slider addTarget:self action:@selector(test:) forControlEvents:UIControlEventValueChanged];
//    [self.view addSubview:slider];
    
    
    V_ChooseColor *chooseColor = [[V_ChooseColor alloc] initWithFrame:self.view.bounds];
    [self.view addSubview:chooseColor];
    
    
}

-(void)test:(DZSliderChooseColor *)sender{

    NSLog(@"change%f",sender.value);
    
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end

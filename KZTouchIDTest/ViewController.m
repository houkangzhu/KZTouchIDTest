//
//  ViewController.m
//  KZTouchIDTest
//
//  Created by Company on 16/4/14.
//  Copyright © 2016年 侯康柱. All rights reserved.
//

#import "ViewController.h"
#import "KZTouchIDTool.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear: animated];
    
    [KZTouchIDTool usingTouchID];
}

@end

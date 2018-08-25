//
//  TeamController.m
//  FundTest
//
//  Created by 张储祺 on 2018/8/25.
//  Copyright © 2018年 1. All rights reserved.
//

#import "TeamController.h"
#import "CameraController.h"

@interface TeamController ()

@end

@implementation TeamController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    CameraController * ct = [[CameraController alloc] init] ;
    UINavigationController * navi = [[UINavigationController alloc] initWithRootViewController:ct] ;
    [self presentViewController:navi animated:YES completion:nil] ;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end

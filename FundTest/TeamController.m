//
//  TeamController.m
//  FundTest
//
//  Created by 张储祺 on 2018/8/25.
//  Copyright © 2018年 1. All rights reserved.
//

#import "TeamController.h"
#import "CameraController.h"
#import "StudioController.h"
@interface TeamController ()

@end

@implementation TeamController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"我的团体" ;
    // Do any additional setup after loading the view.
    CameraController * ct = [[CameraController alloc] init] ;
    UINavigationController * navi = [[UINavigationController alloc] initWithRootViewController:ct] ;
    [self presentViewController:navi animated:YES completion:nil] ;
    
    UIImageView * imgView = [[UIImageView alloc] initWithFrame:CGRectMake(40, 91, 227, 243)] ;
    [imgView setImage:[UIImage imageNamed:@"new"]] ;
    [self.view addSubview:imgView] ;
    UIButton * btn = [[UIButton alloc] initWithFrame:CGRectMake(40, 91, 227, 243)] ;
    [btn addTarget:self action:@selector(searchTeam) forControlEvents:UIControlEventTouchUpInside] ;
    [self.view addSubview:btn] ;
//    UIButton *btn = [[UIButton alloc] initWithFrame:CGRectMake(40, 91, 227, 243)] ;
//    [btn.imageView setImage:[UIImage imageNamed:@"new"]] ;
//    btn.imageView.hidden = NO ;
//    btn.imageView.frame = btn.bounds ;
//    [btn setBackgroundImage:[UIImage imageNamed:@"new"] forState:UIControlStateNormal] ;
//    [self.view addSubview:btn] ;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void)searchTeam{
    UIAlertController * alert = [UIAlertController alertControllerWithTitle:@"查找组织/团体"
                                                                    message:@"请输入您想加入的组织/团体名称"
                                                             preferredStyle:UIAlertControllerStyleAlert] ;
    [alert addTextFieldWithConfigurationHandler:^(UITextField * _Nonnull textField) {
        [[NSNotificationCenter defaultCenter] addObserver:self
                                                 selector:@selector(alertTextFieldDidChange:)
                                                     name:UITextFieldTextDidChangeNotification
                                                   object:textField] ;
        textField.placeholder = @"团体/组织名称" ;
    }];
    UIAlertAction * okAction = [UIAlertAction actionWithTitle:@"好的"
                                                        style:UIAlertActionStyleDefault
                                                      handler:^(UIAlertAction * _Nonnull action) {
                                                          //移除通知
                                                          [[NSNotificationCenter defaultCenter] removeObserver:self] ;
                                                          //获取当前时间
                                                   
                                                         //woshidaima
                                                          StudioController * ct = [[StudioController alloc] init] ;
                                                          [self.navigationController pushViewController:ct animated:YES] ;
                                                      }] ;
    UIAlertAction * cancelAction = [UIAlertAction actionWithTitle:@"取消"
                                                            style:UIAlertActionStyleCancel
                                                          handler:^(UIAlertAction * _Nonnull action) {
                                                          }];
    [alert addAction:cancelAction] ;
    okAction.enabled = NO ;
    [alert addAction:okAction] ;
    [self presentViewController:alert animated:YES completion:nil] ;
}
-(void)alertTextFieldDidChange:(NSNotification *)notification{
    UIAlertController * alert = (UIAlertController *)self.presentedViewController ;
    if(alert){
        UITextField * textField = alert.textFields.firstObject ;
        UIAlertAction * ok = alert.actions.lastObject ;
        ok.enabled = textField.text.length?YES:NO ;
    }
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

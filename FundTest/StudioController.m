//
//  StudioController.m
//  FundTest
//
//  Created by 张储祺 on 2018/8/25.
//  Copyright © 2018年 1. All rights reserved.
//

#import "StudioController.h"

@interface StudioController ()

@end

@implementation StudioController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.fund = 250000 ;
    [self.view addSubview:self.fundLabel] ;
    self.title = @"Studio1" ;
    [self.navigationController setNavigationBarHidden:NO] ;
    
    UIImageView * imgView = [[UIImageView alloc] initWithFrame:CGRectMake(7, 310, 309, 213)] ;
    [imgView setImage:[UIImage imageNamed:@"new2"]] ;
    [self.view addSubview:imgView] ;
    UIImageView * imgView2 = [[UIImageView alloc] initWithFrame:CGRectMake(4, 205, 312, 105)] ;
    [imgView2 setImage:[UIImage imageNamed:@"mmem"]] ;
    [self.view addSubview:imgView2] ;
    
    UILabel * label = [[UILabel alloc] initWithFrame:CGRectMake(0, 66, self.view.bounds.size.width*0.5, 100)] ;
    label.text = @"总资产:" ;
    label.font = [UIFont systemFontOfSize:20 weight:UIFontWeightBlack] ;
    [self.view addSubview:label] ;
//    UILabel * label2 = [[UILabel alloc] initWithFrame:CGRectMake(0, 144, self.view.bounds.size.width, 61)] ;
//    label2.text = @"250000" ;
//    label2.font = [UIFont systemFontOfSize:20 weight:UIFontWeightBold] ;
//    [self.view addSubview:label2] ;
    UILabel * label3 = [[UILabel alloc] initWithFrame:CGRectMake(self.view.bounds.size.width*0.5, 44, self.view.bounds.size.width*0.5, 100)] ;
    label3.text = @"点我查看账本记录" ;
    label3.font = [UIFont systemFontOfSize:18 weight:UIFontWeightHeavy] ;
    [self.view addSubview:label3] ;
    
    UIButton *button = [[UIButton alloc] initWithFrame:CGRectMake(self.view.bounds.size.width*0.5, 144, self.view.bounds.size.width*0.5, 61)] ;
    [button setTitle:@"点我充值" forState:UIControlStateNormal] ;
    button.layer.cornerRadius = 10.f ;
    button.backgroundColor = [UIColor grayColor] ;
    [button addTarget:self action:@selector(recharge) forControlEvents:UIControlEventTouchUpInside] ;
    [self.view addSubview:button] ;
    
    
}
-(UILabel *)fundLabel{
    if(!_fundLabel){
        _fundLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 144, self.view.bounds.size.width*0.5, 61)] ;
        _fundLabel.text = [NSString stringWithFormat:@"%ld",(long)self.fund] ;
        NSLog(@"%ld",self.fund);
        _fundLabel.font = [UIFont systemFontOfSize:20 weight:UIFontWeightBlack] ;
    }
    return _fundLabel ;
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void)alertTextFieldDidChange:(NSNotification *)notification{
    UIAlertController * alertController = (UIAlertController *)self.presentedViewController ;
    if(alertController){
        UITextField * textField = alertController.textFields.firstObject ;
        UIAlertAction * OK = alertController.actions.lastObject ;
        OK.enabled = textField.text.length?YES:NO ;
    }
}
-(void)recharge{
    UIAlertController * alert = [UIAlertController alertControllerWithTitle:@"充值"
                                                                    message:@"请输入充值金额"
                                                             preferredStyle:UIAlertControllerStyleAlert] ;
    [alert addTextFieldWithConfigurationHandler:^(UITextField * _Nonnull textField) {
        textField.keyboardType = UIKeyboardTypeNumberPad ;
        [[NSNotificationCenter defaultCenter] addObserver:self
                                                 selector:@selector(alertTextFieldDidChange:)
                                                     name:UITextFieldTextDidChangeNotification
                                                   object:textField] ;
        textField.placeholder = @"输入金额" ;
    }];
    UIAlertAction * okAction = [UIAlertAction actionWithTitle:@"好的"
                                                        style:UIAlertActionStyleDefault
                                                      handler:^(UIAlertAction * _Nonnull action) {
                                                          //移除通知
                                                          [[NSNotificationCenter defaultCenter] removeObserver:self] ;
                                                          //woshidaima
                                                          NSString * fundString = alert.textFields.firstObject.text ;
                                                          NSInteger f = [fundString intValue] ;
                                                          self.fund += f ;
                                                          self.fundLabel.text = [NSString stringWithFormat:@"%ld",self.fund] ;
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
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end

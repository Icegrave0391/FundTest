//
//  MeController.m
//  FundTest
//
//  Created by 张储祺 on 2018/8/25.
//  Copyright © 2018年 1. All rights reserved.
//

#import "MeController.h"
#import "User.h"
#import "DataBaseTool.h"
#import "Organization.h"
@interface MeController ()

@end

@implementation MeController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.navigationController setNavigationBarHidden:YES animated:NO] ;
    // Do any additional setup after loading the view.
//    //fake
//
//    //fake user
//    User * user1 = [[User alloc] init] ;
//    user1.userName = @"why1" ;
//    user1.fund = 2435 ;
//    user1.avator = [UIImage imageNamed:@"avator1"] ;
//
////    [User sharedUser].userName = user1.userName ;
////    [User sharedUser].fund = user1.fund ;
////    [User sharedUser].avator = user1.avator ;
//    [[User sharedUser] setUserWithCurrentUser:user1] ;
//    NSLog(@"-----uswer %@ %lu %@", [User sharedUser].userName, [User sharedUser].fund, [User sharedUser].avator) ;
//    User * user2 = [[User alloc] init] ;
//    user2.userName = @"why2" ;
//    user2.fund = 2324 ;
//    User * user3 = [[User alloc] init] ;
//    user3.userName = @"zcq" ;
//    user3.fund = 1243 ;
//    User * user4 = [[User alloc] init] ;
//    user4.userName = @"cjt" ;
//    user4.fund = 3248 ;
//    User * user5 = [[User alloc] init] ;
//    user5.userName = @"lyc" ;
//    user5.fund = 1342 ;
//
//    [DataBaseTool sharedDBTool].operatedUser = user1 ;
//    [[DataBaseTool sharedDBTool] recordUser:user1] ;
//    //fake org
//    Organization * org1 = [[Organization alloc] init] ;
//    org1.teamName = @"studio1" ;
//    org1.teamFund = 250000 ;
//    for(User * user in @[user1, user2, user3]){
//        [org1.memberArr addObject:user.userName] ;
//    }
//
//    Organization * org2 = [[Organization alloc] init] ;
//    org2.teamName = @"studio2" ;
//    org2.teamFund = 280000 ;
//    for(User * user in @[user1, user4, user5]){
//        [org2.memberArr addObject:user.userName] ;
//    }
//    for(Organization * org in @[org1, org2]){
//
//        [[DataBaseTool sharedDBTool] recordOrganization:org] ;
//    }
//
//
    
    [self.userNameLabel setText:[User sharedUser].userName] ;
    [self.avator setImage:[User sharedUser].avator] ;
    [self.fundLabel setText:[NSString stringWithFormat:@"资产:%lu",(unsigned long)[User sharedUser].fund]] ;
    
    
    //
    UIImageView * imgView1 = [[UIImageView alloc] initWithFrame:CGRectMake(66, 172, 20, 16)] ;
    UIImageView * imgView2 = [[UIImageView alloc] initWithFrame:CGRectMake(145, 169, 20, 20)] ;
    UIImageView * imgView3 = [[UIImageView alloc] initWithFrame:CGRectMake(224, 169, 20, 20)] ;
    UIImageView * imgView4 = [[UIImageView alloc] initWithFrame:CGRectMake(303, 169, 20, 20)] ;
    [imgView1 setImage:[UIImage imageNamed:@"credit-card"]] ;
    [imgView2 setImage:[UIImage imageNamed:@"favorite"]] ;
    [imgView3 setImage:[UIImage imageNamed:@"bag"]] ;
    [imgView4 setImage:[UIImage imageNamed:@"store"]] ;
    for(UIImageView * view in @[imgView1, imgView2, imgView3, imgView4]){
        [self.view addSubview:view] ;
    }
    UILabel * lb1 = [[UILabel alloc] initWithFrame:CGRectMake(53, 193, 51, 17)] ;
    UILabel * lb2 = [[UILabel alloc] initWithFrame:CGRectMake(134, 193, 50, 17)] ;
    UILabel * lb3 = [[UILabel alloc] initWithFrame:CGRectMake(212, 193, 49, 17)] ;
    UILabel * lb4 = [[UILabel alloc] initWithFrame:CGRectMake(294, 193, 38, 17)] ;
    [lb1 setText:@"Members"] ;
    [lb2 setText:@"Favorites"] ;
    [lb3 setText:@"Dinosaur"] ;
    [lb4 setText:@"Stories"] ;
    for(UILabel * label in @[lb1, lb2, lb3, lb4]){
        label.font = [UIFont systemFontOfSize:12] ;
        [self.view addSubview: label] ;
    }
    
    

    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(UIImageView *)avator{
    if(!_avator){
        _avator = [[UIImageView alloc] initWithFrame:CGRectMake(34, 80, 70, 70)] ;
        [self.view addSubview:_avator] ;
    }
    return _avator ;
}
-(UILabel *)userNameLabel{
    if(!_userNameLabel){
        _userNameLabel = [[UILabel alloc] initWithFrame:CGRectMake(124, 93, 80, 22)] ;
        _userNameLabel.font = [UIFont systemFontOfSize:18] ;
        [self.view addSubview:_userNameLabel] ;
    }
    return _userNameLabel ;
}
-(UILabel *)fundLabel{
    if(!_fundLabel){
        _fundLabel = [[UILabel alloc] initWithFrame:CGRectMake(139, 118, 62, 11)] ;
        _fundLabel.font = [UIFont systemFontOfSize:8] ;
        [self.view addSubview:_fundLabel] ;
    }
    return _fundLabel ;
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

//
//  User.m
//  FundTest
//
//  Created by 张储祺 on 2018/8/24.
//  Copyright © 2018年 1. All rights reserved.
//

#import "User.h"

static User * user ;

@implementation User
+(instancetype)sharedUser{
    static dispatch_once_t oncetoken ;
    dispatch_once(&oncetoken, ^{
        user = [[User alloc] init] ;
    });
    return user ;
}
-(void)setUserWithCurrentUser:(User *)user{
    self.userName = user.userName ;
    self.fund = user.fund ;
    self.avator = user.avator ;
    self.organizationArr = user.organizationArr ;
}

-(NSMutableArray *)organizationArr{
    if(!_organizationArr){
        _organizationArr = [[NSMutableArray alloc] init] ;
    }
    return _organizationArr ;
}

@end

//
//  User.h
//  FundTest
//
//  Created by 张储祺 on 2018/8/24.
//  Copyright © 2018年 1. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
@interface User : NSObject

@property(nonatomic, strong)NSString * userName ;
@property(nonatomic, strong)NSString * password ;
@property(nonatomic, strong)UIImage * avator ;
@property(nonatomic, assign)NSUInteger fund ;
@property(nonatomic, strong)NSMutableArray * organizationArr ;

+(instancetype)sharedUser ;
-(void)setUserWithCurrentUser:(User *)user ;
@end

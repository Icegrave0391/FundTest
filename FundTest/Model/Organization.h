//
//  Organization.h
//  FundTest
//
//  Created by 张储祺 on 2018/8/24.
//  Copyright © 2018年 1. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Organization : NSObject

@property(nonatomic, strong)NSString * teamName ;
@property(nonatomic, assign)NSUInteger teamFund ;
@property(nonatomic, strong)NSMutableArray * memberArr ;

@end

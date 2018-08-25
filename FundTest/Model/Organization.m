//
//  Organization.m
//  FundTest
//
//  Created by 张储祺 on 2018/8/24.
//  Copyright © 2018年 1. All rights reserved.
//

#import "Organization.h"

@implementation Organization
-(NSMutableArray *)memberArr{
    if(!_memberArr){
        _memberArr = [[NSMutableArray alloc] init] ;
    }
    return _memberArr ;
}
@end

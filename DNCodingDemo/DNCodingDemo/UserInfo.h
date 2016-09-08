//
//  UserInfo.h
//  DNCodingDemo
//
//  Created by mainone on 16/9/8.
//  Copyright © 2016年 wjn. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface UserInfo : NSObject <NSCoding>

@property (nonatomic, copy  ) NSString  *name;
@property (nonatomic, strong) UIImage   *avatar;
@property (nonatomic, assign) NSInteger age;
@property (nonatomic, assign) BOOL      vip;

@end

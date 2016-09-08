//
//  UserInfo.m
//  DNCodingDemo
//
//  Created by mainone on 16/9/8.
//  Copyright © 2016年 wjn. All rights reserved.
//

#import "UserInfo.h"

@implementation UserInfo

// 解档
- (instancetype)initWithCoder:(NSCoder *)aDecoder {
    if (self = [super init]) {
        self.name   = [aDecoder decodeObjectForKey:@"name"];
        self.avatar = [aDecoder decodeObjectForKey:@"avatar"];
        self.age    = [aDecoder decodeIntegerForKey:@"age"];
        self.vip    = [aDecoder decodeBoolForKey:@"vip"];
    }
    return self;
}
// 归档
- (void)encodeWithCoder:(NSCoder *)aCoder {
    [aCoder encodeObject:self.name forKey:@"name"];
    [aCoder encodeObject:self.avatar forKey:@"avatar"];
    [aCoder encodeInteger:self.age forKey:@"age"];
    [aCoder encodeBool:self.vip forKey:@"vip"];
}

@end

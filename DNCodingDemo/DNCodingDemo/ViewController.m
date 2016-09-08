//
//  ViewController.m
//  DNCodingDemo
//
//  Created by mainone on 16/9/8.
//  Copyright © 2016年 wjn. All rights reserved.
//

#import "ViewController.h"
#import "UserInfo.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
//    [self saveUserInfo];
    [self readUserInfoFromData];
}

- (void)saveUserInfo {
    NSString *path     = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES).firstObject;
    NSString *fileName = [path stringByAppendingPathComponent:@"userInfo.data"];
    UserInfo *userInfo = [[UserInfo alloc] init];
    userInfo.name      = @"张三";
    userInfo.avatar    = [UIImage imageWithData:[NSData dataWithContentsOfURL:[NSURL URLWithString:@"http://scimg.jb51.net/allimg/160815/103-160Q509544OC.jpg"]]];
    userInfo.age       = 12;
    userInfo.vip       = YES;
    BOOL isSaveSuccess = [NSKeyedArchiver archiveRootObject:userInfo toFile:fileName];
    if (isSaveSuccess) {
        NSLog(@"保存成功");
    }
}

- (void)readUserInfoFromData {
    NSString *path     = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES).firstObject;
    NSString *fileName = [path stringByAppendingPathComponent:@"userInfo.data"];
    UserInfo *userInfo = [NSKeyedUnarchiver unarchiveObjectWithFile:fileName];
    if (userInfo) {
        self.view.backgroundColor = [UIColor colorWithPatternImage:userInfo.avatar];
        NSString *name = userInfo.name;
        NSInteger age = userInfo.age;
        BOOL isVip = userInfo.vip;
        NSLog(@"name : %@, age : %d, vip : %d", name, (int)age, isVip);
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end

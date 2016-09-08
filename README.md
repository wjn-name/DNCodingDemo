# DNCodingDemo
本地存储之归档、解档

###1. 遵循NSCoding协议

    NSCoding协议声明了两个方法，这两个方法都是必须实现的：
    解档: initWithCoder 
    归档: encodeWithCoder


###2.具体用法: 以用户信息存储为例

创建一个继承自NSObject类UserInfo类,记得遵循NSCoding协议

    @interface UserInfo : NSObject <NSCoding>
    
    @property (nonatomic, copy  ) NSString  *name;
    @property (nonatomic, strong) UIImage   *avatar;
    @property (nonatomic, assign) NSInteger age;
    @property (nonatomic, assign) BOOL      vip;
    
    @end

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


####存储数据

    - (void)saveUserInfo {
        NSString *path = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES).firstObject;
        NSString *fileName = [path stringByAppendingPathComponent:@"userInfo.data"];
        UserInfo *userInfo = [[UserInfo alloc] init];
        userInfo.name = @"张三";
        userInfo.avatar = [UIImage imageWithData:[NSData dataWithContentsOfURL:[NSURL URLWithString:@"http://scimg.jb51.net/allimg/160815/103-160Q509544OC.jpg"]]];
        userInfo.age = 12;
        userInfo.vip = YES;
        BOOL isSaveSuccess = [NSKeyedArchiver archiveRootObject:userInfo toFile:fileName];
        if (isSaveSuccess) {
            NSLog(@"保存成功");
        }
}

####读取数据

    - (void)readUserInfoFromData {
        NSString *path = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES).firstObject;
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









//
//  ViewController.m
//  realm_objc
//
//  Created by work on 2019/5/11.
//  Copyright © 2019 XQ. All rights reserved.
//

#import "ViewController.h"
#import "DataModel.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.

//    DataModel *data = [[DataModel alloc] initWithValue:@{@"time":[NSDate dateWithTimeIntervalSinceNow:0],@"title":@"test"}];
//    DataModel *data1 = [[DataModel alloc] initWithValue:@[[NSDate dateWithTimeIntervalSinceNow:0],@"test"]];
//    NSLog(@"%@",data1.time);
    
    DataModel *myDog = [[DataModel alloc] init];
    myDog.name = @"myDog";

    DataModel *yourDog = [[DataModel alloc] init];
    yourDog.name = @"yourDog";

//    Person *me = [[Person alloc] initWithValue:@[@"crylown",[NSDate dateWithTimeIntervalSinceNow:1],@[myDog,yourDog]]];
    Person *mes = [[Person alloc] initWithValue:@{@"name":@"crylown",@"birthdate":[NSDate dateWithTimeIntervalSinceNow:1],@"dogs":@[myDog,yourDog]}];
    yourDog.owner = mes;
    myDog.owner = mes;

    [self setDefaultRealmForUser:@"user"];

    RLMRealm *realm = [RLMRealm defaultRealm];
    //    开放RLMRealm事务
    [realm beginWriteTransaction];
    //    添加到数据库 me为RLMObject
    [realm addObject:mes];
    //    提交事务
    [realm commitWriteTransaction];
    
    RLMResults *dogs = [Person allObjects];
    
    NSLog(@"%@",dogs);
    
}


- (void)setDefaultRealmForUser:(NSString *)username {
    //先获取默认配置
    RLMRealmConfiguration *config = [RLMRealmConfiguration defaultConfiguration];
    //设置只读数据库
    //config.readOnly = YES;
    // 使用默认的目录，但是使用用户名来替换默认的文件名
    config.fileURL = [[[config.fileURL URLByDeletingLastPathComponent]
                       URLByAppendingPathComponent:username]
                      URLByAppendingPathExtension:@"realm"];
    // 将这个配置应用到默认的 Realm 数据库当中
    [RLMRealmConfiguration setDefaultConfiguration:config];
}

@end

//
//  DataModel.h
//  realm_objc
//
//  Created by work on 2019/5/11.
//  Copyright © 2019 XQ. All rights reserved.
//

#import "Realm.h"

@class Person;
NS_ASSUME_NONNULL_BEGIN
@interface DataModel : RLMObject
@property NSString *name;
@property Person   *owner;
@end
RLM_ARRAY_TYPE(DataModel) // 定义RLMArray<Dog>

// 狗狗主人的数据模型
@interface Person : RLMObject
@property NSString      *name;
@property NSDate        *birthdate;
@property RLMArray<DataModel> *dogs; // 通过RLMArray建立关系

@end
RLM_ARRAY_TYPE(Person) // 定义RLMArray<Person>





NS_ASSUME_NONNULL_END

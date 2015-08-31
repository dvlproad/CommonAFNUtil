//
//  AccountInfo.h
//  CommonAFNUtilDemo
//
//  Created by lichq on 8/1/15.
//  Copyright (c) 2015 ciyouzen. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <JSONModel.h>

@interface AccountInfo : JSONModel

@property(nonatomic, strong) NSString<Optional> *uid;
@property(nonatomic, strong) NSString<Optional> *name;
@property(nonatomic, strong) NSString<Optional> *email;
@property(nonatomic, strong) NSString<Optional> *pasd;

@end

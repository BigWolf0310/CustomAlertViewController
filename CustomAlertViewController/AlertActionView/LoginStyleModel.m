//
//  LoginStyleModel.m
//  Merchant
//
//  Created by syt on 2022/5/13.
//  Copyright © 2022 Alibaba. All rights reserved.
//

#import "LoginStyleModel.h"

@implementation LoginStyleModel

- (instancetype)initWithImageName:(NSString *)imgName title:(NSString *)title
{
    self = [super init];
    if (self) {
        self.imgName = imgName;
        self.title = title;
    }
    return self;
}





@end

//
//  LoginStyleModel.h
//  Merchant
//
//  Created by syt on 2022/5/13.
//  Copyright © 2022 Alibaba. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface LoginStyleModel : NSObject

// 图片名称
@property (nonatomic, copy) NSString *imgName;
// 标题名称
@property (nonatomic, copy) NSString *title;

- (instancetype)initWithImageName:(NSString *)imgName title:(NSString *)title;

@end

NS_ASSUME_NONNULL_END

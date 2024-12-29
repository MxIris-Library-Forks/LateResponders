//
//  OCLateResponderRegistering.h
//  LateResponders
//
// Created by Paulo Andrade on 15/02/2019.
// Copyright © 2019 Outer Corner. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <LateResponders/OCLateResponderRegistry.h>

NS_ASSUME_NONNULL_BEGIN

NS_SWIFT_NAME(LateResponderRegistering)
@protocol OCLateResponderRegistering <NSObject>

@property (nonatomic, strong, readonly) OCLateResponderRegistry *lateResponderRegistry;

@end


@interface InterfaceKitViewController (OCLateResponderRegistering)

- (nullable InterfaceKitViewController<OCLateResponderRegistering> *)lateResponderRegisteringViewController NS_SWIFT_NAME(lateResponderRegisteringViewController());

@end

@interface InterfaceKitResponder (OCLateResponderRegistering)

- (nullable InterfaceKitResponder<OCLateResponderRegistering> *)lateResponderRegistering;

@end


NS_ASSUME_NONNULL_END

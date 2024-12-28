//
//  OCLateResponderRegistering.m
//  LateResponders
//
// Created by Paulo Andrade on 15/02/2019.
// Copyright © 2019 Outer Corner. All rights reserved.
//

#import "OCLateResponderRegistering.h"


@implementation  InterfaceKitViewController (OCLateResponderRegistering)

- (InterfaceKitViewController<OCLateResponderRegistering> *)lateResponderRegisteringViewController
{
    InterfaceKitViewController *c = self;
    while (c != nil && ![c conformsToProtocol:@protocol(OCLateResponderRegistering)]) {
        c = [c parentViewController];
    }
    
    if (c == self) {
        if ([c conformsToProtocol:@protocol(OCLateResponderRegistering)]) {
            return (InterfaceKitViewController<OCLateResponderRegistering>*)self;
        } else {
            return nil;
        }
    } else {
        return (InterfaceKitViewController<OCLateResponderRegistering>*)c;
    }
}


@end

@implementation InterfaceKitResponder (OCLateResponderRegistering)

- (nullable id<OCLateResponderRegistering>)lateResponderRegistering {
    InterfaceKitResponder *c = self;
    
    while (c != nil && ![c conformsToProtocol:@protocol(OCLateResponderRegistering)]) {
        c = [c nextResponder];
    }
    
    if (c == self) {
        if ([c conformsToProtocol:@protocol(OCLateResponderRegistering)]) {
            return (id<OCLateResponderRegistering>)self;
        } else {
            return nil;
        }
    } else {
        return (id<OCLateResponderRegistering>)c;
    }
    
    
}

@end

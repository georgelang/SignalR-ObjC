//
//  SRHubservable.m
//  SignalR
//
//  Created by Alex Billingsley on 11/4/11.
//  Copyright (c) 2011 DyKnow LLC. All rights reserved.
//

#import "SRHubservable.h"
#import "SRHubs.h"

@interface SRHubservable()

@end

@implementation SRHubservable

@synthesize proxy = _proxy;
@synthesize eventName = _eventName;

#pragma mark - Initialization

+ (id)observe:(SRHubProxy *)proxy event:(NSString *)eventName
{
    return [[SRHubservable alloc] initWithProxy:proxy eventName:eventName];
}

- (id)initWithProxy:(SRHubProxy *)proxy eventName:(NSString *)eventName
{
    if ((self = [super init])) {
        _proxy = proxy;
        _eventName = eventName;
    }
    return self;
}

- (NSString *)description 
{  
    return [NSString stringWithFormat:@"Hubservable: Hub:%@ Event=%@",_proxy, _eventName];
}

- (SRSubscription *)subscribe:(NSObject *)object selector:(SEL)selector
{
    SRSubscription *subscription = [_proxy subscribe:_eventName];
    subscription.object = object;
    subscription.selector = selector;
    
    return subscription;
}

@end
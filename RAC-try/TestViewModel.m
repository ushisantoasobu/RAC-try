//
//  TestViewModel.m
//  RAC-try
//
//  Created by shunsuke sato on 2014/09/07.
//  Copyright (c) 2014年 moguraproject. All rights reserved.
//

#import "TestViewModel.h"
#import <ReactiveCocoa.h>

@implementation TestViewModel

- (instancetype)init
{
    self = [super init];
    if (self) {
        
        //angularでいうところのwatchのようなもの
        RAC(self, nicknameWithMark) = [RACObserve(self, nickname) map:^id(NSString *value) {
            NSString *str = [NSString stringWithFormat:@"%@!!!", value];
            return str;
        }];
        
        RAC(self, validationInput) = [RACSignal combineLatest:@[RACObserve(self, nickname), RACObserve(self, position)] reduce:^id(NSString *nickname, NSString *position){
            return @(nickname.length > 0 && position.length > 0); //@をつけるのを忘れないこと
        }];
        
    }
    return self;
}

- (void)reset
{
//    RAC(self, _nickname) = RACObserve(self.model, name); //さらになにとかbindingするとき？一旦無視
    
    
}

@end

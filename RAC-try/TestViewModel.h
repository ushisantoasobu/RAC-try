//
//  TestViewModel.h
//  RAC-try
//
//  Created by shunsuke sato on 2014/09/07.
//  Copyright (c) 2014年 moguraproject. All rights reserved.
//

#import "RVMViewModel.h"

@interface TestViewModel : RVMViewModel

@property (nonatomic, strong) NSString *nickname;
@property (nonatomic, strong) NSString *nicknameWithMark;
@property (nonatomic, strong) NSString *position;
@property (nonatomic) BOOL validationInput;

-(void)reset;

@end

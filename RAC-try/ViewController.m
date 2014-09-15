//
//  ViewController.m
//  RAC-try
//
//  Created by shunsuke sato on 2014/09/07.
//  Copyright (c) 2014年 moguraproject. All rights reserved.
//

#import "ViewController.h"
#import <libextobjc/extobjc.h>
#import <ReactiveCocoa.h>
#import "TestViewModel.h"

@interface ViewController ()
{
    TestViewModel *_viewModel;
}
@property (weak, nonatomic) IBOutlet UILabel *labelNickname;
@property (weak, nonatomic) IBOutlet UILabel *labelNicknameWith;

@property (weak, nonatomic) IBOutlet UITextField *textFieldNickname;
@property (weak, nonatomic) IBOutlet UITextField *textFieldPosition;
@property (weak, nonatomic) IBOutlet UIButton *btnNickname;
@end



@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    _viewModel = [[TestViewModel alloc] init];
    [_viewModel setNickname:@"Iniesta"];
    
    //binding
//    @weakify(self);
    RAC(self.labelNickname, text) = RACObserve(_viewModel, nickname);
    RAC(self.labelNicknameWith, text) = RACObserve(_viewModel, nicknameWithMark);
    
    RAC(self.textFieldPosition, text) = RACObserve(_viewModel, position);
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)respondToBtnClose:(id)sender {
    [self.view endEditing:YES];
}

- (IBAction)respondToBtnUpdate:(id)sender {
    [_viewModel setNickname:_textFieldNickname.text];
    [_viewModel setPosition:_textFieldPosition.text];
}

- (IBAction)respondToBtnConfirm:(id)sender {
    if (_viewModel.validationInput) {
        NSLog(@"ok");
    } else {
        NSLog(@"NG!");
    }
}

@end

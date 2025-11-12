//
//  ViewController.m
//  ObjectC_FaceAISDK
//
//  Created by anylife on 2025/11/11.
//

#import "ViewController.h"


// 在你的 Objective-C 视图控制器的 .m 文件中
#import "ObjectC_FaceAISDK-Swift.h" // 导入自动生成的 Swift 头文件

@import ObjectC_FaceAISDK;  // 使用模块导入


@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeSystem];
    
    // OC页面跳转到SwiftUI页面
    button.frame = CGRectMake(50, 100, 200, 50);
    
    [button setTitle:@"OC页面跳转到SwiftUI页面" forState:UIControlStateNormal];
    [button addTarget:self action:@selector(buttonTapped:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];
}


// 按钮触发的方法,来自AI辅助编程,更多问题参考DeepSeek，ChatGPT
- (IBAction)buttonTapped:(id)sender {
    [SwiftUINavigator.shared presentSimpleSwiftUIFrom:self];
}



@end

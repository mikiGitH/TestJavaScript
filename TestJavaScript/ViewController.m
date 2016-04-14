//
//  ViewController.m
//  TestJavaScript
//
//  Created by 张锐 on 16/4/14.
//  Copyright © 2016年 张锐. All rights reserved.
//

#import "ViewController.h"
#import <JavaScriptCore/JavaScriptCore.h>

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.]
    
    UIWebView *webView = [[UIWebView alloc]initWithFrame:CGRectMake(0,210,100,200)];
    NSString *path = [[NSBundle mainBundle] pathForResource:@"index" ofType:@"html"];
    NSURLRequest *request = [[NSURLRequest alloc]initWithURL:[NSURL URLWithString:path]];
    [webView loadRequest:request];
    JSContext *context = [webView valueForKeyPath:@"documentView.webView.mainFrame.javaScriptContext"];
    context[@"showLoginViewForIOS"] = ^(){
        NSLog(@"Button Clicked");
        [self doLogin];
        return @"<div style='color:yellow;background-color:#333;'>返回结果</div>";
    };
    [self.view addSubview:webView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)doLogin{
    
    UIView *view = [[UIView alloc]initWithFrame:CGRectMake(0,0,200,200)];
    [view setBackgroundColor:[UIColor redColor]];
    
    [self.view addSubview:view];
    
}

@end

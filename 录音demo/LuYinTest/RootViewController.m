//
//  RootViewController.m
//  LuYinTest
//
//  Created by luowenqi on 13-12-21.
//  Copyright (c) 2013年 文奇 罗. All rights reserved.
//

#import "RootViewController.h"

@interface RootViewController ()

@end

@implementation RootViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        //下面代码应该是当前.m文件加载时候就设置
        
        AVAudioSession * audioSession = [AVAudioSession sharedInstance];
        
        [audioSession setCategory:AVAudioSessionCategoryPlayAndRecord error: nil]; //设置音频类别，这里表示当应用启动，停掉后台其他音频
        
        [audioSession setActive:YES error: nil];//设置当前应用音频活跃性
        

    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    
    
    NSDictionary *recordSetting = [[NSDictionary alloc] initWithObjectsAndKeys:
        [NSNumber numberWithFloat: 44100.0],AVSampleRateKey, //采样率
        [NSNumber numberWithInt: kAudioFormatLinearPCM],AVFormatIDKey,
        [NSNumber numberWithInt:16],AVLinearPCMBitDepthKey,//采样位数默认 16
        [NSNumber numberWithInt: 1], AVNumberOfChannelsKey,//通道的数目
        [NSNumber numberWithBool:NO],AVLinearPCMIsBigEndianKey,//大端还是小端是内存的组织方式
        [NSNumber numberWithBool:NO],AVLinearPCMIsFloatKey,nil];//采样信号是整数还是浮点数
    
    NSURL *recordedTmpFile = [NSURL fileURLWithPath:[NSTemporaryDirectory() stringByAppendingPathComponent:@"110.wav"]];  //文件名的设置
    NSLog(@"路径%@",recordedTmpFile);
    //Setup the recorder to use this file and record to it.
    
    recorder = [[ AVAudioRecorder alloc] initWithURL:recordedTmpFile settings:recordSetting error:nil];
    
    
    [recorder prepareToRecord];
    
    
    
    UIButton *BUTTON = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    BUTTON.frame = CGRectMake(0, 100, 100, 100);
    [BUTTON setTitle:@"开始录音" forState:UIControlStateNormal];
    [BUTTON addTarget:self action:@selector(start) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:BUTTON];
    
    UIButton *BUTTON2 = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    BUTTON2.frame = CGRectMake(0, 200, 100, 100);
    [BUTTON2 setTitle:@"停止" forState:UIControlStateNormal];
    [BUTTON2 addTarget:self action:@selector(Btnstop) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:BUTTON2];
    
    
    UIButton *BUTTON3 = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    BUTTON3.frame = CGRectMake(0, 300, 100, 100);
    [BUTTON3 setTitle:@"播放录音" forState:UIControlStateNormal];
    [BUTTON3 addTarget:self action:@selector(BtnBoFangLuyin) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:BUTTON3];
    


}
- (void) start
{
    [recorder record];

}

- (void) Btnstop
{
    [recorder stop];
}
- (void) BtnBoFangLuyin
{
    
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end

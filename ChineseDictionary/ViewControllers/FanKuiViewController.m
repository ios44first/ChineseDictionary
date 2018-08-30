//
//  FanKuiViewController.m
//  KeyBoard
//
//  Created by ibokan on 13-8-5.
//  Copyright (c) 2013年 ibokan. All rights reserved.
//

#import "FanKuiViewController.h"

#import "MyNavigationBar.h"
@interface FanKuiViewController ()
{
     UITextView *fanKuiTextView;
    FaceToolBar* ToolBar;
    IFlyRecognizerView * _iFlySpeechRecognizer;

    NSString *_grammerID;
    bool _isCancel;

}
@end

@implementation FanKuiViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}
-(void)dealloc
{
    self.imageView=nil;
    self.fanKuiImageView=nil;
    [_iFlySpeechRecognizer release];
    [super dealloc];
}
- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.view.backgroundColor=[UIColor colorWithPatternImage:[UIImage imageNamed:@"beijing.png"]];
    
    //自定义导航栏
    MyNavigationBar *myNavi=[[MyNavigationBar alloc]initWithview:self.view];
    self.navigationController.navigationBar.hidden=YES;
    //导航栏的按钮
    UIButton *back=[UIButton buttonWithType:UIButtonTypeCustom];
    back.frame=CGRectMake(0, 0, 40, 44);
    back.tag=1;
    [back addTarget:self action:@selector(back:) forControlEvents:UIControlEventTouchUpInside];
    UIImageView *moreView=[[UIImageView alloc]initWithFrame:CGRectMake(10, 10, 20, 20)];
    moreView.image=[UIImage imageNamed:@"return.png"];
    UIButton *backMain=[UIButton buttonWithType:UIButtonTypeCustom];
    backMain.frame=CGRectMake(275, 0, 40, 44);
    backMain.tag=2;
    [backMain addTarget:self action:@selector(back:) forControlEvents:UIControlEventTouchUpInside];
    UIImageView *backView=[[UIImageView alloc]initWithFrame:CGRectMake(285, 10, 20, 20)];
    backView.image=[UIImage imageNamed:@"home@2x.png"];
    [myNavi creatNavigationBarwithTitle:@"关于我们" andLeftButton:back andLeftImage:moreView andRightButton:backMain andRightImage:backView andView:self.view];
    [myNavi release];
    [moreView release];
    
    
    self.fanKuiImageView=[[UIImageView alloc]initWithImage:[UIImage imageNamed:@"fankuikuang@2x.png"]];
    self.fanKuiImageView.frame=CGRectMake(10, 54, 300, 352);
    [self.view addSubview:self.fanKuiImageView];
    [self.fanKuiImageView release];
   // self.fanKuiImageView.userInteractionEnabled=YES;
    fanKuiTextView=[[UITextView alloc]initWithFrame:CGRectMake(0, 5, 300, 347)];
    [fanKuiTextView setBackgroundColor:[UIColor clearColor]];
//    [fanKuiTextView setBackgroundColor:[UIColor colorWithPatternImage:[UIImage imageNamed:@"fankuikuang@2x.png"]]];
    [self.fanKuiImageView addSubview:fanKuiTextView];
    [fanKuiTextView release];
    
    _iFlySpeechRecognizer = [IFlyRecognizerViewManager getIFlyRecognizerView];
    
    ToolBar=[[FaceToolBar alloc]initWithFrame:CGRectMake(0.0f,self.view.frame.size.height - toolBarHeight,self.view.frame.size.width,toolBarHeight) superView:self.view andiFlySpeechRecognizer:_iFlySpeechRecognizer];
   ToolBar.speechRecgonizer.delegate=self;
    ToolBar.delegate=self;
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(doChange:) name:UIKeyboardWillShowNotification object:nil];
}
-(void)back:(UIButton *)sender
{
    if (sender.tag==1)
        [self.navigationController popViewControllerAnimated:YES];
    else
        [self.navigationController popToRootViewControllerAnimated:YES];
}
-(void)sendTextAction:(NSString *)inputText{
//    NSLog(@"sendTextAction%@",inputText);
    fanKuiTextView.text=inputText;
    [UIView animateWithDuration:0.25 animations:^{
        self.fanKuiImageView.frame=CGRectMake(10, 54, 300, 352);
//        fanKuiTextView.frame=self.fanKuiImageView.bounds;
        
    }];
    
    if ([MFMailComposeViewController canSendMail]) {
        //创建邮件视图控制器
        MFMailComposeViewController *picker = [[MFMailComposeViewController alloc] init];
        //设置主题
        [picker setSubject:@"用户意见反馈"];
        //设置发送对象
        [picker setToRecipients:[NSArray arrayWithObject:@"593623091@qq.com"]];
        //设置内容(是否支持标签文本内容,纯文本则给定NO)
        [picker setMessageBody:inputText isHTML:NO];
        //设置代理
        [picker setMailComposeDelegate:self];
        
//        UIImage * image=[UIImage imageNamed:@"ypym-086.jpg"];
//        NSData * imageData=UIImagePNGRepresentation(image);//转换成一个png格式的data
//        //      NSData * imageData=UIImageJPEGRepresentation(image, 1);//转换成一个jpeg格式的图片，第二个参数指定压缩的质量，0最低，1最高
//        
//        //添加附件
//        [picker addAttachmentData:imageData mimeType:@"image/jpeg" fileName:@"ypym-086.jpg"];//mimeType，媒体类型，指定文件在web中解析时的类型
        
        [self presentViewController:picker animated:YES completion:nil];
        [picker release];
    }

}
-(BOOL)textView:(UITextView *)textView shouldChangeTextInRange:(NSRange)range replacementText:(NSString *)text
{
    if ([text isEqualToString:@"\n"]) {
        [textView resignFirstResponder];
        [UIView animateWithDuration:0.25 animations:^{
            ToolBar.center=CGPointMake(160, 438);
            self.fanKuiImageView.frame=CGRectMake(10, 54, 300, 352);
//            fanKuiTextView.frame=self.fanKuiImageView.bounds;
        }];
    }
    return YES;
}
-(void)doChange:(NSNotification *)not
{
    NSDictionary *userInfo = [not userInfo];
    // Get the origin of the keyboard when it's displayed.
    NSValue* aValue = [userInfo objectForKey:UIKeyboardFrameEndUserInfoKey];
    // Get the top of the keyboard as the y coordinate of its origin in self's view's coordinate system. The bottom of the text view's frame should align with the top of the keyboard's final position.
    CGRect keyboardRect = [aValue CGRectValue];
    // Get the duration of the animation.
    NSValue *animationDurationValue = [userInfo objectForKey:UIKeyboardAnimationDurationUserInfoKey];
    NSTimeInterval animationDuration;
    [animationDurationValue getValue:&animationDuration];
    // Animate the resize of the text view's frame in sync with the keyboard's appearance.
    [self autoMovekeyBoard:keyboardRect.size.height];
}
-(void) autoMovekeyBoard: (float) h{
    [UIView animateWithDuration:0.25 animations:^{
        ToolBar.frame = CGRectMake(0.0f, (float)(480.0-h-64.0), 320.0f, 44.0f);
        self.fanKuiImageView.frame = CGRectMake(0.0f, 0.0f, 320.0f,(float)(480.0-h-68.0));
//        fanKuiTextView.frame=self.fanKuiImageView.bounds;
    }];
}
#pragma -mark 邮件发送完成后执行的代理方法
- (void)mailComposeController:(MFMailComposeViewController *)controller didFinishWithResult:(MFMailComposeResult)result error:(NSError *)error
{
    NSString *message;
    switch (result) {
            //发送中断，如进入发送界面后未发送，取消
        case MFMailComposeResultCancelled:
            message=@"发送中断！";
            break;
            //发送成功
        case MFMailComposeResultSent:
             message=@"发送成功！";
            break;
            //发送失败
        case MFMailComposeResultFailed:
             message=@"发送失败！";
            break;
            //保存成功，存草稿
        case MFMailComposeResultSaved:
             message=@"保存成功！";
            break;
        default:
            break;
    }
    UIAlertView *alertView=[[UIAlertView alloc] initWithTitle:@"提示" message:message delegate:self cancelButtonTitle:@"确定" otherButtonTitles: nil];
    [alertView show];
    [alertView release];
    [self dismissViewControllerAnimated:YES completion:nil];
}

#pragma mark method of IFlyRecognizerViewDelegate
-(void)onEnd:(IFlyRecognizerView *)iFlyRecognizerView theError:(IFlySpeechError *)error
{
    
}
-(void)onResult:(IFlyRecognizerView *)iFlyRecognizerView theResult:(NSArray *)resultArray
{
    NSLog(@"resultArray=%@",resultArray);
    NSMutableString *result = [[NSMutableString alloc] init];
    NSDictionary *dic = [resultArray objectAtIndex:0];
       for (NSString *key in dic) {
            [result appendFormat:@"%@",key];
       }
       NSLog(@"转写结果：%@",result);
       ToolBar.textView.text = [NSString stringWithFormat:@"%@%@", ToolBar.textView.text,result];
       [result release];
}


#pragma mark method of IFlySpeechRecognizerDelegate
//- (void) onVolumeChanged: (int)volume
//{
//    if (_isCancel) {
//        [_popUpView removeFromSuperview];
//        return;
//    }
//    NSString * vol = [NSString stringWithFormat:@"音量：%d",volume];
//    [_popUpView setText: vol];
//    [self.view addSubview:_popUpView];
//}
//-(void)onBeginOfSpeech
//{
//    [_popUpView setText:@"正在录音"];
//    [self.view addSubview:_popUpView];
//}
//-(void)onEndOfSpeech
//{
//    [_popUpView setText:@"停止录音"];
//    [self.view addSubview:_popUpView];
//}
//-(void)onError:(IFlySpeechError *)errorCode
//{
//    NSString *text;
//    if (_isCancel) {
//        text=@"取消识别";
//    }
//    else if(errorCode.errorCode==0)
//    {
//        text=@"识别成功";
//    }
//    else {
//        text = [NSString stringWithFormat:@"发生错误：%d %@",errorCode.errorCode,errorCode.errorDesc];
//        NSLog(@"%@",text);
//    }
//    [_popUpView setText: text];
//    [self.view addSubview:_popUpView];
//}
//-(void)onResults:(NSArray *)results
//{
//    NSMutableString *result = [[NSMutableString alloc] init];
//    NSDictionary *dic = [results objectAtIndex:0];
//    for (NSString *key in dic) {
//        [result appendFormat:@"%@",key];
//    }
//    NSLog(@"转写结果：%@",result);
//    ToolBar.textView.text = [NSString stringWithFormat:@"%@%@", ToolBar.textView.text,result];
//    [result release];
//    
//}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end

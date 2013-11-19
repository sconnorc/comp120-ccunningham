//
//  Project3ViewController.m
//  Project 3
//
//  Created by Connor Cunningham on 11/17/13.
//  Copyright (c) 2013 Connor Cunningham. All rights reserved.
//

#import "Project3ViewController.h"

@interface Project3ViewController ()

@property (weak, nonatomic) IBOutlet UITextField *usernameTextField;
@property (weak, nonatomic) IBOutlet UITextView *contentTextField;

@end

@implementation Project3ViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.contentTextField.text = @"Say something...";
    self.contentTextField.textColor = [UIColor lightGrayColor];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)changeColor:(id)sender
{
    
    NSString *username = self.usernameTextField.text;
    NSString *content = self.contentTextField.text;
    NSString *app_id = @"1";
    
    // Generate content for request
    NSString *post = [NSString stringWithFormat:@"&message[username]=%@&message[content]=%@&message[app_id]=%@",username,content,app_id];
    NSData *postData = [post dataUsingEncoding:NSASCIIStringEncoding allowLossyConversion:YES];
    NSString *postLength = [NSString stringWithFormat:@"%d",[postData length]];
    
    // Generate request with correct paramaters
    NSMutableURLRequest *request = [[NSMutableURLRequest alloc] init];
    [request setURL:[NSURL URLWithString:[NSString stringWithFormat:@"http://127.0.0.1:3000/messages"]]];
    [request setHTTPMethod:@"POST"];
    [request setValue:postLength forHTTPHeaderField:@"Content-Length"];
    [request setValue:@"application/x-www-form-urlencoded" forHTTPHeaderField:@"Current-Type"];
    [request setHTTPBody:postData];
    
    
    NSURLResponse *response;
    NSError *err;
    NSData *responseData = [NSURLConnection sendSynchronousRequest:request returningResponse:&response error:&err];
    NSString *str = [[NSString alloc] initWithData:responseData encoding:NSUTF8StringEncoding];
    NSString *str1 = @"{\"status\":\"ok\"}"; //Modify to match json returned from successful post
    
    // Generates alert messages for successful and non-successful posts
    if ([str isEqualToString:str1 ])
    {
        UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"Success" message:@"Your message was submitted successfully" delegate:nil cancelButtonTitle:@"Dismiss" otherButtonTitles:nil, nil];
        [alert show];
    }
    else
    {
        UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"Error" message:@"There was an error while submitting your message.  Please check the format for each field and try again." delegate:self cancelButtonTitle:@"Ok" otherButtonTitles:nil, nil];
        alert.tag = 1;
        [alert show];
    }
    

}

// Hides keyboard on return key touch for usernameTextField
- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    
    [self.usernameTextField resignFirstResponder];
    return YES;
}


// Hides keyboard on return key touch for contentTextField
- (BOOL)textView:(UITextView *)textView shouldChangeTextInRange:(NSRange)range replacementText:(NSString *)text
{
    
    if([text isEqualToString:@"\n"]) {
        [self.contentTextField resignFirstResponder];
        return NO;
    }
    
    return YES;
}

// Simulates placeholder for contentTextField
- (BOOL) textViewShouldBeginEditing:(UITextView *)textView
{
    self.contentTextField.text = @"";
    self.contentTextField.textColor = [UIColor blackColor];
    return YES;
}

-(void) textViewDidChange:(UITextView *)textView
{
    if(self.contentTextField.text.length == 0){
        self.contentTextField.textColor = [UIColor lightGrayColor];
        self.contentTextField.text = @"Comment";
        [self.contentTextField resignFirstResponder];
    }
}



@end

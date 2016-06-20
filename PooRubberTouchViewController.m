//
//  PooRubberTouchViewController.m
//  Rubber
//
//  Created by crazypoo on 14-2-19.
//  Copyright (c) 2014年 crazypoo. All rights reserved.
//

#import "PooRubberTouchViewController.h"

@interface PooRubberTouchViewController ()
{
    BOOL ISENBALE;
}
@property (nonatomic, retain) IBOutlet UIImageView *MyImageView;
@property (nonatomic, retain) IBOutlet UIImageView *MyImageViewA;
@property (nonatomic, retain) IBOutlet UIButton *MyBackButton;

@end

@implementation PooRubberTouchViewController
@synthesize imagenumber;
@synthesize MyBackButton = _MyBackButton;
@synthesize MyImageView = _MyImageView;
@synthesize MyImageViewA = _MyImageViewA;

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
//    NSString *imagenameA = [NSString stringWithFormat:@"%ldA.jpg",(long)imagenumber];
//    NSString *imagenameB = [NSString stringWithFormat:@"%ldB.jpg",(long)imagenumber];
    
    self.MyImageView.image = self.image;
    self.MyImageViewA.image = [UIImage imageNamed:@"0B.jpg"];
//    self.MyImageViewA.alpha = 0.5;
    
    
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
	UITouch *touch = [touches anyObject];
	if([touch view] == self.MyImageViewA)
	{
		ISENBALE = YES;
	}
	
}

-(void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event
{
	UITouch *touch = [touches anyObject];
	if(ISENBALE)
	{
		CGPoint currentPoint = [touch locationInView:self.MyImageViewA];
		UIGraphicsBeginImageContext(self.MyImageViewA.frame.size);
		[self.MyImageViewA.image drawInRect:self.MyImageViewA.bounds];
		CGContextClearRect (UIGraphicsGetCurrentContext(), CGRectMake(currentPoint.x-15, currentPoint.y-15, 30, 30));
		self.MyImageViewA.image = UIGraphicsGetImageFromCurrentImageContext();
		UIGraphicsEndImageContext();
	}
}

-(void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event
{
	ISENBALE = NO;
}

//- (IBAction)BackHome:(id)sender {
//    [[NSNotificationCenter defaultCenter] postNotificationName:@"backhome" object:[UIApplication sharedApplication]];
//}

- (void)viewDidUnload
{
    [self setMyImageViewA:nil];
    [self setMyBackButton:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}
@end

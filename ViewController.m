//
//  ViewController.m
//  food
//
//  Created by 王楠 on 16/5/21.
//  Copyright © 2016年 Apress. All rights reserved.
//

#import "ViewController.h"
#import <MediaPlayer/MediaPlayer.h>
#import <MobileCoreServices/UTCoreTypes.h>
#import "ReviseViewController.h"
#import "mapSearchController.h"



@interface ViewController ()<UIImagePickerControllerDelegate, UINavigationControllerDelegate,huichuanlatitudeandlongitudeDelegate>


@property (weak, nonatomic) IBOutlet UIImageView *imageView;
@property (strong, nonatomic) IBOutlet UIBarButtonItem *takePictureButton;
@property (strong, nonatomic) MPMoviePlayerController *moviePlayerController;
@property (strong, nonatomic) UIImage *image;
@property (strong, nonatomic) NSURL *movieURL;
@property (copy, nonatomic) NSString *lastChosenMediaType;
@property (nonatomic, strong)ReviseViewController *revise;
@property (nonatomic,strong) UIImage * image2;


- (IBAction)shootPictureOrViedo:(id)sender;
- (IBAction)selectExistingPictureOrVideo:(id)sender;


@end

@implementation ViewController
@synthesize revise = _revise;


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    [self.navigationController.navigationBar setBarTintColor:[UIColor colorWithRed:20/255.0 green:155/255.0 blue:213/255.0 alpha:1.0]];
    [self.navigationController.navigationBar setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:[UIColor whiteColor],UITextAttributeTextColor,nil]];
    
//    [self.navigationController  setToolbarHidden:NO animated:YES];
    
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    if (_image2 != _image)
    {
        [self updateDisplay];
        
    }
}

- (void)updateDisplay {
    if ([self.lastChosenMediaType isEqual:(NSString *)kUTTypeImage])
    {
        self.image2 = self.image;
//        self.imageView.hidden = NO;
    
        self.revise = [[UIStoryboard storyboardWithName:@"Main" bundle:[NSBundle mainBundle]] instantiateViewControllerWithIdentifier:@"ReviseViewController"];
        
        NSLog(@"___updateDisplay____%@",self.image);

        
//        self.revise.image= indexPath.row;
        self.revise.image=self.image;
//        self.revise.imageView = [[UIImageView alloc] init];

        NSLog(@"___updateDisplay____%@",self.revise.image);

        _revise.str = @"1234";
        self.revise.imageView.image = self.image;
        [self.navigationController pushViewController:_revise animated:YES];
        
        
//        self.moviePlayerController.view.hidden = YES;
//    } else if ([self.lastChosenMediaType isEqual:(NSString *)kUTTypeMovie]) {
//        if (self.moviePlayerController == nil) {
//            self.moviePlayerController = [[MPMoviePlayerController alloc]
//                                          initWithContentURL:self.movieURL];
//            UIView *movieView = self.moviePlayerController.view;
//            movieView.frame = self.imageView.frame;
//            movieView.clipsToBounds = YES;
//            [self.view addSubview:movieView];
//            [self setMoviePlayerLayoutConstraints]; // TODO:
//        } else {
//            self.moviePlayerController.contentURL = self.movieURL;
//        }
//        self.imageView.hidden = YES;
//        self.moviePlayerController.view.hidden = NO;
//        [self.moviePlayerController play];
    }
}

- (void)pickMediaFromSource:(UIImagePickerControllerSourceType)sourceType {
    NSArray *mediaTypes = [UIImagePickerController
                           availableMediaTypesForSourceType:sourceType];
    if ([UIImagePickerController
         isSourceTypeAvailable:sourceType] && [mediaTypes count] > 0) {
        UIImagePickerController *picker = [[UIImagePickerController alloc] init];
        picker.mediaTypes = mediaTypes;
        picker.delegate = self;
        picker.allowsEditing = YES;
        picker.sourceType = sourceType;
        [self presentViewController:picker animated:YES completion:NULL];
    } else {
        UIAlertController *alertController =
        [UIAlertController alertControllerWithTitle:@"Error accessing media"
                                            message:@"Unsupported media source."
                                     preferredStyle:UIAlertControllerStyleAlert];
        UIAlertAction *okAction = [UIAlertAction actionWithTitle:@"OK"
                                                           style:UIAlertActionStyleCancel handler:nil];
        [alertController addAction:okAction];
        [self presentViewController:alertController animated:YES completion:nil];
    }
}

#pragma mark - Image Picker Controller delegate methods

- (void)imagePickerController:(UIImagePickerController *)picker
didFinishPickingMediaWithInfo:(NSDictionary *)info {
    self.lastChosenMediaType = info[UIImagePickerControllerMediaType];
    if ([self.lastChosenMediaType isEqual:(NSString *)kUTTypeImage]) {
        self.image = info[UIImagePickerControllerEditedImage];
        
        NSLog(@"___picker Controller____%@",self.image);
        
    } else if ([self.lastChosenMediaType isEqual:(NSString *)kUTTypeMovie]) {
        self.movieURL = info[UIImagePickerControllerMediaURL];
    }
    [picker dismissViewControllerAnimated:YES completion:NULL];
}

- (void)imagePickerControllerDidCancel:(UIImagePickerController *)picker {
    [picker dismissViewControllerAnimated:YES completion:NULL];
}




- (void)setMoviePlayerLayoutConstraints {
    UIView *moviePlayerView = self.moviePlayerController.view;
    UIView *takePictureButton = self.takePictureButton;
    moviePlayerView.translatesAutoresizingMaskIntoConstraints = NO;
    NSDictionary *views = NSDictionaryOfVariableBindings(moviePlayerView, takePictureButton);
    [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|[moviePlayerView]|" options:0 metrics:nil views:views]];
    [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|[moviePlayerView]-0-[takePictureButton]" options:0 metrics:nil views:views]];
}


- (IBAction)shootPictureOrViedo:(id)sender {
    [self pickMediaFromSource:UIImagePickerControllerSourceTypeCamera];
}
- (IBAction)mapSearch:(UIBarButtonItem *)sender
{
    mapSearchController * Msc = [[mapSearchController alloc] init];
    
    Msc.delegate = self;
    
    [self.navigationController pushViewController:Msc animated:YES];
}

- (IBAction)selectExistingPictureOrVideo:(id)sender {
    [self pickMediaFromSource:UIImagePickerControllerSourceTypePhotoLibrary];
}

-(void)huichuanlongitude:(CGFloat)longitude andlatitude:(CGFloat)latitude
{
    
}
@end
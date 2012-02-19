//
//  TestTimerViewController.m
//  TestTimer
//
//  Created by bird on 12/2/18.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "TestTimerViewController.h"

@interface TestTimerViewController()

//
// UI outlets
//
@property (weak, nonatomic) IBOutlet UILabel *timerLabel;

//
// Properties
//
@property (strong, nonatomic) NSTimer* myTimer; 

@property (nonatomic) int count; 

//
// Methods
//
-(void)timerFireMethod:(NSTimer*)aTimer;

-(void)updateTimerLabel;

@end

@implementation TestTimerViewController

//
// synthesize
//
@synthesize timerLabel = mTimerLabel;

@synthesize myTimer = mMyTimer;

@synthesize count = mCount; // will be set to 0 even if we don't init it in the constructor 

//
// Method implementation
//
- (IBAction)onTimerStartClicked:(UIButton*)sender 
{
    self.myTimer = 
        [NSTimer scheduledTimerWithTimeInterval:0.5
                                         target:self 
                                       selector:@selector(timerFireMethod:)
                                       userInfo:nil 
                                        repeats:YES];
}

- (IBAction)onTimerStopClicked:(id)sender 
{
    [self.myTimer invalidate];
    self.myTimer = nil;
    self.count = 0;
    [self updateTimerLabel];
}

- (void)timerFireMethod:(NSTimer*)aTimer
{
    NSLog( @"test" );
    self.count++;
    [self updateTimerLabel];
}

-(void)updateTimerLabel
{
    self.timerLabel.text = [NSString stringWithFormat:@"%d", self.count];
}

- (void)viewDidUnload 
{
    [self setTimerLabel:nil];
    [super viewDidUnload];
}
@end

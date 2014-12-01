//
//  ViewController.m
//  Machismo
//
//  Created by Nelson Wittwer on 11/26/14.
//  Copyright (c) 2014 Nelson Wittwer. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UILabel *flipsLabel;
@property (nonatomic) int flipCount;
@end

@implementation ViewController

- (void)viewDidLoad {
  [super viewDidLoad];
  // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
  [super didReceiveMemoryWarning];
  // Dispose of any resources that can be recreated.
}
- (void) setFlipCount:(int)flipCount
{
  _flipCount = flipCount;
  self.flipsLabel.text = [NSString stringWithFormat:@"Flips: %d", self.flipCount];
  NSLog(@"flipCount = %d", self.flipCount);
}
- (IBAction)touchCardButton:(UIButton *)sender {
  if ([sender.currentTitle length]){
    [sender setBackgroundImage:[UIImage imageNamed:@"cardback"]
                    forState:UIControlStateNormal];
    [sender setTitle:@"" forState:UIControlStateNormal];
  } else {
    [sender setBackgroundImage:[UIImage imageNamed:@"cardback"]
                    forState:UIControlStateNormal];
    [sender setTitle:@"A" forState:UIControlStateNormal];
  }
  self.flipCount++;
}

@end

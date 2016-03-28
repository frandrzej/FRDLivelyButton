//
//  TestViewController.m
//  FancyBarButton
//
//  Created by Sebastien Windal on 2/24/14.
//  Copyright (c) 2014 Sebastien Windal. All rights reserved.
//

#import "TestViewController.h"
#import "FRDLivelyButton.h"

@interface TestViewController ()

@property (weak, nonatomic) IBOutlet FRDLivelyButton *bigButton;

@property (weak, nonatomic) IBOutlet FRDLivelyButton *burgerButton;
@property (weak, nonatomic) IBOutlet FRDLivelyButton *plustButton;
@property (weak, nonatomic) IBOutlet FRDLivelyButton *plusCircleButton;
@property (weak, nonatomic) IBOutlet FRDLivelyButton *closeButton;
@property (weak, nonatomic) IBOutlet FRDLivelyButton *closeCircleButton;
@property (weak, nonatomic) IBOutlet FRDLivelyButton *upCaretButton;
@property (weak, nonatomic) IBOutlet FRDLivelyButton *downCaretButton;
@property (weak, nonatomic) IBOutlet FRDLivelyButton *leftCaretButton;
@property (weak, nonatomic) IBOutlet FRDLivelyButton *rightCaretButton;
@property (weak, nonatomic) IBOutlet FRDLivelyButton *leftArrowButton;
@property (weak, nonatomic) IBOutlet FRDLivelyButton *rightArrowButton;

@end

@implementation TestViewController
{
    kFRDLivelyButtonStyle newStyle;
}

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
	// Do any additional setup after loading the view.
    
    [self.burgerButton setStyle:kFRDLivelyButtonStyleHamburger animated:NO];
    [self.plusCircleButton setStyle:kFRDLivelyButtonStyleCirclePlus animated:NO];
    [self.plustButton setStyle:kFRDLivelyButtonStylePlus animated:NO];
    [self.closeButton setStyle:kFRDLivelyButtonStyleClose animated:NO];
    [self.closeCircleButton setStyle:kFRDLivelyButtonStyleCircleClose animated:NO];
    [self.upCaretButton setStyle:kFRDLivelyButtonStyleCaretUp animated:NO];
    [self.downCaretButton setStyle:kFRDLivelyButtonStyleCaretDown animated:NO];
    [self.leftCaretButton setStyle:kFRDLivelyButtonStyleCaretLeft animated:NO];
    [self.rightCaretButton setStyle:kFRDLivelyButtonStyleCaretRight animated:NO];
    [self.leftArrowButton setStyle:kFRDLivelyButtonStyleArrowLeft animated:NO];
    [self.rightArrowButton setStyle:kFRDLivelyButtonStyleArrowRight animated:NO];
    
    [self.bigButton setTintColor:UIColor.blackColor];
    [self.bigButton setBackgroundColor:[UIColor colorWithWhite:0.7 alpha:1]];
    //    self.bigButton.titleLabel.font = [UIFont systemFontOfSize:24.0];
    //    self.bigButton.textAllignment = FRDLivelyButtonTextAllignmentRight;
    //    [self.bigButton setTitle:@"Lively" forState:UIControlStateNormal];
    
    [self.bigButton setAttributedTitle:[self multilineAttributedString] forState:UIControlStateNormal];
    [self.bigButton.titleLabel setNumberOfLines:0];
    [self.bigButton.titleLabel setLineBreakMode:NSLineBreakByWordWrapping];
    
    [self.bigButton setStyle:kFRDLivelyButtonStyleClose animated:YES];
    [self.bigButton setOptions:@{ kFRDLivelyButtonLineWidth: @(4.0f),
                                  kFRDLivelyButtonUnHighlightAnimationDuration: @(0.1),
                                  kFRDLivelyButtonHighlightAnimationDuration: @(0.03)} ];
    
    FRDLivelyButton *button = [[FRDLivelyButton alloc] initWithFrame:CGRectMake(0,0,36,28)];
    [button setOptions:@{ kFRDLivelyButtonLineWidth: @(2.0f),
                          kFRDLivelyButtonHighlightedColor: [UIColor colorWithRed:0.5 green:0.8 blue:1.0 alpha:1.0],
                          kFRDLivelyButtonColor: [UIColor blueColor]
                          }];
    [button setStyle:kFRDLivelyButtonStyleHamburger animated:NO];
    [button addTarget:self action:@selector(buttonAction:) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *buttonItem = [[UIBarButtonItem alloc] initWithCustomView:button];
    self.navigationItem.rightBarButtonItem = buttonItem;
}

-(NSAttributedString *)multilineAttributedString
{
    NSMutableParagraphStyle *style = [[NSParagraphStyle defaultParagraphStyle] mutableCopy];
    [style setAlignment:NSTextAlignmentCenter];
    [style setLineBreakMode:NSLineBreakByWordWrapping];
    
    UIFont *font1 = [UIFont fontWithName:@"HelveticaNeue-Medium" size:20.0f];
    UIFont *font2 = [UIFont fontWithName:@"HelveticaNeue-Light"  size:20.0f];
    NSDictionary *dict1 = @{NSUnderlineStyleAttributeName:@(NSUnderlineStyleSingle),
                            NSFontAttributeName:font1,
                            NSParagraphStyleAttributeName:style}; // Added line
    NSDictionary *dict2 = @{NSUnderlineStyleAttributeName:@(NSUnderlineStyleNone),
                            NSFontAttributeName:font2,
                            NSParagraphStyleAttributeName:style}; // Added line
    
    NSMutableAttributedString *attString = [[NSMutableAttributedString alloc] init];
    [attString appendAttributedString:[[NSAttributedString alloc] initWithString:@"LINE 1\n"    attributes:dict1]];
    [attString appendAttributedString:[[NSAttributedString alloc] initWithString:@"line 2"      attributes:dict2]];
    
    return attString.copy;
}

- (IBAction)changeButtonStyleAction:(FRDLivelyButton *)sender
{
    [self.bigButton setStyle:sender.buttonStyle animated:YES];
}

- (IBAction)buttonAction:(FRDLivelyButton *)sender
{
    newStyle = (newStyle + 1) % 11;
    
    [sender setStyle:newStyle animated:YES];
}

@end

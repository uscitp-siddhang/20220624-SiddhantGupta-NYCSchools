//
//  SchoolDetailViewController.m
//  20220624-SiddhantGupta-NYCSchools
//
//  Created by Siddhant Gupta on 6/24/22.
//

#import "SchoolDetailViewController.h"
#import "_0220624_SiddhantGupta_NYCSchools-Swift.h"

@interface SchoolDetailViewController ()
@property (weak, nonatomic) IBOutlet UILabel *schoolNameLabel;
@property (weak, nonatomic) IBOutlet UILabel *addressLabel;
@property (weak, nonatomic) IBOutlet UILabel *locationLabel;
@property (weak, nonatomic) IBOutlet UILabel *descriptionLabel;
@property (weak, nonatomic) IBOutlet UILabel *numTakersLabel;
@property (weak, nonatomic) IBOutlet UILabel *readingLabel;
@property (weak, nonatomic) IBOutlet UILabel *writingLabel;
@property (weak, nonatomic) IBOutlet UILabel *mathLabel;
@property (weak, nonatomic) IBOutlet UIView *schoolInfoView;
@property (weak, nonatomic) IBOutlet UIView *SATDetailView;
@property (weak, nonatomic) IBOutlet UIView *descriptionView;
@property (weak, nonatomic) IBOutlet UIButton *urlButton;
@property (strong, nonatomic) NSMutableString *urlString;
@end

@implementation SchoolDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}
- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    self.SATDetailView.layer.cornerRadius = 10.0;
    self.SATDetailView.clipsToBounds = YES;
    self.schoolInfoView.layer.cornerRadius = 10.0;
    self.schoolInfoView.clipsToBounds = YES;
    self.descriptionView.layer.cornerRadius = 10.0;
    self.descriptionView.clipsToBounds = YES;

}

-(void)setupViewWithSchool : (School*)school SATScores : (SchoolSAT*)SATScores{
    self.schoolNameLabel.text = school.schoolName;
    self.addressLabel.text = school.address;
    NSMutableString *locationString = [school.neighborhood mutableCopy];
    [locationString appendString:@", "];
    [locationString appendString:school.city];
    [locationString appendString:@", "];
    [locationString appendString:school.postalCode];
    self.locationLabel.text = locationString;
    self.descriptionLabel.text = school.overview;
    self.numTakersLabel.text = SATScores.numTakers;
    self.readingLabel.text = SATScores.reading;
    self.writingLabel.text = SATScores.writing;
    self.mathLabel.text = SATScores.math;
    self.urlString = [@"https://" mutableCopy];
    [self.urlString appendString:school.website];
}
- (IBAction)urlButtonTouched:(id)sender {
    NSURL *url = [[ NSURL alloc ] initWithString: self.urlString ];
    [[UIApplication sharedApplication]openURL:url options:@{} completionHandler:nil];
}



@end

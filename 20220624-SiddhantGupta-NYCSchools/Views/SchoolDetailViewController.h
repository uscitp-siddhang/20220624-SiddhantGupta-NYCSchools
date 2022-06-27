//
//  SchoolDetailViewController.h
//  20220624-SiddhantGupta-NYCSchools
//
//  Created by Siddhant Gupta on 6/24/22.
//

#import <UIKit/UIKit.h>
@class School;
@class SchoolSAT;

NS_ASSUME_NONNULL_BEGIN

@interface SchoolDetailViewController : UIViewController

-(void)setupViewWithScore : (School*)school SATScores : (SchoolSAT*)SATScores;

@end

NS_ASSUME_NONNULL_END

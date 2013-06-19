//
//  JCDetailViewController.h
//  Judson
//
//  Created by Richard Guy on 6/19/13.
//  Copyright (c) 2013 Jackie Cannizzo. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface JCDetailViewController : UIViewController

@property (strong, nonatomic) id detailItem;

@property (weak, nonatomic) IBOutlet UILabel *detailDescriptionLabel;
@end

//
//  DetailViewController.h
//  MaterialDesignDemo
//
//  Created by twidle on 2/27/15.
//  Copyright (c) 2015 viktor. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DetailViewController : UIViewController

@property (strong, nonatomic) id detailItem;
@property (weak, nonatomic) IBOutlet UILabel *detailDescriptionLabel;

@end


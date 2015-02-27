//
//  MasterViewController.m
//  MaterialDesignDemo
//
//  Created by twidle on 2/27/15.
//  Copyright (c) 2015 viktor. All rights reserved.
//

#import "MasterViewController.h"
#import "DetailViewController.h"

#import <VCMaterialDesignIcons/VCMaterialDesignIcons.h>

@interface MasterViewControllerCell : UITableViewCell

- (void)setCode:(NSString *)mdCode;

@end

@interface MasterViewControllerCell ()

@property (strong, nonatomic) UIImageView *imageView;

@end

@implementation MasterViewControllerCell

- (instancetype)init {
  if ((self = [super init])) {
    self.imageView = [UIImageView.alloc initWithFrame:CGRectMake(0.f, 0.f, 30.f, 30.f)];
  }
  return self;
}

- (void)setCode:(NSString *)mdCode {
  VCMaterialDesignIcons *icons = [VCMaterialDesignIcons iconWithCode:mdCode fontSize:30.f];
  [icons addAttribute:NSForegroundColorAttributeName value:[self getRandomColor]];
  self.imageView.image = [icons image];
}

- (UIColor *)getRandomColor {
//  https://gist.github.com/kylefox/1689973
  CGFloat color = ( arc4random() % 256 / 256.0 ) + 0.5;  //  0.5 to 1.0, away from white
  CGFloat saturation = ( arc4random() % 128 / 256.0 ) + 0.5;  //  0.5 to 1.0, away from white
  CGFloat brightness = ( arc4random() % 128 / 256.0 ) + 0.5;  //  0.5 to 1.0, away from black
  return [UIColor colorWithHue:color saturation:saturation brightness:brightness alpha:1];
}

@end

@interface MasterViewController ()

@property NSMutableArray *objects;
@end

@implementation MasterViewController

- (void)awakeFromNib {
  [super awakeFromNib];
}

- (void)viewDidLoad {
  [super viewDidLoad];
  // Do any additional setup after loading the view, typically from a nib.
  self.navigationItem.leftBarButtonItem = self.editButtonItem;

  self.objects = [NSMutableArray array];
  [self.objects addObject:[VCMaterialDesignIcons allIcons][arc4random_uniform((u_int32_t)[VCMaterialDesignIcons allIcons].count)]];
  [self.objects addObject:[VCMaterialDesignIcons allIcons][arc4random_uniform((u_int32_t)[VCMaterialDesignIcons allIcons].count)]];
  [self.objects addObject:[VCMaterialDesignIcons allIcons][arc4random_uniform((u_int32_t)[VCMaterialDesignIcons allIcons].count)]];
  [self.objects addObject:[VCMaterialDesignIcons allIcons][arc4random_uniform((u_int32_t)[VCMaterialDesignIcons allIcons].count)]];
  [self.objects addObject:[VCMaterialDesignIcons allIcons][arc4random_uniform((u_int32_t)[VCMaterialDesignIcons allIcons].count)]];
  [self.objects addObject:[VCMaterialDesignIcons allIcons][arc4random_uniform((u_int32_t)[VCMaterialDesignIcons allIcons].count)]];
  [self.objects addObject:[VCMaterialDesignIcons allIcons][arc4random_uniform((u_int32_t)[VCMaterialDesignIcons allIcons].count)]];
  [self.objects addObject:[VCMaterialDesignIcons allIcons][arc4random_uniform((u_int32_t)[VCMaterialDesignIcons allIcons].count)]];
  [self.objects addObject:[VCMaterialDesignIcons allIcons][arc4random_uniform((u_int32_t)[VCMaterialDesignIcons allIcons].count)]];
  [self.objects addObject:[VCMaterialDesignIcons allIcons][arc4random_uniform((u_int32_t)[VCMaterialDesignIcons allIcons].count)]];
  [self.objects addObject:[VCMaterialDesignIcons allIcons][arc4random_uniform((u_int32_t)[VCMaterialDesignIcons allIcons].count)]];

  UIBarButtonItem *addButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(insertNewObject:)];
  self.navigationItem.rightBarButtonItem = addButton;

  [self.tableView registerClass:MasterViewControllerCell.class forCellReuseIdentifier:@"Cell"];
}

- (void)didReceiveMemoryWarning {
  [super didReceiveMemoryWarning];
  // Dispose of any resources that can be recreated.
}

- (void)insertNewObject:(id)sender {
  if (!self.objects) {
      self.objects = [[NSMutableArray alloc] init];
  }
  [self.objects insertObject:[VCMaterialDesignIcons allIcons][arc4random_uniform((u_int32_t)[VCMaterialDesignIcons allIcons].count)] atIndex:0];
  NSIndexPath *indexPath = [NSIndexPath indexPathForRow:0 inSection:0];
  [self.tableView insertRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationAutomatic];
}

#pragma mark - Segues

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
  if ([[segue identifier] isEqualToString:@"showDetail"]) {
      NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
      NSDate *object = self.objects[indexPath.row];
      [[segue destinationViewController] setDetailItem:object];
  }
}

#pragma mark - Table View

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
  return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
  return self.objects.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
  MasterViewControllerCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell" forIndexPath:indexPath];
  if (!cell)
    cell = [MasterViewControllerCell.alloc init];

  [cell setCode:self.objects[indexPath.row]];
  return cell;
}

- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
  // Return NO if you do not want the specified item to be editable.
  return YES;
}

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
  if (editingStyle == UITableViewCellEditingStyleDelete) {
      [self.objects removeObjectAtIndex:indexPath.row];
      [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
  } else if (editingStyle == UITableViewCellEditingStyleInsert) {
      // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view.
  }
}

@end

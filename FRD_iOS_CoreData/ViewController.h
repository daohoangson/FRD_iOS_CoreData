//
//  ViewController.h
//  FRD_iOS_CoreData
//
//  Created by Dao Hoang Son on 11/16/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreData/CoreData.h>
#import "Info.h"

#define INFO_KEY_USERNAME @"username"
#define INFO_KEY_PASSWORD @"password"
#define INFO_KEY_REMEMBER @"remember"
#define INFO_VALUE_REMEMBER_YES @"yes"

@interface ViewController : UIViewController {
    Info *infoUsername;
    Info *infoPassword;
    Info *infoRemember;
}
@property (retain, nonatomic) IBOutlet UITextField *txtUsername;
@property (retain, nonatomic) IBOutlet UITextField *txtPassword;
@property (retain, nonatomic) IBOutlet UISwitch *swtRemember;
@property (retain, nonatomic) NSManagedObjectContext *managedObjectContext;
- (IBAction)login:(id)sender;

@end

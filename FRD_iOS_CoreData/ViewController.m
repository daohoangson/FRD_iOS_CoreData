//
//  ViewController.m
//  FRD_iOS_CoreData
//
//  Created by Dao Hoang Son on 11/16/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import "ViewController.h"

@implementation ViewController
@synthesize txtUsername;
@synthesize txtPassword;
@synthesize swtRemember;
@synthesize managedObjectContext;

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    infoUsername = nil;
    infoPassword = nil;
    infoRemember = nil;
    
    NSFetchRequest *request = [[NSFetchRequest alloc] init];
    NSEntityDescription *entity = [NSEntityDescription entityForName:@"Info" inManagedObjectContext:managedObjectContext];
    [request setEntity:entity];
    NSArray *results = [[managedObjectContext executeFetchRequest:request error:nil] copy];
    if (results != nil) {
        for (Info *info in results) {
            if ([info.key isEqualToString:INFO_KEY_USERNAME]) {
                infoUsername = [info retain];
            } else if ([info.key isEqualToString:INFO_KEY_PASSWORD]) {
                infoPassword = [info retain];
            } else if ([info.key isEqualToString:INFO_KEY_REMEMBER]) {
                infoRemember = [info retain];
            }
            
            NSLog(@"%@: %@", info.key, info.value);
        }
        [results release];
    }
    [entity release];
    [request release];
    
    if (infoRemember != nil && [infoRemember.value isEqualToString:INFO_VALUE_REMEMBER_YES]) {
        if (infoUsername != nil) {
            [txtUsername setText:infoUsername.value];
        }
        if (infoPassword != nil) {
            [txtPassword setText:infoPassword.value];
        }
        [swtRemember setOn:YES];
    } else {
        [swtRemember setOn:NO];
    }
}

- (void)viewDidUnload
{
    [self setTxtUsername:nil];
    [self setTxtPassword:nil];
    [self setSwtRemember:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (void)dealloc {
    [txtUsername release];
    [txtPassword release];
    [swtRemember release];
    
    [infoUsername release];
    [infoPassword release];
    [infoRemember release];
    
    [super dealloc];
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
}

- (void)viewWillDisappear:(BOOL)animated
{
	[super viewWillDisappear:animated];
}

- (void)viewDidDisappear:(BOOL)animated
{
	[super viewDidDisappear:animated];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}

#pragma mark Actions

- (IBAction)login:(id)sender {
    if (infoUsername != nil) {
        NSLog(@"%@: %@", infoUsername.key, infoUsername.value);
        [managedObjectContext deleteObject:infoUsername];
        infoUsername = nil;
    }
    if (infoPassword != nil) {
        NSLog(@"%@: %@", infoPassword.key, infoPassword.value);
        [managedObjectContext deleteObject:infoPassword];
        infoPassword = nil;
    }
    if (infoRemember != nil) {
        NSLog(@"%@: %@", infoRemember.key, infoRemember.value);
        [managedObjectContext deleteObject:infoRemember];
        infoRemember = nil;
    }
    
    if (swtRemember.on) {
        infoUsername = [[NSEntityDescription insertNewObjectForEntityForName:@"Info" inManagedObjectContext:managedObjectContext] retain];
        [infoUsername setKey:INFO_KEY_USERNAME];
        [infoUsername setValue:txtUsername.text];
        
        infoPassword = [[NSEntityDescription insertNewObjectForEntityForName:@"Info" inManagedObjectContext:managedObjectContext] retain];
        [infoPassword setKey:INFO_KEY_PASSWORD];
        [infoPassword setValue:txtPassword.text];
        
        infoRemember = [[NSEntityDescription insertNewObjectForEntityForName:@"Info" inManagedObjectContext:managedObjectContext] retain];
        [infoRemember setKey:INFO_KEY_REMEMBER];
        [infoRemember setValue:INFO_VALUE_REMEMBER_YES];
    }
    
    [managedObjectContext save:nil];
    
    UIAlertView *alert = [[UIAlertView alloc]
                          initWithTitle:@"Congrats"
                          message:[NSString stringWithFormat:@"Hey %@, you figured it out!", txtUsername.text]
                          delegate:nil
                          cancelButtonTitle:@"Dismiss"
                          otherButtonTitles:nil];
    [alert show];
    [alert release];
}
@end

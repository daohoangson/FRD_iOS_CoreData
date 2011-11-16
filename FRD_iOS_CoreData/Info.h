//
//  Info.h
//  FRD_iOS_CoreData
//
//  Created by Dao Hoang Son on 11/16/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>


@interface Info : NSManagedObject

@property (nonatomic, retain) NSString * key;
@property (nonatomic, retain) NSString * value;

@end

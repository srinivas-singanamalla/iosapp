//
//  StopDAO.m
//  PumperApp
//
//  Created by Srinivas Singanamalla on 2/23/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "StopDAO.h"
#import "Stop.h"
#import "NSManagedObject+Additions.h"

#import "BIDAppDelegate.h"

@interface StopDAO()
- (NSString*) newString:(NSInteger)num;
@property (strong, nonatomic) NSDictionary* stopsDictionary;

@end

@implementation StopDAO
@synthesize stopsDictionary = _stopsDictionary;
@synthesize stopDAODelegate = _stopDAODelegate;
- (id) init {
    self = [super init];
    if (self != nil) {
    }
    return self;
}

- (NSManagedObject*) getStop:(NSInteger) stopId {
    NSFetchRequest* fetchRequest = [[NSFetchRequest alloc] init];
    BIDAppDelegate *appDelegate = (BIDAppDelegate*)[[UIApplication sharedApplication] delegate];
    NSManagedObjectContext *objectContext = [appDelegate managedObjectContext];
    NSEntityDescription* entityDescription = [NSEntityDescription entityForName:@"Stop" inManagedObjectContext:objectContext];
    [fetchRequest setEntity:entityDescription];
    NSPredicate* predicate = [NSPredicate predicateWithFormat:@"(stopId = %d)", stopId];
    [fetchRequest setPredicate:predicate];
    
    NSError* error;
    NSArray *objects = [objectContext executeFetchRequest:fetchRequest error:&error];
    if (objects == nil) {
        NSLog(@"%@", @"StopDAO#getStop is nil");        
    } else {
        for (NSManagedObject* object in objects) {
            if ([(NSNumber*)[object valueForKey:@"stopId"] intValue] == stopId) {
                return object;
            }                        
        }
        NSLog(@"%@", @"StopDAO#getStop returned empty data");  
    }
    return nil;
}

- (NSManagedObject*) getStopAtIndex:(NSInteger)index {
    [NSException raise:@"getStopAtIndex not implemented" format:@"Please implement StopDAO.m"];
    return nil;
}

- (NSArray*) getAllStops {
    NSFetchRequest* fetchRequest = [[NSFetchRequest alloc] init];
    BIDAppDelegate *appDelegate = (BIDAppDelegate*)[[UIApplication sharedApplication] delegate];
    NSManagedObjectContext *objectContext = [appDelegate managedObjectContext];
    NSEntityDescription* entityDescription = [NSEntityDescription entityForName:@"Stop" inManagedObjectContext:objectContext];
    [fetchRequest setEntity:entityDescription];
    
    NSError* error;
    NSArray *objects = [objectContext executeFetchRequest:fetchRequest error:&error];
    if (error != nil) {
        NSLog(@"%@", @"StopDAO error in getAllStops");
    }
    return objects;
}

- (void) deleteAllStops {
    BIDAppDelegate *appDelegate = (BIDAppDelegate*)[[UIApplication sharedApplication] delegate];
    NSManagedObjectContext *objectContext = [appDelegate managedObjectContext];
    NSArray* managedObjectStops = [self getAllStops];
    for (NSManagedObject* stop in managedObjectStops) {
        [objectContext deleteObject:stop];
    }
}

- (NSString*) newString:(NSInteger)num {
    return [NSString stringWithFormat:@"%d", num];
}


#pragma StopServiceDataDelegate protocol methods

- (void) handleArrayData:(NSArray*)objsArray {
    NSArray* stopsArray = (NSArray*)objsArray;
    
    BIDAppDelegate *appDelegate = (BIDAppDelegate*)[[UIApplication sharedApplication] delegate];
    NSManagedObjectContext *objectContext = [appDelegate managedObjectContext];
    for (NSDictionary* stopJson in stopsArray) {
        NSManagedObject *newManagedObject = [NSEntityDescription insertNewObjectForEntityForName:@"Stop" inManagedObjectContext:objectContext];
        [newManagedObject setValuesForKeysWithDictionary:stopJson];
    }
    NSError *error = nil;
    if (![objectContext save:&error]) {
        /*
         Replace this implementation with code to handle the error appropriately.
         
         abort() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development. 
         */
        NSLog(@"Unresolved error %@, %@", error, [error userInfo]);
        abort();
    }
}


- (void) handleData:(NSDictionary*)obj {
    
}



@end

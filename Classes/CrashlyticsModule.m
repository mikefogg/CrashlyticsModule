/**
 * Your Copyright Here
 *
 * Appcelerator Titanium is Copyright (c) 2009-2010 by Appcelerator, Inc.
 * and licensed under the Apache Public License (version 2)
 */
#import "CrashlyticsModule.h"
#import "TiBase.h"
#import "TiHost.h"
#import "TiUtils.h"
 #import "Crashlytics.h"

@implementation CrashlyticsModule

#pragma mark Internal

// this is generated for your module, please do not change it
-(id)moduleGUID
{
	return @"dba04d09-0cfe-4af8-a0bc-da6e0ff52873";
}

// this is generated for your module, please do not change it
-(NSString*)moduleId
{
	return @"crashlytics";
}

#pragma mark Lifecycle

-(void)startup
{
	// this method is called when the module is first loaded
	// you *must* call the superclass
	[super startup];
	NSLog(@"[INFO] [CrashlyticsModule]:: %@ loaded",self);
}

-(void)shutdown:(id)sender
{
	// this method is called when the module is being unloaded
	// typically this is during shutdown. make sure you don't do too
	// much processing here or the app will be quit forceably

	// you *must* call the superclass
	[super shutdown:sender];
}

#pragma mark Cleanup

-(void)dealloc
{
	// release any resources that have been retained by the module
	[super dealloc];
}

#pragma mark Internal Memory Management

-(void)didReceiveMemoryWarning:(NSNotification*)notification
{
	// optionally release any resources that can be dynamically
	// reloaded once memory is available - such as caches
	[super didReceiveMemoryWarning:notification];
}

#pragma mark Listener Notifications

-(void)_listenerAdded:(NSString *)type count:(int)count
{
	if (count == 1 && [type isEqualToString:@"my_event"])
	{
		// the first (of potentially many) listener is being added
		// for event named 'my_event'
	}
}

-(void)_listenerRemoved:(NSString *)type count:(int)count
{
	if (count == 0 && [type isEqualToString:@"my_event"])
	{
		// the last listener called for event named 'my_event' has
		// been removed, we can optionally clean up any resources
		// since no body is listening at this point for that event
	}
}

#pragma Public APIs

-(void)CLSLog: (NSString *)message
{
	CLSLog(@"%@",message);
}

-(void)startWithAPIKey: (NSArray *)key
{
	int size = [key count];
	if (size > 0){
		NSString *keyAPI =  [NSString stringWithFormat:@"%@",[key objectAtIndex:0]];
		[Crashlytics startWithAPIKey: keyAPI];
		NSLog(@"[CrashlyticsModule] startWithAPIKey:: Crashlytics starts tracing with key %@", keyAPI);
	}
	else {
		NSLog(@"[CrashlyticsModule] startWithAPIKey:: Wrong string format");
	}
}

-(void)setUserName: (NSString *)name
{
	[Crashlytics setUserName:name];
}

-(void)setUserIdentifier: (NSString *)identifier
{
	[Crashlytics setUserIdentifier:identifier];
}

-(void)setUserEmail: (NSString *)email
{
	[Crashlytics setUserEmail:email];
}

-(void)setObjectValue: (NSArray *)args
{
    int size = [args count];
    if (size > 1){
        [Crashlytics setObjectValue:(id)[args objectAtIndex:0]
                    forKey:(NSString *) [args objectAtIndex:1]];
    }
    else{
        NSLog(@"[CrashlyticsModule] setObjectValue:: Wrong paramters");
    }
}

-(void)setIntValue: (NSArray *)args
{
    int size = [args count];
    if (size > 1){
        [Crashlytics setIntValue:(int)[args objectAtIndex:0]
                    forKey:(NSString *) [args objectAtIndex:1]];
    }
    else{
        NSLog(@"[CrashlyticsModule] setIntValue:: Wrong paramters");
    }
}

-(void)setBoolValue: (NSArray *)args
{
    int size = [args count];
    if (size > 1){
        [Crashlytics setBoolValue:(BOOL)[args objectAtIndex:0]
                    forKey:(NSString *) [args objectAtIndex:1]];
    }
    else{
        NSLog(@"[CrashlyticsModule] setBoolValue:: Wrong paramters");
    }
}

-(void)setFloatValue: (NSArray *)args
{
    int size = [args count];
    if (size > 1){
        [Crashlytics setFloatValue: *(float*)[args objectAtIndex:0]
                    forKey:(NSString *) [args objectAtIndex:1]];
    }
    else{
        NSLog(@"[CrashlyticsModule] setBoolValue:: Wrong paramters");
    }
}
-(void)setDebugMode: (id)debug
{
	NSString *debugMode =  [NSString stringWithFormat:@"%@",debug];
	NSLog(@"[CrashlyticsModule] setDebugMode:: %@", [debugMode isEqualToString:@"1"]  ? @"debugMode is ON" : @"debugMode is OFF");
	if([debugMode isEqualToString:@"1"] ) {
		[[Crashlytics sharedInstance] setDebugMode:YES];
	}
	else {
		[[Crashlytics sharedInstance] setDebugMode:NO];
	}
}
-(void)crash
{
	[[Crashlytics sharedInstance] crash];
}


@end

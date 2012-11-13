//
//  CCAppDelegate.h
//  SendSafariTweet
//
//  Created by Les Stroud on 11/9/12.
//  Copyright (c) 2012 Crafted Code. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@interface CCAppDelegate : NSObject <NSApplicationDelegate, NSSharingServiceDelegate>{
   NSURL *currentUrl;
   NSString *currentTitle;
   NSWindow *safariWindow;
}

@property (assign) IBOutlet NSWindow *window;

@end

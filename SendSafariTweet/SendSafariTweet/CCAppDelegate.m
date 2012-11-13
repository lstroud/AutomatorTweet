//
//  CCAppDelegate.m
//  SendSafariTweet
//
//  Created by Les Stroud on 11/9/12.
//  Copyright (c) 2012 Crafted Code. All rights reserved.
//

#import "CCAppDelegate.h"
#import <AppKit/AppKit.h>
#import <ScriptingBridge/ScriptingBridge.h>
#import "Safari.h"

@implementation CCAppDelegate

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification
{
   
   SafariApplication *safariApp = [SBApplication applicationWithBundleIdentifier:@"com.apple.Safari"];
   
   if([[safariApp documents] count] > 0){
      SafariDocument *frontDocument = [safariApp documents][0];
      safariWindow = [safariApp windows][0];
      currentUrl = [NSURL URLWithString:frontDocument.URL];
      currentTitle = frontDocument.name;
      
      /*      NSImage *image = [[NSImage alloc] initWithContentsOfURL:[NSURL URLWithString:@"http://a5.mzstatic.com/us/r1000/076/Purple/v4/23/c0/d8/23c0d813-3aa2-5ad2-b6f8-daec9127aee4/mza_8073056210405637596.175x175-75.jpg"]];
      NSBitmapImageRep *bitmapData = [[NSBitmapImageRep alloc] initWithFocusedViewRect:[[safariApp windows][0] bounds]];
      
      [[safariApp windows][0] unlockFocus];
      [NSImage alloc] init
      [[bitmapData representationUsingType:NSPNGFileType properties:nil]
       writeToFile:path atomically:YES];
      */
      
      NSArray *shareItems = [NSArray arrayWithObjects:currentTitle, currentUrl, nil];
      NSSharingService *service = [NSSharingService sharingServiceNamed:NSSharingServiceNamePostOnTwitter];
      
      [service performWithItems:shareItems];
   }

   
}

- (NSWindow *)sharingService:(NSSharingService *)sharingService
   sourceWindowForShareItems:(NSArray *)items
         sharingContentScope:(NSSharingContentScope *)sharingContentScope
{
   *sharingContentScope = NSSharingContentScopeItem;
   return safariWindow;
}

- (void)sharingService:(NSSharingService *)sharingService didShareItems:(NSArray *)items{
   [NSApp terminate:nil];
}

- (void)sharingService:(NSSharingService *)sharingService didFailToShareItems:(NSArray *)items error:(NSError *)error{
   NSLog(@"Error: %@", error.localizedDescription);
   [NSApp terminate:nil];
}

@end

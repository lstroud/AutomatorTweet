//
//  TweetAction.m
//  TweetAction
//
//  Created by Les Stroud on 11/7/12.
//  Copyright (c) 2012 Crafted Code. All rights reserved.
//

#import "TweetAction.h"

@implementation TweetAction

- (id)runWithInput:(id)input fromAction:(AMAction *)anAction error:(NSDictionary **)errorInfo
{
   NSMutableArray *shareItems = [NSMutableArray arrayWithCapacity:[input numberOfItems]];
   NSSharingService *service = [NSSharingService sharingServiceNamed:NSSharingServiceNamePostOnTwitter];

   NSString* inputParameter;
   
   for(int i = 1; i <= [input numberOfItems]; i++){
      inputParameter = [[input descriptorAtIndex:i] stringValue];
      NSDataDetector *detect = [[NSDataDetector alloc] initWithTypes:NSTextCheckingTypeLink error:nil];
      
      NSTextCheckingResult* firstMatch = [detect firstMatchInString:inputParameter options:0 range:NSMakeRange(0, [inputParameter length])];
      if(firstMatch && [inputParameter hasPrefix:@"http"]){
         [shareItems addObject:(NSURL *)firstMatch.URL];
      } else {
         //let's check for this | convention in titles and only use the first segment
         [shareItems addObject:[inputParameter componentsSeparatedByString:@"|"][0]];
      }
      
   }
   [service performWithItems:shareItems];
	return input;
}

@end

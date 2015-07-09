//
//  FISGithubAPIClient.h
//  github-repo-list
//
//  Created by Tom OMalley on 7/6/15.
//  Copyright (c) 2015 Zachary Drossman. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface FISGithubAPIClient : NSObject

// Client ID : f3953a96bb10a5177904
// Client Secret : ac64f3a35f8ecf7a00b141e8eaa1012d865fb09b

+ (void)getAllRepoWithCompletionHandler:(void (^)(NSArray * repositories))completionBlock;

@end

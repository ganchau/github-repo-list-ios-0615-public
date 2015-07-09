//
//  FISGithubAPIClient.m
//  github-repo-list
//
//  Created by Tom OMalley on 7/6/15.
//  Copyright (c) 2015 Zachary Drossman. All rights reserved.
//

#import "FISGithubAPIClient.h"

@implementation FISGithubAPIClient

//// https://api.github.com/repositories?client_id=f3953a96bb10a5177904&client_secret=ac64f3a35f8ecf7a00b141e8eaa1012d865fb09b

+ (void)getAllRepoWithCompletionHandler:(void (^)(NSArray *))completionBlock
{
    NSURLSession *urlSession = [NSURLSession sharedSession];
    NSURL *url =  [NSURL URLWithString:@"https://api.github.com/repositories?client_id=f3953a96bb10a5177904&client_secret=ac64f3a35f8ecf7a00b141e8eaa1012d865fb09b"];
    
    NSLog(@"before the dataTaskWithURL call");
    NSURLSessionDataTask *task = [urlSession dataTaskWithURL:url
                                           completionHandler:^(NSData *data, NSURLResponse *response, NSError *error)
    {
        // check for an error
        // deserialize the data to an array
        // turn the dictionaries in the array into models
        // call back the block with the array of models
    
        NSArray *repositories = [NSJSONSerialization JSONObjectWithData:data
                                                                options:0
                                                                  error:nil];
        NSLog(@"in the method's completion block. Response: %@", repositories);
        
        completionBlock(repositories);
    }];
    NSLog(@"after the dataTaskWithURL call");
    
    [task resume];
}

@end

//
//  FISGithubRepository.m
//  ReviewSession 3-16-14
//
//  Created by Joe Burgess on 3/16/14.
//  Copyright (c) 2014 Joe Burgess. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FISGithubRepository.h"

@implementation FISGithubRepository

- (instancetype)initWithDictionary:(NSDictionary *)dictionary
{
    self = [super init];
    
    if (self) {
        _fullName = dictionary[@"full_name"];
        _repositoryID = [dictionary[@"id"] stringValue];;
        _htmlURL = [NSURL URLWithString:dictionary[@"html_url"]];
    }
    
    return self;
}

- (BOOL)isEqual:(id)object
{
    if ([object isKindOfClass:[FISGithubRepository class]]) {
        FISGithubRepository *otherRepo = object;
        return [self.repositoryID isEqualToString:otherRepo.repositoryID];
    }
    return NO;
}

//+ (FISGithubRepository *)parseDictionary:(NSDictionary *)repo
//{
//    FISGithubRepository *repoDictionary = [[FISGithubRepository alloc] initWithDictionary:repo];
//    
//    return repoDictionary;
//}

@end

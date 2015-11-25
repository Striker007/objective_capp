//
//  main.m
//  objective_capp
//
//  Created by Vitalii (Striker007) on 11/24/15.
//  Copyright © 2015 monsters. All rights reserved.
//

#import <Foundation/Foundation.h>
#include <errno.h>
#include <sys/sysctl.h>


@interface Sysctl: NSObject

-(void) print;
-(void) getParameter: (char*) sp setOut:(NSString*) so;

@end


@implementation Sysctl
{
    char parameter[256];
    NSString* printline;
}
-(void) print
{
    NSLog (printline, parameter);
}
-(void) getParameter: (char*) sp setOut:(NSString*) so
{
    printline = so;
    size_t size = sizeof(parameter);
    sysctlbyname(sp, parameter, &size, NULL, 0);
    if (!strcmp(parameter, "")) {
        strcpy(parameter, "unknown");
    }
}
@end


int main (int argc, char * argv[])
{
    @autoreleasepool {
        
        Sysctl *mySysctl = [[Sysctl alloc] init];
        [mySysctl getParameter:"kern.osrelease" setOut:@"\n OS ver. %s \n"];
        [mySysctl print];

    }
    
    return 0;
}
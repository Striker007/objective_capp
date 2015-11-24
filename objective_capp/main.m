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


int main(int argc, const char * argv[]) {
    
    @autoreleasepool {
        
        char str[256];
        size_t size = sizeof(str);
        
        sysctlbyname("kern.osrelease", str, &size, NULL, 0);
        
        if (!strcmp(str, "")) {
            strcpy(str, "unknown");
        }
        
        NSLog(@"\n OS ver. %s \n", str);

    }
    return 0;
}

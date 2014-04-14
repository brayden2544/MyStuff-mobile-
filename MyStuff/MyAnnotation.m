//
//  MyAnnotation.m
//  MyStuff
//
//  Created by Brayden Adams on 4/10/14.
//  Copyright (c) 2014 Brayden Adams. All rights reserved.
//

#import "MyAnnotation.h"

@implementation MyAnnotation

- (instancetype) initWithCoordinates:(CLLocationCoordinate2D)paramCoordinates title:(NSString *)paramTitle subTitle:(NSString *)paramSubTitle{
    
    self = [super init];
    
    if (self !=nil){
        _coordinate = paramCoordinates;
        _title = paramTitle;
        _subtitle = paramSubTitle;
    }
    
    return self;
}


@end

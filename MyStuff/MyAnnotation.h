//
//  MyAnnotation.h
//  MyStuff
//
//  Created by Brayden Adams on 4/10/14.
//  Copyright (c) 2014 Brayden Adams. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <MapKit/MapKit.h>

@interface MyAnnotation : NSObject <MKAnnotation>

@property (nonatomic, readonly) CLLocationCoordinate2D coordinate;
@property (nonatomic, copy, readonly) NSString *title;
@property (nonatomic, copy, readonly) NSString *subtitle;

- (instancetype) initWithCoordinates: (CLLocationCoordinate2D)paramCoordinates
                               title:(NSString *)paramTitle
                            subTitle:(NSString *)paramSubTitle;
@end

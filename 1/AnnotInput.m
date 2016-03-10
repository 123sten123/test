//
//  AnnotInput.m
//  1
//
//  Created by стен on 10.03.16.
//  Copyright (c) 2016 стен. All rights reserved.
//

#import "AnnotInput.h"

@implementation AnnotInput
-(instancetype)initWithCoordinates:(CLLocationCoordinate2D)parCoordinates // title:(NSString *)paramTitel SubTitel:(NSString *)paramSubTitel
{
    self = [super init];
    if(self!=nil)
    {
        _coordinate = parCoordinates;
        //  _titel = paramTitel;
        //  _subTitel = paramSubTitel;
    }
    return (self);
}

@end

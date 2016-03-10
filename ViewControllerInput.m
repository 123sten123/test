//
//  ViewControllerInput.m
//  1
//
//  Created by стен on 09.03.16.
//  Copyright (c) 2016 стен. All rights reserved.
//

#import "ViewControllerInput.h"
#import "Map.h"
#import "AnnotInput.h"

@interface ViewControllerInput ()
{
    NSArray *name;
    NSArray *Lat;
    NSArray *Lng;
    MKCoordinateRegion region ;
    
}
@end

@implementation ViewControllerInput
@synthesize LatStr;
@synthesize LngStr;
@synthesize mapView;




- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    name =@[@"Izh", @"Mos", @"Perm", @"Sbp"];
    Lat = @[@"56.84976", @"55.75222", @"58.01741", @"59.89444"];
    Lng = @[@"53.20448", @"37.61556", @"56.28552", @"30.26417"];
    // region = {{0.0,0.0},{0.0,0.0}};
    //MKCoordinateRegion region = {{0.0,0.0},{0.0,0.0}};
    region.center.latitude = 56.84976;
    region.center.longitude = 53.20448;
    region.span.latitudeDelta= 0.01f;
    region.span.longitudeDelta= 0.01f;
    [mapView setRegion:region animated:YES];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


-(NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return name.count;
}

-(UITableViewCell *) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *const CellID = @"cell";
    UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:CellID];
    cell.textLabel.text = [name objectAtIndex:indexPath.row];
    
    return cell;
}



- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
   
    region.center.latitude = [[Lat objectAtIndex:indexPath.row] doubleValue];
    region.center.longitude = [[Lng objectAtIndex:indexPath.row] doubleValue];
    [mapView setRegion:region animated:YES];
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    [self.delegate nameViewDelegate:@"123":[Lng objectAtIndex:indexPath.row]];
    CLLocationCoordinate2D location =CLLocationCoordinate2DMake([[Lat objectAtIndex:indexPath.row] doubleValue], [[Lng objectAtIndex:indexPath.row] doubleValue]);
  
    AnnotInput *locAn = [[AnnotInput alloc] initWithCoordinates:location];
    [self.mapView addAnnotation:locAn];

    //self.delegate =self;
    
    
}


@end

//
//  ViewController.m
//  1
//
//  Created by стен on 27.02.16.
//  Copyright (c) 2016 стен. All rights reserved.
//

#import "ViewController.h"
#import "Annotation.h"
#import "Map.h"

@interface ViewController ()
{
    NSArray *name;
    NSArray *Lat;
    NSArray *Lng;
    MKCoordinateRegion region ;
    
}
@end

@implementation ViewController
@synthesize mapView;

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Do any additional setup after loading the view, typically from a nib.
    name =@[@"Izh", @"Mos", @"Perm", @"Sbp"];
    Lat = @[@"56.84976", @"55.75222", @"58.01741", @"59.89444"];
    Lng = @[@"53.20448", @"37.61556", @"56.28552", @"30.26417"];
    region.center.latitude = 56.8486065;
    region.center.longitude = 53.1882357;
    region.span.latitudeDelta= 0.01f;
    region.span.longitudeDelta= 0.01f;
    [mapView setRegion:region animated:YES];
    
    // Do any additional setup after loading the view, typically from a nib.
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
    CLLocationCoordinate2D location =CLLocationCoordinate2DMake([[Lat objectAtIndex:indexPath.row] doubleValue], [[Lng objectAtIndex:indexPath.row] doubleValue]);
    Annotation *locAnno = [[Annotation alloc] initWithCoordinates:location];
    [self.mapView addAnnotation:locAnno];
    //self.delegate =self;
    
    
}



- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    
    if([segue.identifier isEqualToString:@"segu"])
    {
        Map  *per1 =segue.destinationViewController;
        NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
        per1.Latoutput = [Lat objectAtIndex:indexPath.row];
        per1.Lngoutput = [Lng objectAtIndex:indexPath.row];
    }
    
}


@end

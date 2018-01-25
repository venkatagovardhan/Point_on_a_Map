//
//  ViewController.m
//  PointonMap
//
//  Created by venkatagovardhan on 1/23/18.
//  Copyright © 2018 venkatagovardhan. All rights reserved.
//

#import "ViewController.h"
#import "SWRevealViewController.h"


@interface ViewController ()
{
    int position;
    NSMutableArray *longarray;
    NSMutableArray *latarray;
    NSString *newlat;
    NSString *newlong;
}
@property (weak, nonatomic) IBOutlet UIButton *Menubutton;
@property (weak, nonatomic) IBOutlet UIButton *Addbutton;
@property (weak, nonatomic) IBOutlet MKMapView *MainMap;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    _Addbutton.hidden=true;
    longarray=[[NSMutableArray alloc] initWithObjects:@"49.894107",@"49.896566", @"49.892585",@"49.894904",@"49.894997",@"49.894693", nil];
   
    latarray=[[NSMutableArray alloc] initWithObjects:@"-97.138545",@"-97.143610",@" -97.141936",@"-97.142364",@"-97.145255",@"-97.146689", nil];

    NSMutableArray *title=[[NSMutableArray alloc] initWithObjects:@"Winningpeg Square",@"Landmark Cinemas",@"Trinity Church",@"Hotel",@"Liquormart",@"Mass Convience Store", nil];
    NSLog(@"%lu",(unsigned long)longarray.count);
    //set pin
    for (int i=0; i<longarray.count; i++) {
      MKPointAnnotation *annotation =[[MKPointAnnotation alloc]init];
        NSString *latco= [NSString stringWithFormat:@"%@", [latarray objectAtIndex:i] ];
        NSString *longco= [NSString stringWithFormat:@"%@", [longarray objectAtIndex:i] ];
        double latpoint= [latco doubleValue];
        double longpoint= [longco doubleValue];
        CLLocationCoordinate2D coordforpin={ longpoint, latpoint};
        [annotation setCoordinate:coordforpin];
        [annotation setTitle:[title objectAtIndex:i]];
        
         [_MainMap addAnnotation:annotation];
        position=i+1;
        MKCoordinateSpan span={0.015f,  0.010f};
        MKCoordinateRegion region = {coordforpin,span};
        [_MainMap setRegion:region];
    }
  
    //get location information of the dropped pin
  

    UILongPressGestureRecognizer *recognizer = [[UILongPressGestureRecognizer alloc]initWithTarget:self action:@selector(addPin:)];
    recognizer.minimumPressDuration = 0.5;
    
    [self.MainMap addGestureRecognizer:recognizer];

    
    
    
    //Side view controller
    SWRevealViewController *revealViewController = self.revealViewController;
    
    if ( revealViewController )
        
    {
        
        [_Menubutton  addTarget:self.revealViewController  action:@selector(revealToggle:) forControlEvents:UIControlEventTouchDown];
    
        [self.view addGestureRecognizer:self.revealViewController.panGestureRecognizer];
        
    }
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

//Adding pin to the user selected Location
- (void)addPin:(UIGestureRecognizer *)gestureRecognizer
{
    if (gestureRecognizer.state != UIGestureRecognizerStateBegan)
        return;
    _Addbutton.hidden=false;
    CGPoint touchPoint = [gestureRecognizer locationInView:self.MainMap];
    CLLocationCoordinate2D location =
    [self.MainMap convertPoint:touchPoint toCoordinateFromView:self.MainMap];
    
     MKPointAnnotation *annotation1 =[[MKPointAnnotation alloc]init];
    CLLocationCoordinate2D coordforpin1={ location.latitude,location.longitude};
    [annotation1 setCoordinate:coordforpin1];
    [annotation1 setTitle:@"Pin is Here"];
    [_MainMap addAnnotation:annotation1];
    
    NSLog(@"Location found from Map: %f %f",location.latitude,location.longitude);
    newlat= [NSString stringWithFormat:@"%f", location.latitude];
    
    newlong= [NSString stringWithFormat:@"%f", location.longitude];
    
}
// Adding the user selected location to the data
- (IBAction)Addplace:(id)sender {
    [latarray addObject:newlat];
    [longarray addObject:newlong];
    _Addbutton.hidden=true;
}


@end

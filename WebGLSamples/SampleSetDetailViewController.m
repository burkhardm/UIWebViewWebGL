//
//  MasterViewSampleSetControllerViewController.m
//  WebGLShowcases
//
//  Created by Martin Burkhard on 09.03.12.
//  Copyright (c) 2012 Martin Burkhard. All rights reserved.
//

#import "SampleSetDetailViewController.h"
#import "NSString+MD5.h"

@implementation SampleSetDetailViewController

@synthesize detailViewController, popoverController, detailItem;
@synthesize m_sampleSet, documentsDirectory;

#pragma mark - Managing the detail item

- (void)setDetailItem:(id)newDetailItem
{
    if (detailItem != newDetailItem) {
        detailItem = newDetailItem;
        
        // Update the view.
        [self configureView];
    }
    
    if (popoverController != nil) {
        [popoverController dismissPopoverAnimated:YES];
    }        
}

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];

    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
 
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    
    self.detailViewController = (RenderViewController *)[[self.splitViewController.viewControllers lastObject] topViewController];
    
    [self configureView];
    
    // get document directories
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);  
    
    // get document directory
    documentsDirectory = [paths objectAtIndex:0]; //create NSString object, that holds our exact 

}

- (void)configureView
{
    // Update the user interface for the detail item.
    
    if (self.detailItem) {
        m_sampleSet = self.detailItem;
    }
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
	return YES;
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    return [[m_sampleSet showcases] count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell"];
    Showcase *sample = [[m_sampleSet showcases] objectAtIndex:indexPath.row];
    
    cell.textLabel.text = [sample name];
    cell.detailTextLabel.text = [sample author];
    if(sample.imageUrl) {
        
        // Creates image cache location with MD5 hashed names
        NSString *fullPath = [documentsDirectory stringByAppendingPathComponent:[NSString stringWithFormat:@"%@.jpg", sample.imageUrl.absoluteString.MD5]]; //add our image to the path

        // Load image from url or from cache
        if (![[NSFileManager defaultManager] fileExistsAtPath:fullPath])
        {
            // Async download of image
            dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_HIGH,  0ul);
            dispatch_async(queue, ^{
                NSData *imageData =[NSData dataWithContentsOfURL:sample.imageUrl];
                [imageData writeToFile:fullPath atomically:YES];
                dispatch_sync(dispatch_get_main_queue(), ^{
                    cell.imageView.image=[UIImage imageWithContentsOfFile:fullPath];
                    [cell setNeedsLayout];
                });
            });
            cell.imageView.image=[UIImage imageNamed:@"placeholder"];   // creates a placeholder image
        }
        else
        {
            cell.imageView.image=[UIImage imageWithContentsOfFile:fullPath];
        }
    }
        
    return cell;
}


// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return NO;
}


#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPad) {
        Showcase *sample = [[m_sampleSet showcases] objectAtIndex:indexPath.row];
        self.detailViewController.detailItem = sample;
    }
}

@end

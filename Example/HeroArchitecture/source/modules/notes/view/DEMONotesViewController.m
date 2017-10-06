//
//  DEMONotesViewController.m
//  fluidArchitecture
//
//  Created by Moritz Ellerbrock on 13/01/17.
//  Copyright © 2017 fluidmobile GmbH. All rights reserved.
//

#import "DEMONotesViewController.h"
#import "DEMONotesView.h"
#import "DEMONotesViewTableViewCell.h"
#import "DEMONotePonso.h"

@interface DEMONotesViewController () <DEMONotesViewDelegate, UITableViewDataSource, UITableViewDelegate>
@property (nonatomic, strong) DEMONotesView* viewNotes;
@property (nonatomic, strong) NSArray* notes;
@end

@implementation DEMONotesViewController
- (instancetype)init{
	self = [super init];
	if (!self) {
		return nil;
	}
	self.title = @"Notes";
	self.tabBarItem.image = [UIImage imageNamed:@"notes"];
	return self;
}

-(void)loadView{
    self.viewNotes = [DEMONotesView new];
    self.view = self.viewNotes;
}

- (void)viewDidLoad {
    [super viewDidLoad];
	UIBarButtonItem* bbi = [[UIBarButtonItem alloc] initWithTitle:@"+" style:UIBarButtonItemStylePlain target:self action:@selector(actionCreateNote:)];
	self.navigationItem.rightBarButtonItem = bbi;
    self.viewNotes.delegate = self;
	self.viewNotes.tableView.delegate = self;
	self.viewNotes.tableView.dataSource = self;
	[self.viewNotes.tableView  registerClass:[DEMONotesViewTableViewCell class] forCellReuseIdentifier:CELL_NOTE];
}

- (void)viewWillAppear:(BOOL)animated{
	[super viewWillAppear:animated];
	[self requestContentUpdate];
}


-(void)updateWithNotes:(NSArray <DEMONotePonso*>*)notes{
	self.notes = notes;
	[self.viewNotes.tableView reloadData];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
	return [self.notes count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
	DEMONotesViewTableViewCell* cell = [tableView dequeueReusableCellWithIdentifier:CELL_NOTE];
	DEMONotePonso* note = [self noteForIndexPath:indexPath];
	[cell updateText:note.title];
	return cell;
}

-(DEMONotePonso*)noteForIndexPath:(NSIndexPath*)indexPath{
	return self.notes[indexPath.row];
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
	[tableView deselectRowAtIndexPath:indexPath animated:YES];
}

-(void)actionCreateNote:(id)sender{

	[self showAlert];
}

-(void)showAlert{
	UIAlertController *alerController = [UIAlertController alertControllerWithTitle:@"New Note" message:@"tolle message" preferredStyle:UIAlertControllerStyleAlert];
	[alerController addTextFieldWithConfigurationHandler:^(UITextField * _Nonnull textField) {
		textField.placeholder = @"Note Title";
		
	}];
	[alerController addTextFieldWithConfigurationHandler:^(UITextField * _Nonnull textField) {
		textField.placeholder = @"Note Text";
		
	}];
	UIAlertAction *confirmAction = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
		NSString* title = [[alerController textFields][0] text];
		NSString* text = [[alerController textFields][0] text];
		
		[(id <DEMONotesViewOutput>)self.coordinator createNewNoteWithTitle:title text:text];
	}];
	[alerController addAction:confirmAction];
	UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:@"Cancel" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
		
	}];
	[alerController addAction:cancelAction];
	[self presentViewController:alerController animated:YES completion:nil];
	
}
@end

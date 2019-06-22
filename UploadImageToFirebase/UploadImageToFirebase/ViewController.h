//
//  ViewController.h
//  UploadImageToFirebase
//
//  Created by Rahul Chopra on 29/08/17.
//  Copyright © 2017 Bar Uncle. All rights reserved.
//

#import <UIKit/UIKit.h>
@import Firebase;
@import FirebaseStorage;
@import FirebaseAuth;


@interface ViewController : UIViewController<UIImagePickerControllerDelegate>

@property (weak, nonatomic) IBOutlet UIImageView *imgUser;
- (IBAction)btnSave:(id)sender;
@property (weak, nonatomic) IBOutlet UITextField *txtName;
@property (weak, nonatomic) IBOutlet UITextField *txtEmail;
@property (weak, nonatomic) IBOutlet UITextField *txtPassword;

@property (weak, nonatomic) FIRDatabaseReference *dbRef;

@property (strong, nonatomic) FIRStorage *storage;
@property (strong, nonatomic) FIRStorageReference *storageRef;



@end


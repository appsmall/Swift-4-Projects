//
//  ViewController.m
//  UploadImageToFirebase
//
//  Created by Rahul Chopra on 29/08/17.
//  Copyright © 2017 Bar Uncle. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    
    self.dbRef = [[FIRDatabase database]reference];
    
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(userImage)];
    [_imgUser addGestureRecognizer:tap];
    [_imgUser setUserInteractionEnabled:YES];
    
}


- (IBAction)btnSave:(id)sender
{
    
    NSString *email = _txtEmail.text;
    NSString *password = _txtPassword.text;
    
    if (email = _txtEmail.text, password = _txtPassword.text)
    {
        [[FIRAuth auth] createUserWithEmail:email password:password completion:^(FIRUser * _Nullable user, NSError * _Nullable error) {
            if (error)
            {
                NSLog(@"Error while Signing up details: %@", error.localizedDescription);
                return;
            }
            else
            {
                _storage = [FIRStorage storage];
                _storageRef = [[[[_storage referenceForURL:@"gs://uploadimagefirebase-df5d5.appspot.com"] child:@"Profile Photos"]child:@"Custom Users"]child:user.uid];
                FIRStorageMetadata *metaData = [[FIRStorageMetadata alloc] init];
                metaData.contentType = @"image/jpeg";
                
                [_storageRef putData:UIImagePNGRepresentation(_imgUser.image) metadata:metaData completion:^(FIRStorageMetadata * _Nullable metadata, NSError * _Nullable error) {
                    if (error == nil)
                    {
                        
                        // NSURL *profileImgURL;
                        //  profileImgURL = [[metaData downloadURL] absoluteString];
                        //  _dbRef = [[FIRDatabase database]reference];
                     //   [[_dbRef child:@"UserPhotos"]child: user.uid];
                        
                        NSString *uid = user.uid;
                        NSString *name = _txtName.text;
                        
                        NSDictionary *values = @{@"UID": uid,@"Name": name,@"Email": email, @"Password": password};
                        [[[[self.dbRef child:@"Users"] child:@"Custom Users"]child: uid] setValue: values];
                        
                        NSLog(@"User account Saved Successfully");
                        
                        
                        NSLog(@"upload successfully");
                    }
                    else
                    {
                        NSLog(@"%@",error.localizedDescription);
                    }
                }]; 
            }
        }];

    
    
    
    
    
}

}




-(void)userImage
{
    UIImagePickerController *imgPicker = [[UIImagePickerController alloc]init];
    imgPicker.delegate = self;
    imgPicker.allowsEditing = YES;
    imgPicker.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
    [self presentViewController:imgPicker animated:YES completion:nil];
}

-(void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary<NSString *,id> *)info
{
    UIImage *selectedImageFromPicker;
    UIImage *editedImage;
    UIImage *originalImage;
    UIImage *selectedImage;
    
    if ((editedImage = info[UIImagePickerControllerEditedImage]))
    {
        selectedImageFromPicker = editedImage;
    }
    else if ((originalImage = info[UIImagePickerControllerOriginalImage]))
    {
        selectedImageFromPicker = originalImage;
    }
    
    if ((selectedImage = selectedImageFromPicker))
    {
        _imgUser.image = selectedImage;
    }

    
    [self dismissViewControllerAnimated:YES completion:nil];
}



-(void)imagePickerControllerDidCancel:(UIImagePickerController *)picker
{
    [self dismissViewControllerAnimated:YES completion:nil];
}

@end

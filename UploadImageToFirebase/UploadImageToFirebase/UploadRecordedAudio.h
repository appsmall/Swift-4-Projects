//
//  UploadRecordedAudio.h
//  UploadImageToFirebase
//
//  Created by Rahul Chopra on 03/09/17.
//  Copyright © 2017 Bar Uncle. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AVFoundation/AVFoundation.h>
@import FirebaseStorage;
@import FirebaseAuth;

@interface UploadRecordedAudio : UIViewController<AVAudioRecorderDelegate,AVAudioPlayerDelegate>
- (IBAction)btnRecord:(id)sender;
@property (weak, nonatomic) IBOutlet UIButton *record;
@property (weak, nonatomic) IBOutlet UIButton *stop;
- (IBAction)btnStop:(id)sender;

@property (weak, nonatomic) IBOutlet UIButton *play;
- (IBAction)btnPlay:(id)sender;

@property (strong, nonatomic) FIRStorage *storage;
@property (strong, nonatomic) FIRStorageReference *storageRef;

@end

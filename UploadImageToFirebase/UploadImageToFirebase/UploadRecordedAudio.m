//
//  UploadRecordedAudio.m
//  UploadImageToFirebase
//
//  Created by Rahul Chopra on 03/09/17.
//  Copyright © 2017 Bar Uncle. All rights reserved.
//

#import "UploadRecordedAudio.h"

@interface UploadRecordedAudio ()
{
    AVAudioRecorder *recorder;
    AVAudioPlayer *player;
    NSString *pathToSave;
}
@end

@implementation UploadRecordedAudio

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    
    
    
    
   /* NSArray *pathComponents = [NSArray arrayWithObjects:[NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES)lastObject], @"MyAudioMemo.m4a", nil];
    
    NSURL *outputFileURL = [NSURL fileURLWithPathComponents:pathComponents];
    //NSLog(@"HERE: %@",pathComponents);
    //Setup Audio Session
    AVAudioSession *session = [AVAudioSession sharedInstance];
    [session setCategory:AVAudioSessionCategoryPlayAndRecord error:nil];
    
    //Define the Recorder Settings...
    NSMutableDictionary *recordSetting = [[NSMutableDictionary alloc]init];
    [recordSetting setValue:[NSNumber numberWithInt:kAudioFormatMPEG4AAC] forKey:AVFormatIDKey];
    [recordSetting setValue:[NSNumber numberWithFloat:44100.0] forKey:AVSampleRateKey];
    [recordSetting setValue:[NSNumber numberWithInt:2] forKey:AVNumberOfChannelsKey];
    
    //Initiate and Prepare the Recorder
    recorder = [[AVAudioRecorder alloc]initWithURL:outputFileURL settings:recordSetting error:NULL];
    recorder.delegate = self;
    recorder.meteringEnabled = YES;
    [recorder prepareToRecord]; */
    
    
    
    
    
    
    /*//Audio Storage....
    _storage = [FIRStorage storage];
    _storageRef = [[_storage referenceForURL:@"gs://uploadimagefirebase-df5d5.appspot.com"] child:@"Audio"];
    FIRStorageMetadata *metaData = [[FIRStorageMetadata alloc] init];
    metaData.contentType = @"image/jpeg";
    
    [_storageRef putData: metadata:metaData completion:^(FIRStorageMetadata * _Nullable metadata, NSError * _Nullable error) {
        if (error == nil)
        {
            NSLog(@"upload successfully");
        }
    }]; */
    
}

- (IBAction)btnRecord:(id)sender
{
    NSError *error;
    
    // Recording settings
    NSMutableDictionary *settings = [NSMutableDictionary dictionary];
    
    [settings setValue: [NSNumber numberWithInt:kAudioFormatLinearPCM] forKey:AVFormatIDKey];
    [settings setValue: [NSNumber numberWithFloat:8000.0] forKey:AVSampleRateKey];
    [settings setValue: [NSNumber numberWithInt: 1] forKey:AVNumberOfChannelsKey];
    [settings setValue: [NSNumber numberWithInt:16] forKey:AVLinearPCMBitDepthKey];
    [settings setValue: [NSNumber numberWithBool:NO] forKey:AVLinearPCMIsBigEndianKey];
    [settings setValue: [NSNumber numberWithBool:NO] forKey:AVLinearPCMIsFloatKey];
    [settings setValue:  [NSNumber numberWithInt: AVAudioQualityMax] forKey:AVEncoderAudioQualityKey];
    
    NSArray *searchPaths =NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentPath_ = [searchPaths objectAtIndex: 0];
    
    NSLog(@"%@",documentPath_);
    
    pathToSave = [documentPath_ stringByAppendingPathComponent:[self dateString]];
    
    // File URL
    NSURL *url = [NSURL fileURLWithPath:pathToSave];  //FILEPATH];
    
    
    //Save recording path to preferences
    NSUserDefaults *prefs = [NSUserDefaults standardUserDefaults];
    
    
    [prefs setURL:url forKey:@"Test1"];
    [prefs synchronize];
    
    
    // Create recorder
    recorder = [[AVAudioRecorder alloc] initWithURL:url settings:settings error:&error];
    
    [recorder prepareToRecord];
    
    [recorder record];
    NSLog(@"Recorded");

}
- (IBAction)btnPlay:(id)sender
{
    /*if (!recorder.recording){
        player = [[AVAudioPlayer alloc] initWithContentsOfURL:recorder.url error:nil];
        [player setDelegate:self];
        [player play];
    }*/
    
    FIRUser *user = [[FIRAuth auth]currentUser];
    
    //Load recording path from preferences
    NSUserDefaults *prefs = [NSUserDefaults standardUserDefaults];
    
    //NSURL *temporaryRecFile = [prefs URLForKey:@"Test1"];
    
    player = [[AVAudioPlayer alloc] initWithContentsOfURL:recorder.url error:nil];
    [player play];
    NSLog(@"Played");
    
    NSData *audioData = [[NSData alloc] initWithContentsOfFile:pathToSave];
    //NSLog(@"Audio Data : %@",audioData);
    
    _storage = [FIRStorage storage];
    _storageRef = [[[[_storage referenceForURL:@"gs://uploadimagefirebase-df5d5.appspot.com"] child:@"Audio"]child:@"Custom Users"]child:user.uid];
    FIRStorageMetadata *metaData = [[FIRStorageMetadata alloc] init];
    metaData.contentType = @"audio/mp3";
    
    
    FIRStorageUploadTask *uploadTask = [_storageRef putData:audioData metadata:metaData completion:^(FIRStorageMetadata *metadata, NSError *error) {
             if (error != nil)
             {
                 NSLog(@"Upload Task");
             } else {
                 NSLog(@"Not Uploaded");
             }
       }];
}

- (void) audioRecorderDidFinishRecording:(AVAudioRecorder *)avrecorder successfully:(BOOL)flag{
    
    [_stop setEnabled:NO];
    [_play setEnabled:YES];
    
}

- (void) audioPlayerDidFinishPlaying:(AVAudioPlayer *)player successfully:(BOOL)flag
{
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"Done" message:@"Finish playing the recording!" preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction *action = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:nil];
    [alert addAction:action];
    [self presentViewController:alert animated:YES completion:nil];
}


- (IBAction)btnStop:(id)sender
{
    [recorder stop];
    
    AVAudioSession *audioSession = [AVAudioSession sharedInstance];
    [audioSession setActive:NO error:nil];
    NSLog(@"Stop recording");
}

- (NSString *) dateString
{
    // return a formatted string for a file name
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    formatter.dateFormat = @"ddMMMYY_hhmmssa";
    return [[formatter stringFromDate:[NSDate date]] stringByAppendingString:@".aif"];
}

@end

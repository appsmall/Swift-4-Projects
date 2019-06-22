//
//  ViewController.swift
//  QRCodeScanner
//
//  Created by Rahul Chopra on 01/03/18.
//  Copyright © 2018 Clicks Bazaar. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController, AVCaptureMetadataOutputObjectsDelegate {
    
    var video = AVCaptureVideoPreviewLayer()
    
    @IBOutlet weak var imgSquare: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        //Creating session
        let session = AVCaptureSession()
        
        //Capture device
        let captureDevice = AVCaptureDevice.default(for: AVMediaType.video)
        
        do {
            let input = try AVCaptureDeviceInput(device: captureDevice!)
            session.addInput(input)
        }
        catch {
            print("Error")
        }
        
        let output = AVCaptureMetadataOutput()
        session.addOutput(output)
        
        output.setMetadataObjectsDelegate(self, queue: DispatchQueue.main)
        output.metadataObjectTypes = [AVMetadataObject.ObjectType.qr]
        
        video = AVCaptureVideoPreviewLayer(session: session)
        video.frame = view.layer.bounds
        view.layer.addSublayer(video)
        
        self.view.bringSubview(toFront: imgSquare)
        
        session.startRunning()
    }

    func metadataOutput(_ output: AVCaptureMetadataOutput, didOutput metadataObjects: [AVMetadataObject], from connection: AVCaptureConnection)
    {
       /* if metadataObjects != nil && metadataObjects.count != nil
        {
            if let object = metadataObjects[0] as? AVMetadataMachineReadableCodeObject
            {
                if object.type == AVMetadataObject.ObjectType.qr
                {
                    let alert = UIAlertController(title: "QR Code", message: object.stringValue, preferredStyle: .alert)
                    alert.addAction(UIAlertAction(title: "Retake", style: .default, handler: nil))
                    alert.addAction(UIAlertAction(title: "Copy", style: .default, handler: { (nil) in
                        
                        UIPasteboard.general.string = object.stringValue
                    }))
                    
                    present(alert, animated: true, completion: nil)
                }
            }
        }
        */
        
        
        if metadataObjects.count == 0 {
            //qrCodeFrameView?.frame = CGRect.zero
            //messageLabel.text = "No QR code is detected"
            return
        }
        
        // Get the metadata object.
        let object = metadataObjects[0] as? AVMetadataMachineReadableCodeObject
        
        let supportedCodeTypes = AVMetadataObject.ObjectType.qr
        
        if supportedCodeTypes == .qr {
            // If the found metadata is equal to the QR code metadata (or barcode) then update the status label's text and set the bounds
            //let barCodeObject = videoPreviewLayer?.transformedMetadataObject(for: metadataObj)
            //qrCodeFrameView?.frame = barCodeObject!.bounds
            
            let alert = UIAlertController(title: "QR Code", message: object?.stringValue, preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Retake", style: .default, handler: nil))
            alert.addAction(UIAlertAction(title: "Copy", style: .default, handler: { (nil) in
                
                UIPasteboard.general.string = object?.stringValue
            }))
            
            present(alert, animated: true, completion: nil)
            
            
            if object?.stringValue != nil {
                //launchApp(decodedURL: metadataObj.stringValue!)
                //messageLabel.text = metadataObj.stringValue
            }
        }
        
    }


}


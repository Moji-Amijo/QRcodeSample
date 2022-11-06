//
//  QrCodeCameraDelegate.swift
//  QRcodeSample
//
//  Created by 矢竹昭博 on 2022/10/17.
//

import AVFoundation

class QrCodeCameraDelegate: NSObject, AVCaptureMetadataOutputObjectsDelegate {
    
    var onResult: (String) -> Void = { _  in }
    
    func metadataOutput(_ output: AVCaptureMetadataOutput, didOutput metadataObjects: [AVMetadataObject], from connection: AVCaptureConnection) {
        if let metadataObject = metadataObjects.first {
            guard let readableObject = metadataObject as? AVMetadataMachineReadableCodeObject else { return }
            guard let stringValue = readableObject.stringValue else { return }
            
            onResult(stringValue)
        }
    }
    
}

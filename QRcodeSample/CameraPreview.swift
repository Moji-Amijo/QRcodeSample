//
//  CameraPreview.swift
//  QRcodeSample
//
//  Created by 矢竹昭博 on 2022/10/17.
//

import UIKit
import AVFoundation

class CameraPreview: UIView {
    
    private var label:UILabel?
    
    private let metadataOutput = AVCaptureMetadataOutput()
    
    private var previewLayer: AVCaptureVideoPreviewLayer?
    private let session = AVCaptureSession()
    
    init(delegate: QrCodeCameraDelegate) {
        super.init(frame: .zero)
        
        AVCaptureDevice.requestAccess(for: .video) { granted in
            DispatchQueue.main.sync {
                if granted {
                    
                    if let backCamera = AVCaptureDevice.default(for: AVMediaType.video) {
                        if let input = try? AVCaptureDeviceInput(device: backCamera) {
                            self.session.sessionPreset = .photo
                            
                            if self.session.canAddInput(input) {
                                self.session.addInput(input)
                            }
                            if self.session.canAddOutput(self.metadataOutput) {
                                self.session.addOutput(self.metadataOutput)
                                
                                self.metadataOutput.metadataObjectTypes = [.qr]
                                self.metadataOutput.setMetadataObjectsDelegate(delegate, queue: DispatchQueue.main)
                            }
                            let prevLayer = AVCaptureVideoPreviewLayer(session: self.session)
                            
                            self.backgroundColor = UIColor.gray
                            prevLayer.videoGravity = .resizeAspectFill
                            self.layer.addSublayer(prevLayer)
                            self.previewLayer = prevLayer
                            
                            self.session.startRunning()
                            
                        }
                    }
                    
                }
            }
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        previewLayer?.frame = self.bounds
    }
}

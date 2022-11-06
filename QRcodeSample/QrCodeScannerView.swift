//
//  QrCodeScannerView.swift
//  QRcodeSample
//
//  Created by 矢竹昭博 on 2022/10/17.
//

import SwiftUI
import AVFoundation

struct QrCodeScannerView: UIViewRepresentable {
    
    typealias UIViewType = CameraPreview
    
    let delegate: QrCodeCameraDelegate
    
    func makeUIView(context: UIViewRepresentableContext<QrCodeScannerView>) -> QrCodeScannerView.UIViewType {
        return CameraPreview(delegate: delegate)
    }
    
    func updateUIView(_ uiView: CameraPreview, context: UIViewRepresentableContext<QrCodeScannerView>) {
        //uiView.setContentHuggingPriority(.defaultHigh, for: .vertical)
        //uiView.setContentHuggingPriority(.defaultLow, for: .horizontal)
    }
    /*
    static func dismantleUIView(_ uiView: CameraPreview, coordinator: ()) {
        //uiView.session.stopRunning()
    }
    */
}

//
//  ContentView.swift
//  QRcodeSample
//
//  Created by 矢竹昭博 on 2022/10/14.
//

import SwiftUI

struct ContentView: View {
    
    @State var lastQrCode: String = "QRコード"
    private let delegate = QrCodeCameraDelegate()

    var body: some View {
        VStack {
            // QRコード表示領域
            Text("QR = [ " + lastQrCode + " ]")
            
            // カメラプレビュー領域
            QrCodeScannerView(delegate: delegate)
        }
        .onAppear() {
            delegate.onResult = onFoundQrCode
        }
    }
    
    func onFoundQrCode(_ code: String) {
        print(code)
        lastQrCode = code
    }
    
}

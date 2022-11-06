//
//  ScannerViewModel.swift
//  QRcodeSample
//
//  Created by 矢竹昭博 on 2022/10/14.
//

import Foundation

class ScannerViewModel: ObservableObject {

    @Published var isShowing: Bool = false

    /// QRコード読み取り時に実行される。
    func onFoundQrCode(_ code: String) {
        self.lastQrCode = code
        isShowing = false
    }
}

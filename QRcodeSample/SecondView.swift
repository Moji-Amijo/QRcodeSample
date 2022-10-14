//
//  SecondView.swift
//  QRcodeSample
//
//  Created by 矢竹昭博 on 2022/10/14.
//

import SwiftUI

struct SecondView: View {
    
   @ObservedObject var viewModel : ScannerViewModel
    
    var body: some View {
        Text("SecondView")
    }
}

struct SecondView_Previews: PreviewProvider {
    
    @ObservedObject var viewModel : ScannerViewModel
    
    static var previews: some View {
        SecondView(viewModel: viewModel)
    }
}

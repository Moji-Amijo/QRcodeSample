//
//  ContentView.swift
//  QRcodeSample
//
//  Created by 矢竹昭博 on 2022/10/14.
//

import SwiftUI

struct ContentView: View {
    
    //クラスのプロパティの変更を監視
    
    @ObservedObject var viewModel = ScannerViewModel()
    
    
    
    var body: some View {
        VStack {
            Text("QR Code Reader")
                .padding()
            
            // 読み取ったQRコード表示位置
             Text("URL = [ " + viewModel.lastQrCode + " ]")
            
            Button(action: {
                         viewModel.isShowing = true
                        }){
                            Text("カメラ起動")
                            Image(systemName: "camera")
                        }
                        .fullScreenCover(isPresented: $viewModel.isShowing) {
                          //  SecondView(viewModel: viewModel)
                        }
            
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

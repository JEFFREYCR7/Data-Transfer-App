//
//  ContentView.swift
//  DataTransferIOS
//
//  Created by 王杰瑞 on 2024/10/29.
//

import SwiftUI

struct ContentView: View {
    @StateObject private var viewModel = DataViewModel()
    
    var body: some View {
        VStack {
            TextField("Enter content", text: $viewModel.content)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()
            
            Button(action: {
                viewModel.sendDataEntry()
            }) {
                Text("Send Data")
                    .font(.headline)
                    .foregroundColor(.white)
                    .padding()
                    .background(Color.blue)
                    .cornerRadius(8)
            }
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

//
//  DataViewModel.swift
//  DataTransferIOS
//
//  Created by 王杰瑞
//

import Foundation

class DataViewModel: ObservableObject {
    @Published var content: String = "" // 用于输入的内容
    
    func sendDataEntry() {
        // 服务器URL
        guard let url = URL(string: "http://your_ip_address/api/data") else { return }
        
        // 创建请求
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        
        // 创建 DataEntry 对象
        let dataEntry = DataEntry(id: nil, content: content, timeStamp: nil)
        
        // 编码为JSON格式
        guard let encoded = try? JSONEncoder().encode(dataEntry) else {
            print("Failed to encode DataEntry")
            return
        }
        request.httpBody = encoded
        
        // 发送请求
        URLSession.shared.dataTask(with: request) { data, response, error in
            // 处理错误
            if let error = error {
                print("Error sending data: \(error.localizedDescription)")
                return
            }
            
            // 处理响应
            guard let data = data else {
                print("No data received")
                return
            }
            
            // 解析返回的数据
            if let responseData = try? JSONDecoder().decode(DataEntry.self, from: data) {
                DispatchQueue.main.async {
                    print("Data sent successfully: \(responseData)")
                }
            } else {
                print("Invalid response from server")
            }
        }.resume() // 启动任务
    }
}

//
//  DataEntry.swift
//  DataTransferIOS
//
//  Created by 王杰瑞 
//

import Foundation

struct DataEntry: Codable, Identifiable {
    var id: Int?        // 服务器生成的ID
    var content: String  // 内容
    var timeStamp: Date? // 可选的时间戳
}

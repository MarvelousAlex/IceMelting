//
//  MessageModel.swift
//  IceMelting
//
//  Created by Wendy Zhou on 14/5/2025.
//

import Foundation

struct MessageModel: Hashable {
    var content: String
    var sender: String
    var timeStamp: Date = .now
}

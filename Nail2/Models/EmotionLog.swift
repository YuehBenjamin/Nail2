//
//  EmotionLog.swift
//  Nail2
//
//  Created by user29 on 2025/8/1.
//

import Foundation

struct EmotionLog: Identifiable {
    let id = UUID()
    let date: Date
    let action: String  // "釘子" or "拔釘子"
}

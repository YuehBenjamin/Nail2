//
//  FenceNail.swift
//  Nail2
//
//  Created by user29 on 2025/8/1.

//釘子模型
import SwiftUI

struct FenceNail: Identifiable {
    let id = UUID()
    var isNail: Bool
    let offsetX: CGFloat
    let offsetY: CGFloat
}

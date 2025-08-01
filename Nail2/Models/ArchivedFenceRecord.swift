//
//  ArchivedFenceRecord.swift
//  Nail2
//
//  Created by user29 on 2025/8/1.

//
import Foundation

struct ArchivedFenceRecord: Identifiable {
    let id = UUID()
    let timestamp: Date
    let nailCount: Int
    let holeCount: Int
}

//
//  ArchiveListView.swift
//  Nail2
//
//  Created by user29 on 2025/8/1.

//歷史籬笆紀錄
import SwiftUI

struct ArchiveListView: View {
    let archivedLogs: [ArchivedFenceRecord]

    var body: some View {
        List {
            ForEach(archivedLogs.reversed()) { record in
                VStack(alignment: .leading, spacing: 4) {
                    Text("🕰️ \(record.timestamp.formatted(.dateTime.month().day().hour().minute()))")
                        .font(.subheadline)
                    Text("釘子：\(record.nailCount)，釘孔：\(record.holeCount)")
                        .font(.caption)
                        .foregroundColor(.gray)
                }
                .padding(.vertical, 4)
            }
        }
        .navigationTitle("📦 歷史籬笆記錄")
    }
}


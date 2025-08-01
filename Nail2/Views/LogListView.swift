//
//  LogListView.swift
//  Nail2
//
//  Created by user29 on 2025/8/1.

//歷史紀錄
import SwiftUI

struct LogListView: View {
    let logs: [EmotionLog]

    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            ForEach(logs.reversed()) { log in
                HStack {
                    Text(log.action == "釘子" ? "💢 發脾氣" : "😌 冷靜下來")
                        .foregroundColor(log.action == "釘子" ? .red : .blue)
                    Spacer()
                    Text(log.date, style: .time)
                        .font(.caption)
                        .foregroundColor(.gray)
                }
                .padding(.vertical, 2)
                Divider()
            }
        }
    }
}

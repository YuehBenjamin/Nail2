//
//  ContentView.swift
//  Nail2
//
//  Created by user29 on 2025/8/1.

//主畫面
import SwiftUI

struct ContentView: View {
    @State private var fence: [FenceNail] = []
    @State private var logs: [EmotionLog] = []
    @State private var archivedLogs: [ArchivedFenceRecord] = []
    @State private var showFenceFullAlert = false
    @State private var showArchiveView = false  // 👈 用來控制畫面切換

    let fenceLimit = 50
    let columns = Array(repeating: GridItem(.fixed(12), spacing: 4), count: 10)

    var body: some View {
        NavigationStack {
            ScrollView {
                VStack(spacing: 20) {
                    Text("Emotional Fence")
                        .font(.largeTitle)
                        .padding(.top)

                    // 籬笆區域
                    FenceView(fence: fence, columns: columns)

                    // 按鈕區域
                    VStack(spacing: 10) {
                        Button(action: addNail) {
                            Text("我發脾氣了（+釘子）")
                                .frame(maxWidth: .infinity)
                                .padding()
                                .background(Color.pink)
                                .foregroundColor(.white)
                                .cornerRadius(12)
                        }

                        Button(action: removeNail) {
                            Text("我冷靜了（拔釘子）")
                                .frame(maxWidth: .infinity)
                                .padding()
                                .background(Color.gray.opacity(0.2))
                                .foregroundColor(.pink)
                                .cornerRadius(12)
                        }
                    }
                    .padding(.horizontal)

                    Text("釘子：\(fence.filter { $0.isNail }.count)，釘孔：\(fence.filter { !$0.isNail }.count)")
                        .font(.caption)

                    Divider().padding(.top, 10)

                    Text("📋 歷史紀錄")
                        .font(.headline)
                        .padding(.horizontal)

                    ScrollView {
                        LogListView(logs: logs)
                            .padding(.horizontal)
                    }
                    .frame(height: 200)

                    // ⬇️ 歷史紀錄入口按鈕（跳轉頁面）
                    Button(action: {
                        showArchiveView = true
                    }) {
                        HStack {
                            Image(systemName: "archivebox")
                            Text("查看歷史籬笆")
                        }
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(Color.gray.opacity(0.15))
                        .cornerRadius(12)
                        .padding(.horizontal)
                    }

                    Spacer(minLength: 40)
                }
            }
            .navigationDestination(isPresented: $showArchiveView) {
                ArchiveListView(archivedLogs: archivedLogs)
            }
            .alert("籬笆滿了", isPresented: $showFenceFullAlert) {
                Button("更換籬笆", action: resetFence)
            } message: {
                Text("目前籬笆已滿，已記錄釘子與釘孔數據，現在開始新的一面籬笆。")
            }
        }
    }

    func addNail() {
        if fence.count >= fenceLimit {
            showFenceFullAlert = true
        } else {
            withAnimation {
                let offsetX = CGFloat.random(in: -2...2)
                let offsetY = CGFloat.random(in: -2...2)
                fence.append(FenceNail(isNail: true, offsetX: offsetX, offsetY: offsetY))
                logs.append(EmotionLog(date: Date(), action: "釘子"))
            }
        }
    }

    func removeNail() {
        if let index = fence.lastIndex(where: { $0.isNail }) {
            withAnimation {
                fence[index].isNail = false
                logs.append(EmotionLog(date: Date(), action: "拔釘子"))
            }
        }
    }

    func resetFence() {
        let nailCount = fence.filter { $0.isNail }.count
        let holeCount = fence.filter { !$0.isNail }.count
        archivedLogs.append(ArchivedFenceRecord(timestamp: Date(), nailCount: nailCount, holeCount: holeCount))
        fence.removeAll()
        logs.removeAll()
    }
}


#Preview {
    ContentView()
}

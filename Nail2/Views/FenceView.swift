//
//  FenceView.swift
//  Nail2
//
//  Created by user29 on 2025/8/1.

//籬笆
import SwiftUI

struct FenceView: View {
    let fence: [FenceNail]
    let columns: [GridItem]

    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 12)
                .fill(Color.gray.opacity(0.2))
                .frame(width: 350, height: 200)

            LazyHGrid(rows: columns, spacing: 10) {
                ForEach(fence) { item in
                    Circle()
                        .fill(item.isNail ? Color.black : .clear)
                        .overlay(
                            Circle()
                                .stroke(Color.gray.opacity(item.isNail ? 0 : 1), lineWidth: 1)
                        )
                        .frame(width: 8, height: 8)
                        .offset(x: item.offsetX, y: item.offsetY)
                }
            }
            .padding(8)
        }
    }
}

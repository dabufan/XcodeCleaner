//
//  ContentView.swift
//  XcodeCleaner
//
//  Created by Q Lee on 2025/8/17.
//

import SwiftUI

struct ContentView: View {
    @State private var isCleaning = false
    @State private var progress: Double = 0
    @State private var message = "点击开始清理"

    var body: some View {
        VStack(spacing: 20) {
            Text("Xcode Cleaner")
                .font(.largeTitle)
                .bold()

            Text(message)
                .foregroundColor(.secondary)

            ProgressView(value: progress, total: 4)
                .progressViewStyle(LinearProgressViewStyle())
                .frame(width: 250)

            Button(isCleaning ? "正在清理..." : "开始清理") {
                startCleaning()
            }
            .disabled(isCleaning)
            .keyboardShortcut(.defaultAction)
        }
        .padding(40)
        .frame(width: 400, height: 200)
    }

    private func startCleaning() {
        isCleaning = true
        progress = 0
        message = "正在清理缓存..."

        let steps: [(String, String)] = [
            ("DerivedData", "~/Library/Developer/Xcode/DerivedData/*"),
            ("Archives", "~/Library/Developer/Xcode/Archives/*"),
            ("ModuleCache", "~/Library/Developer/Xcode/ModuleCache.noindex/*"),
            ("Logs", "~/Library/Logs/Xcode/*")
        ]

        DispatchQueue.global().async {
            for (i, step) in steps.enumerated() {
                DispatchQueue.main.async {
                    message = "清理 \(step.0)..."
                    progress = Double(i + 1)
                }

                _ = shell("rm -rf \(step.1)")

                Thread.sleep(forTimeInterval: 0.6) // 模拟进度可见
            }

            DispatchQueue.main.async {
                message = "✅ 清理完成！"
                isCleaning = false
            }
        }
    }

    private func shell(_ command: String) -> String {
        let task = Process()
        task.launchPath = "/bin/zsh"
        task.arguments = ["-c", command]

        let pipe = Pipe()
        task.standardOutput = pipe
        task.standardError = pipe
        task.launch()

        let data = pipe.fileHandleForReading.readDataToEndOfFile()
        return String(data: data, encoding: .utf8) ?? ""
    }
}

//
/*******************************************************************************
 
 File name:     FileReadAndWrite.swift
 Author:        FeiYehua
 
 Description:   Created for Calculator in 2024
 
 History:
 2024/10/17: File created.
 
 ********************************************************************************/


import Foundation
import SwiftUI

struct TestView: View {
    @State private var fileContent: [String] = []
    
    var body: some View {
        VStack {
            Button("Save to file") {
                saveToFile(content: "Line 1\nLine 2\nLine 3\n")
            }
            .padding()
            
            Button("Read from file") {
                fileContent = readFromFile().components(separatedBy: "\n")
            }
            .padding()
            Button("Clear History") {
                clearHistory()
            }
            .padding()
            List(fileContent, id: \.self) { line in
                Text(line)
            }
        }
    }
    
    
}

func getDocumentsDirectory() -> URL {
    let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
    return paths[0]
}

func saveToFile(content: String) {
    let fileURL = getDocumentsDirectory().appendingPathComponent("CalculationHistory.txt")
    do{
        let existingContent = try String(contentsOf: fileURL, encoding: .utf8)
        // 将文件内容按行分割
        let lines = existingContent.components(separatedBy: .newlines)
        
        // 只保留前 100 行，超过的内容将被丢弃
        let truncatedContent = lines.prefix(100).joined(separator: "\n")
        let newContent = content + truncatedContent
        do {
            try newContent.write(to: fileURL, atomically: true, encoding: .utf8)
            print("File saved at: \(fileURL)")
        } catch {
            print("Failed to save file: \(error.localizedDescription)")
        }
    } catch {
        do {
            try content.write(to: fileURL, atomically: true, encoding: .utf8)
            print("File saved at: \(fileURL)")
        } catch {
            print("Failed to save file: \(error.localizedDescription)")
        }
        print("Failed to truncate file: \(error.localizedDescription)")
    }
}

func readFromFile() -> String {
    let fileURL = getDocumentsDirectory().appendingPathComponent("CalculationHistory.txt")
    do {
        var content = try String(contentsOf: fileURL, encoding: .utf8)
        content = content.trimmingCharacters(in: .newlines)
        return content
    } catch {
        print("Failed to read file: \(error.localizedDescription)")
        return "No history available!"
    }
}
func clearHistory() -> Void{
    let fileURL = getDocumentsDirectory().appendingPathComponent("CalculationHistory.txt")
    let fileManager = FileManager.default
    do {
        try fileManager.removeItem(at: fileURL)
        return
    } catch {
        print("Failed to clear file: \(error.localizedDescription)")
        return
    }
}
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        TestView()
    }
}

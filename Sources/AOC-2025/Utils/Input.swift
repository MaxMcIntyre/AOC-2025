import Foundation

func readLines(from file: String) -> [String]? {
    let cwd = FileManager.default.currentDirectoryPath
    let url = URL(fileURLWithPath: cwd).appendingPathComponent("Inputs/" + file)
    guard let input = try? String(contentsOf: url) else {
        print("Failed to read file")
        return nil
    }
    return input.split(separator: "\n").map { String($0) }
}
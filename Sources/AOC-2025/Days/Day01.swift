import Foundation

struct Day01 {
    func run() {
        let cwd = FileManager.default.currentDirectoryPath
        let url = URL(fileURLWithPath: cwd).appendingPathComponent("Inputs/day01.txt")
        guard let input = try? String(contentsOf: url) else {
          print("Failed to read file")
          return
        }
        let lines = input.split(separator: "\n").map { String($0) }
        print(part1(lines))
        print(part2(lines))
    }

    private func part1(_ lines: [String]) -> Int {
        var ticker = 50
        var result = 0

        for line in lines {
            let direction = line[line.startIndex]
            guard let steps = Int(line.dropFirst()) else { continue }

            switch direction {
            case "L":
                ticker = (ticker - steps + 100) % 100
            case "R":
                ticker = (ticker + steps) % 100
            default:
                continue
            }
            
            if ticker == 0 {
                result += 1
            }
        }

        return result
    }

    private func part2(_ lines: [String]) -> Int {
        var ticker = 50
        var result = 0

        for line in lines {
            let direction = line[line.startIndex]
            guard var steps = Int(line.dropFirst()) else { continue }

            result += steps / 100
            steps %= 100

            switch direction {
            case "L":
                if ticker - steps <= 0 && ticker != 0 {
                    result += 1
                }
                ticker = (ticker - steps + 100) % 100
            case "R":
                if ticker + steps > 99 {
                    result += 1
                }
                ticker = (ticker + steps) % 100
            default:
                continue
            }
        }

        return result
    }
}
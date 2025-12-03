import Foundation

struct Day01 {
    func run() {
        if let lines = readLines(from: "day01.txt") {
            print(part1(lines))
            print(part2(lines))
        }
    }

    private func part1(_ lines: [String]) -> Int {
        var dial = 50
        var result = 0

        for line in lines {
            let direction = line[line.startIndex]
            guard let steps = Int(line.dropFirst()) else { continue }

            switch direction {
            case "L":
                dial = (dial - steps + 100) % 100
            case "R":
                dial = (dial + steps) % 100
            default:
                continue
            }
            
            if dial == 0 {
                result += 1
            }
        }

        return result
    }

    private func part2(_ lines: [String]) -> Int {
        var dial = 50
        var result = 0

        for line in lines {
            let direction = line[line.startIndex]
            guard var steps = Int(line.dropFirst()) else { continue }

            result += steps / 100
            steps %= 100

            switch direction {
            case "L":
                if dial - steps <= 0 && dial != 0 {
                    result += 1
                }
                dial = (dial - steps + 100) % 100
            case "R":
                if dial + steps > 99 {
                    result += 1
                }
                dial = (dial + steps) % 100
            default:
                continue
            }
        }

        return result
    }
}
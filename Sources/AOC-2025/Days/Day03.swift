import Foundation

struct Day03 {
    func run() {
        if let lines = readLines(from: "day03.txt") {
            print(part1(lines))
            print(part2(lines))
        }
    }

    private func part1(_ lines: [String]) -> Int {
        var result = 0

        for line in lines {
            var maxLeftJoltage = 0
            var maxLeftIndex = 0

            for i in 0..<(line.count - 1) {
                if let joltage = line.int(at: i), joltage > maxLeftJoltage {
                    maxLeftJoltage = joltage
                    maxLeftIndex = i
                }
            }

            var maxRightJoltage = 0

            for i in maxLeftIndex + 1..<line.count {
                if let joltage = line.int(at: i) {
                    maxRightJoltage = max(maxRightJoltage, joltage)
                }
            }

            result += 10 * maxLeftJoltage + maxRightJoltage
        }

        return result
    }

    private func part2(_ lines: [String]) -> Int {
        var result = 0
        
        for line in lines {
            var start = 0
            var digits: [Int] = []

            for battery in 0..<12 {
                var maxJoltageInRemaining = 0
                let slice = line[start..<(line.count - (12 - battery) + 1)]
                var indexAtMax = start

                for i in 0..<slice.count {
                    if let joltage = line.int(at: i + start), joltage > maxJoltageInRemaining {
                        maxJoltageInRemaining = joltage
                        indexAtMax = i + start
                    }
                }
                digits.append(maxJoltageInRemaining)
                start = indexAtMax + 1
            }

            let totalMaxJoltage = digits.reduce(0) { $0 * 10 + $1 }
            result += totalMaxJoltage
        }

        return result
    }
}
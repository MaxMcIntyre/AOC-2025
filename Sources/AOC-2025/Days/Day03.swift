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

            for (i, index) in line.indices.dropLast().enumerated() {
                let joltage = Int(String(line[index])) ?? 0
                if joltage > maxLeftJoltage {
                    maxLeftJoltage = joltage
                    maxLeftIndex = i
                }
            }

            let startIndex = line.index(line.startIndex, offsetBy: maxLeftIndex + 1)
            var maxRightJoltage = 0

            for index in line.indices[startIndex...] {
                maxRightJoltage = max(maxRightJoltage, Int(String(line[index])) ?? 0)
            }

            result += 10 * maxLeftJoltage + maxRightJoltage
        }

        return result
    }

    private func part2(_ lines: [String]) -> Int {
        var result = 0
        
        for line in lines {
            var startingPoint = 0
            var totalMaxJoltage = 0
            var digits: [Int] = []

            for battery in 0..<12 {
                var maxJoltageInRemaining = 0
                let startIndex = line.index(line.startIndex, offsetBy: startingPoint)
                let endIndex = line.index(line.endIndex, offsetBy: -(12 - battery))

                let base = line.distance(from: line.startIndex, to: startIndex)
                for (i, index) in line.indices[startIndex...endIndex].enumerated() {
                    let joltage = Int(String(line[index])) ?? 0
                    if joltage > maxJoltageInRemaining {
                        maxJoltageInRemaining = joltage
                        startingPoint = base + i + 1
                    }
                }
                digits.append(maxJoltageInRemaining)
            }

            var multiplier = 1
            for digit in digits.reversed() {
                totalMaxJoltage += digit * multiplier
                multiplier *= 10
            }

            result += totalMaxJoltage
        }

        return result
    }
}
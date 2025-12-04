import Foundation

struct Day02 {
    func run() {
        if let lines = readLines(from: "day02.txt") {
            let ids = lines[0].split(separator: ",").map { String($0) }
            print(part1(ids))
            print(part2(ids))
        }
    }

    private func part1(_ ids: [String]) -> Int {
        var result = 0

        for id in ids {
            let range = id.split(separator: "-")
            if let first = Int(range[0]), let second = Int(range[1]) {
                for num in first...second {
                    if checkRepeatedSequenceTwice(num) {
                        result += num
                    }
                }
            }
        }
        return result
    }

    private func part2(_ ids: [String]) -> Int {
        var result = 0

        for id in ids {
            let range = id.split(separator: "-")
            if let first = Int(range[0]), let second = Int(range[1]) {
                for num in first...second {
                    if checkRepeatedSequenceAny(num) {
                        result += num
                    }
                }
            }
        }
        return result
    }

    private func checkRepeatedSequenceTwice(_ num: Int) -> Bool {
        let numStr = String(num)
        if numStr.count % 2 == 1 {
            return false
        }
        return numStr.prefix(numStr.count / 2) == numStr.suffix(numStr.count / 2)
    }

    private func checkRepeatedSequenceAny(_ num: Int) -> Bool {
        let numStr = String(num)
        if numStr.count == 1 {
            return false
        }
        for i in 1...numStr.count / 2 {
            if numStr.count % i == 0 {
                var slice = i
                let initialPrefix = numStr.prefix(i)
                var isRepeated = true

                while slice < numStr.count {
                    let start = numStr.index(numStr.startIndex, offsetBy: slice)
                    let end = numStr.index(start, offsetBy: i)

                    if numStr[start..<end] != initialPrefix {
                        isRepeated = false
                        break
                    }
                    slice += i
                }
                if isRepeated {
                    return true
                }
            }
        }
        return false
    }
}
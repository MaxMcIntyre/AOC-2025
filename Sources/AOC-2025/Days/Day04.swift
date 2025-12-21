import Foundation

struct Day04 {
    func run() {
        if let lines = readLines(from: "day04.txt") {
            print(part1(lines))
            print(part2(lines))
        }
    }

    private func part1(_ grid: [String]) -> Int {
        var result = 0
        let directions = [(-1,-1),(-1,0),(-1,1),(0,-1),(0,1),(1,-1),(1,0),(1,1)]
        let xRange = 0..<grid.count
        let yRange = 0..<grid[0].count

        for x in 0..<grid.count {
            for y in 0..<grid[x].count {
                if grid[x][y] == "@" {
                    var adjacentRolls = 0
                    for (dx, dy) in directions {
                        let (nx, ny) = (x + dx, y + dy)
                        if xRange.contains(nx) && yRange.contains(ny) && grid[nx][ny] == "@" {
                            adjacentRolls += 1
                        }
                        if adjacentRolls >= 4 {
                            break
                        }
                    }
                    if adjacentRolls < 4 {
                        result += 1
                    }
                }
            }
        }

        return result
    }

    private func part2(_ grid: [String]) -> Int {
        var grid = grid
        var result = 0
        let directions = [(-1,-1),(-1,0),(-1,1),(0,-1),(0,1),(1,-1),(1,0),(1,1)]
        let xRange = 0..<grid.count
        let yRange = 0..<grid[0].count

        while true {
            var changes = 0

            for x in 0..<grid.count {
                for y in 0..<grid[x].count {
                    if grid[x][y] == "@" {
                        var adjacentRolls = 0
                        for (dx, dy) in directions {
                            let (nx, ny) = (x + dx, y + dy)
                            if xRange.contains(nx) && yRange.contains(ny) && grid[nx][ny] == "@" {
                                adjacentRolls += 1
                            }
                            if adjacentRolls >= 4 {
                                break
                            }
                        }
                        if adjacentRolls < 4 {
                            result += 1
                            changes += 1
                            var row = Array(grid[x])
                            row[y] = "."
                            grid[x] = String(row)
                        }
                    }
                }
            }
            if changes == 0 {
                return result
            }
        }
    }
}
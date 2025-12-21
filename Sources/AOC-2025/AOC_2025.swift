@main
struct AOC_2025 {
    static func main() {
        let day = CommandLine.arguments.dropFirst().first ?? "1"

        switch day {
          case "1": Day01().run()
          case "2": Day02().run()
          case "3": Day03().run()
          case "4": Day04().run()
          default: print("Day not implemented")
        }
    }
}

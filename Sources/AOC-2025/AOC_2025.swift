@main
struct AOC_2025 {
    static func main() {
        let day = CommandLine.arguments.dropFirst().first ?? "1"

        switch day {
          case "1": Day01().run()
          default: print("Day not implemented")
        }
    }
}

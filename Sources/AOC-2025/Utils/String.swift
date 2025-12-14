extension String {
    subscript(i: Int) -> Character {
        self[stringIndex(i)]
    }

    subscript(range: Range<Int>) -> Substring {
        let start = stringIndex(range.lowerBound)
        let end = stringIndex(range.upperBound)
        return self[start..<end]
    }
    
    subscript(range: ClosedRange<Int>) -> Substring {
        let start = stringIndex(range.lowerBound)
        let end = stringIndex(range.upperBound)
        return self[start...end]
    }

    func int(at i: Int) -> Int? {
        self[i].wholeNumberValue
    }
    
    func stringIndex(_ i: Int) -> String.Index {
        let count = self.count
        var positiveIndex = i >= 0 ? i : count + i
        if positiveIndex < 0 { positiveIndex = 0 }
        if positiveIndex > count { positiveIndex = count }
        return index(startIndex, offsetBy: positiveIndex)
    }
}
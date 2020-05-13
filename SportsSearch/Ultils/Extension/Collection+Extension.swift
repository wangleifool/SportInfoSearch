//
//  Collection+Extension.swift
//  SportsSearch
//
//  Created by lei wang on 2020/5/13.
//  Copyright © 2020 wanglei. All rights reserved.
//

import Foundation

extension Sequence {
    func group<U: Hashable>(key: (Iterator.Element) -> U) -> [U: [Iterator.Element]] {
        var results: [U: [Iterator.Element]] = [:]
        for element in self {
            let key = key(element)
            if case nil = results[key]?.append(element) {
                results[key] = [element]
            }
        }
        return results
    }
}

extension Array {
    func safeElement(_ i: Int) -> Array.Iterator.Element? {
        guard !isEmpty && self.count > i else { return nil }
        let event = self.enumerated().first { $0.offset == i }
        return event?.element
    }
}

extension Array {
    // https://kotlinlang.org/api/latest/jvm/stdlib/kotlin.collections/windowed.html
    func windowed(size: Int, step: Int = 1, partialWindows: Bool = false) -> [[Element]] {
        var index = 0
        var results: [[Element]] = []
        while index < count {
            let windowedSize = Swift.min(size, count - index)
            if windowedSize < size && !partialWindows {
                break
            }
            results.append(Array(self[index..<(index + windowedSize)]))
            index += step
        }
        return results
    }

    func chunked(size: Int, partialWindows: Bool = false) -> [[Element]] {
        return self.windowed(size: size, step: size, partialWindows: partialWindows)
    }
}

extension Collection {
    subscript (safe index: Index) -> Element? {
        return indices.contains(index) ? self[index] : nil
    }
}

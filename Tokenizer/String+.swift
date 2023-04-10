//
//  String+.swift
//  Tokenizer
//
//  Created by Ahmed Yamany on 10/04/2023.
//

import Foundation

extension String {
    subscript(bounds: Range<Int>) -> String {
        String(self[self + bounds.lowerBound ..< self + bounds.upperBound])
    }
    subscript(bounds: ClosedRange<Int>) -> String {
        String(self[self + bounds.lowerBound ... self + bounds.upperBound])
    }
    subscript(bounds: PartialRangeFrom<Int>) -> String {
        String(self[self + bounds.lowerBound ..< endIndex])
    }
    subscript(bounds: PartialRangeUpTo<Int>) -> String {
        String(self[startIndex ..< self + bounds.upperBound])
    }
    subscript(bounds: PartialRangeThrough<Int>) -> String {
        String(self[startIndex ... self + bounds.upperBound])
    }
    static func + (string: Self, offset: Int) -> String.Index {
        string.index(at: offset)
    }
    func index(at offset: Int) -> String.Index {
        index(startIndex, offsetBy: offset)
    }
}

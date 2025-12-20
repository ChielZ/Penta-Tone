//
//  DiatonicLetter.swift
//  Penta-Tone
//
//  Created by Chiel Zwinkels on 20/12/2025.
//

import Foundation

/// Represents the seven diatonic letters (A-G) used in Western music notation
enum DiatonicLetter: Int, CaseIterable {
    case c = 0, d = 1, e = 2, f = 3, g = 4, a = 5, b = 6
    
    /// The letter name in uppercase (e.g., "C", "D", "E")
    var name: String {
        String(describing: self).uppercased()
    }
    
    /// Advance by a number of diatonic steps (wraps around at 7)
    func advanced(by steps: Int) -> DiatonicLetter {
        let newIndex = (rawValue + steps % 7 + 7) % 7
        return DiatonicLetter(rawValue: newIndex)!
    }
    
    /// The semitone offset of this letter when unmodified (natural)
    /// Relative to C = 0
    var naturalSemitoneOffset: Int {
        switch self {
        case .c: return 0
        case .d: return 2
        case .e: return 4
        case .f: return 5
        case .g: return 7
        case .a: return 9
        case .b: return 11
        }
    }
}

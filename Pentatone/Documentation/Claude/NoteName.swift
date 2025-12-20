//
//  NoteName.swift
//  Penta-Tone
//
//  Created by Chiel Zwinkels on 20/12/2025.
//

import SwiftUI

/// Represents a musical note name with a letter and optional accidental
struct NoteName {
    let letter: String        // "A", "B", "C", etc.
    let accidental: String?   // "♯", "♭", "♯♯", "♭♭", or nil
    
    /// Plain text display of the note name
    var display: String {
        letter + (accidental ?? "")
    }
}

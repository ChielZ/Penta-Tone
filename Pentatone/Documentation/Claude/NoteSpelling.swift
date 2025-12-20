//
//  NoteSpelling.swift
//  Penta-Tone
//
//  Created by Chiel Zwinkels on 20/12/2025.
//

import Foundation

/// Determines what accidental is needed to spell a target semitone using a specific letter
func spell(semitone targetSemitone: Int, usingLetter letter: DiatonicLetter) -> NoteName {
    let natural = letter.naturalSemitoneOffset
    let difference = (targetSemitone - natural + 12) % 12
    
    let accidental: String?
    switch difference {
    case 0:  accidental = nil      // Natural
    case 1:  accidental = "♯"      // Sharp
    case 2:  accidental = "♯♯"     // Double sharp (rare)
    case 11: accidental = "♭"      // Flat (11 = -1 mod 12)
    case 10: accidental = "♭♭"     // Double flat (rare)
    default:
        // For extreme cases, fall back to multiple sharps
        // (In practice, well-formed scales shouldn't hit this)
        accidental = String(repeating: "♯", count: difference)
    }
    
    return NoteName(letter: letter.name, accidental: accidental)
}

/// Generates the note names for a scale in a given key
func noteNames(forScale scale: Scale, inKey root: MusicalKey) -> [NoteName] {
    let rootLetter = root.baseLetter
    
    return zip(scale.letterPattern, scale.semitonePattern).map { (letterStep, semitoneStep) in
        // Which diatonic letter to use for this note
        let targetLetter = rootLetter.advanced(by: letterStep)
        
        // Which chromatic pitch to hit
        let targetSemitone = (root.semitoneOffset + semitoneStep) % 12
        
        // Spell that pitch using that letter
        return spell(semitone: targetSemitone, usingLetter: targetLetter)
    }
}

//
//  Development roadmap.swift
//  Penta-Tone
//
//  Created by Chiel Zwinkels on 14/12/2025.
//

/*

MAIN
 √ Fix iOS 15 compatibility
 √ Add oscillator waveform to parameters
 √ add initial touch and aftertouch sensitivity
 - switch over to limited polyphony + voice management (round robin)
 - switch over to stereo architecture
 - try different filters
 - implement modulation generators
 - implement modulators in parameter structure
 - implement fine tune and octave adjustments
 - create preset management
 >> sanity check code structure
 - create developer view for sound editing/storing presets
 - add macro control
 - add drone note toggles to central note buttons?
 (- port engine to tonehive)
 - add in app documentation
 
UI
 √ ET / JI: display as EQUAL / JUST
 √ Improve spacing/layout
 √ Implement scale type graphics display (raw shapes or image files?)
 √ Implement note name display
 - Implement basic tooltip structure (toggle on/of in voice menu?)
 
MINOR IMPROVEMENTS
 √ Change intonation display from ET/JI to EQUAL / JUST
 √ Check font warning
 - distinguish between iPad landscape and iPad portrait for font sizes? (apparently tricky, couldn't get to work on first try - also, looking quite good already anyway)
 √ check delay dry/wet mix parameter direction, 0.0 is now fully wet and 1.0 is fully dry (?)
 - check: what is the update rate for touch (x position) changes? Filter sweep very choppy, cause?
 - accidentals don't resize properly in key display on iPhone (but they do in scale note display)
 
 
 CONCEPT FOR IMPROVED SOUND ENGINE:
 
 - There will be a polyphonic synth engine with some number of voices (5 would be a good start, this should be adjustable).
 - Instead of a 1 on 1 connection between keys and voices, there will be a dynamic voice allocation system with a simple round robin voice assignment system
 - The frequency of each voice will be updated each time it is triggered, dependant on the key that triggers it.
 - Each voice will get a second oscillator and a more sophisticated internal structure
 - In addition to the editable parameters, we will create dedicated modulators (LFOs, modulation envelopes), that will be able to update these parameters in realtime (at control rate, not at audio rate)
 - We will create a temporary 'developer view' allowing the creation of different presets (values for all audio and modulator parameters)
 - The final app will contain 15 different presets that should be browsable
 - We will also be creating a macro structure: while the final app will not allow the user to individually sculpt each parameter, there will be 4 macro sliders that map to one or more parameters, this will vary per preset.
 
 
 CONCEPT FOR PRESETS
 
 1.1  Keys (Wurlitzer-esque sound)
 1.2  Mallets (Marimba-esque sound)
 1.3  Sticks (Glockenspiel-esque sound)
 1.4  Pluck (Harp-esque sound)
 1.5  Pick (Koto-esque sound)
 
 2.1  Bow (Cello-esque sound)
 2.2  Breath (Low whistle-esque sound)
 2.3  Tube (Rock Organ-esque sound)
 2.4  Transistor (Analog polysynth-esque sound)
 2.5  Chip (Square Lead-esque sound)
 
 3.1  Ocean (Analog bass-esque sound)
 3.2  Forest (lively, organic sound)
 3.3  Field (warm, airy sound)
 3.4  Nebula (Warm, ethereal sound)
 3.5  Haze (Granular-esque sound)
 
 
 KEY TRANSPOSITION
 
 Key    ET pitch factor     JI pitch factor
 Ab     -6 semitones        * 
 Eb     +1 semitones        * 256/243
 Bb     -4 semitones        * 64/81
 F      +3 semitones        * 32/27
 C      -2 semitones        * 8/9
 G      +5 semitones        * 4/3
 D       0 semitones        * 1
 A      -5 semitones        * 3/4
 E      +2 semitones        * 9/8
 B      -3 semitones        * 27/32
 F#     +4 semitones        * 81/64
 C#     -1 semitones        * 243/256
 G#     +6 semitones        * 729/512
 
 
 DOCUMENTATION
 
 Add tooltips to following UI elements
 
 1. Optionsview (shared)
 1.2        Scale/Sound/Voice
 1.10/11    Note display area
 
 2. Scale view
 2.3        JI/ET
 2.4/5      Scale display area
 2.6        Key
 2.7        Celestial orientation
 2.8        Terrestrial orientation
 2.9        Keyboard rotation
 
 3. Sound view
 3.3        Preset selector
 3.4        Empty area
 3.5        Volume slider
 3.6        Tone slider
 3.7        Sustain slider
 3.8        Modulation slider
 3.9        Ambience slider
 
 4. Voice view
 4.3        Tips
 4.4/5/6    Pentatone logo area
 4.7        Voice mode
 4.8        Octave
 4.9        Fine tune
 
 Add 'More details' section with:
 - what is a pentatonic scale?
 - basic scale construction
 - JI vs ET
 - The advantages of pentatonics
 - Some examples (Western Pentatonic major/Minor, Ethiopian, African, Japanese)
 - Diagrams ET, JI ratios, JI names
 
 
 
 IDEAS FOR IN APP PURCHASES (FOR FUTURE VERSIONS OF APP)
 - Sound design: unlock 'developer view' with full access to all sound parameters plus option to create and store presets
 - Midi out: add midi output functionality, optimally in 4 versions:
    1) Standard >> polyphonic ET, compatible with any midi synthesizers (single selectable midi channel)
    2) Pitch bend JI >> works monophonically with any midi synthesizers (single selectable midi channel)
    3) MPE JI >> works polyphonically with MPE-capable synthesizers (multi channel)
    4) JI through .scala/.tun >> works polyphonically with synthesizers that support .tun/.scala (single selectable midi channel)
 - DAW integration: AUv3 for Garageband, Ableton link functionality
 - Pro package consisting of all three updgrades (sound editor, midi out, DAW integration)
 Pricing idea: around €3 each for single IAPs, or €6 for all three (pro package)
 
 
 */

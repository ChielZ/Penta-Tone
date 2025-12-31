//
//  V4-S08 ParameterPage8View.swift
//  Pentatone
//
//  Created by Chiel Zwinkels on 25/12/2025.
// SUBVIEW 8 - GLOBAL LFO

/*
 PAGE 8 - GLOBAL LFO (REFACTORED - FIXED DESTINATIONS)
 √ 1) Global LFO waveform
 √ 2) Global LFO mode (free/sync)
 √ 3) Global LFO frequency
 √ 4) Global LFO to oscillator amplitude amount
 √ 5) Global LFO to modulator multiplier (fine) amount
 √ 6) Global LFO to filter frequency amount
 √ 7) Global LFO to delay time amount
 */

import SwiftUI

struct GlobLFOView: View {
    // Connect to the global parameter manager
    @ObservedObject private var paramManager = AudioParameterManager.shared
    
    var body: some View {
        Group {
            // Row 1 - Global LFO Waveform (sine, triangle, square, sawtooth, reverse sawtooth)
            ParameterRow(
                label: "GLOBAL LFO WAVEFORM",
                value: Binding(
                    get: { paramManager.master.globalLFO.waveform },
                    set: { newValue in
                        paramManager.updateGlobalLFOWaveform(newValue)
                    }
                ),
                displayText: { waveform in
                    switch waveform {
                    case .sine: return "SINE"
                    case .triangle: return "TRIANGLE"
                    case .square: return "SQUARE"
                    case .sawtooth: return "SAWTOOTH"
                    case .reverseSawtooth: return "REV SAW"
                    }
                }
            )
            
            // Row 2 - Global LFO Reset Mode (free, sync)
            // Note: Global LFO doesn't have "trigger" mode (no per-note triggering)
            ParameterRow(
                label: "GLOBAL LFO MODE",
                value: Binding(
                    get: { paramManager.master.globalLFO.resetMode },
                    set: { newValue in
                        paramManager.updateGlobalLFOResetMode(newValue)
                    }
                ),
                displayText: { mode in
                    switch mode {
                    case .free: return "FREE"
                    case .trigger: return "N/A"  // Not available for global LFO
                    case .sync: return "SYNC"
                    }
                }
            )
            
            // Row 3 - Global LFO Frequency (0.01-20 Hz)
            SliderRow(
                label: "GLOBAL LFO FREQUENCY",
                value: Binding(
                    get: { paramManager.master.globalLFO.frequency },
                    set: { newValue in
                        paramManager.updateGlobalLFOFrequency(newValue)
                    }
                ),
                range: 0.01...20,
                step: 0.01,
                displayFormatter: { String(format: "%.2f Hz", $0) }
            )
            
            // Row 4 - Global LFO to Oscillator Amplitude (tremolo)
            SliderRow(
                label: "GLOB LFO → OSC AMP",
                value: Binding(
                    get: { paramManager.master.globalLFO.amountToOscillatorAmplitude },
                    set: { newValue in
                        paramManager.updateGlobalLFOAmountToAmplitude(newValue)
                    }
                ),
                range: -1...1,
                step: 0.01,
                displayFormatter: { value in
                    return value > 0 ? String(format: "+%.2f", value) : String(format: "%.2f", value)
                }
            )
            
            // Row 5 - Global LFO to Modulator Multiplier (FM ratio modulation)
            SliderRow(
                label: "GLOB LFO → MOD MULT",
                value: Binding(
                    get: { paramManager.master.globalLFO.amountToModulatorMultiplier },
                    set: { newValue in
                        paramManager.updateGlobalLFOAmountToModulatorMultiplier(newValue)
                    }
                ),
                range: -2...2,
                step: 0.01,
                displayFormatter: { value in
                    return value > 0 ? String(format: "+%.2f", value) : String(format: "%.2f", value)
                }
            )
            
            // Row 6 - Global LFO to Filter Frequency
            SliderRow(
                label: "GLOB LFO → FILTER",
                value: Binding(
                    get: { paramManager.master.globalLFO.amountToFilterFrequency },
                    set: { newValue in
                        paramManager.updateGlobalLFOAmountToFilter(newValue)
                    }
                ),
                range: -2...2,
                step: 0.01,
                displayFormatter: { value in
                    return value > 0 ? String(format: "+%.2f oct", value) : String(format: "%.2f oct", value)
                }
            )
            
            // Row 7 - Global LFO to Delay Time
            SliderRow(
                label: "GLOB LFO → DELAY TIME",
                value: Binding(
                    get: { paramManager.master.globalLFO.amountToDelayTime },
                    set: { newValue in
                        paramManager.updateGlobalLFOAmountToDelayTime(newValue)
                    }
                ),
                range: -0.5...0.5,
                step: 0.01,
                displayFormatter: { value in
                    return value > 0 ? String(format: "+%.2f s", value) : String(format: "%.2f s", value)
                }
            )
        }
    }
}

#Preview {
    ZStack {
        Color("BackgroundColour").ignoresSafeArea()
        VStack {
            GlobLFOView()
        }
        .padding(25)
    }
}

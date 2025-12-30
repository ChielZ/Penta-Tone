//
//  V4-S07 ParameterPage7View.swift
//  Pentatone
//
//  Created by Chiel Zwinkels on 25/12/2025.
// SUBVIEW 7 - VOICE LFO

/*
PAGE 7 - VOICE LFO
1) Voice LFO waveform (sine, triangle, square, sawtooth, reversed sawtooth)
2) Voice LFO reset mode (free, trigger, sync)
3) Voice LFO frequency (0-10 Hz or tempo multipliers depending on mode)
4) Voice LFO destination (Oscillator baseFrequency [default], modulationIndex, modulatingMultiplier, Filter frequency, stereo spread offset amount)
5) Voice LFO amount (bipolar modulation, so only positive amounts)
*/

 
import SwiftUI

struct VoiceLFOView: View {
    // Connect to the global parameter manager
    @ObservedObject private var paramManager = AudioParameterManager.shared
    
    var body: some View {
        Group {
            // Row 3 - Voice LFO Waveform (sine, triangle, square, sawtooth, reverse sawtooth)
            ParameterRow(
                label: "VOICE LFO WAVEFORM",
                value: Binding(
                    get: { paramManager.voiceTemplate.modulation.voiceLFO.waveform },
                    set: { newValue in
                        paramManager.updateVoiceLFOWaveform(newValue)
                        applyModulationToAllVoices()
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
            
            // Row 4 - Voice LFO Reset Mode (free, trigger, sync)
            ParameterRow(
                label: "VOICE LFO RESET MODE",
                value: Binding(
                    get: { paramManager.voiceTemplate.modulation.voiceLFO.resetMode },
                    set: { newValue in
                        paramManager.updateVoiceLFOResetMode(newValue)
                        applyModulationToAllVoices()
                    }
                ),
                displayText: { mode in
                    switch mode {
                    case .free: return "FREE"
                    case .trigger: return "TRIGGER"
                    case .sync: return "SYNC"
                    }
                }
            )
            
            // Row 5 - Voice LFO Frequency (0-10 Hz)
            // Note: For tempo sync mode, this would need different handling
            // For now, implementing as Hz mode (0.01-10 Hz)
            SliderRow(
                label: "VOICE LFO FREQUENCY",
                value: Binding(
                    get: { paramManager.voiceTemplate.modulation.voiceLFO.frequency },
                    set: { newValue in
                        paramManager.updateVoiceLFOFrequency(newValue)
                        applyModulationToAllVoices()
                    }
                ),
                range: 0.01...10,
                step: 0.01,
                displayFormatter: { value in
                    String(format: "%.2f Hz", value)
                }
            )
            
            // Row 6 - Voice LFO Destination
            ParameterRow(
                label: "VOICE LFO DESTINATION",
                value: Binding(
                    get: { paramManager.voiceTemplate.modulation.voiceLFO.destination },
                    set: { newValue in
                        paramManager.updateVoiceLFODestination(newValue)
                        applyModulationToAllVoices()
                    }
                ),
                displayText: { destination in
                    // Shortened names to fit in UI
                    switch destination {
                    case .oscillatorAmplitude: return "OSC AMP"
                    case .oscillatorBaseFrequency: return "OSC FREQ"
                    case .modulationIndex: return "MOD IDX"
                    case .modulatingMultiplier: return "MOD MULT"
                    case .filterCutoff: return "FILTER"
                    case .stereoSpreadAmount: return "SPREAD"
                    case .voiceLFOFrequency: return "LFO RATE"
                    case .voiceLFOAmount: return "LFO DEPTH"
                    case .delayTime: return "DLY TIME"
                    case .delayMix: return "DLY MIX"
                    }
                }
            )
            
            // Row 7 - Voice LFO Amount (0-1, bipolar modulation but positive amount)
            SliderRow(
                label: "VOICE LFO AMOUNT",
                value: Binding(
                    get: { paramManager.voiceTemplate.modulation.voiceLFO.amount },
                    set: { newValue in
                        paramManager.updateVoiceLFOAmount(newValue)
                        applyModulationToAllVoices()
                    }
                ),
                range: 0...1,
                step: 0.01,
                displayFormatter: { String(format: "%.2f", $0) }
            )
            
            // Row 8 - Empty (for UI consistency)
            ZStack {
                RoundedRectangle(cornerRadius: radius)
                    .fill(Color("BackgroundColour"))
            }
            
            // Row 9 - Empty (for UI consistency)
            ZStack {
                RoundedRectangle(cornerRadius: radius)
                    .fill(Color("BackgroundColour"))
            }
        }
    }
    
    // MARK: - Helper Functions
    
    /// Applies current modulation parameters to all active voices
    private func applyModulationToAllVoices() {
        let modulationParams = paramManager.voiceTemplate.modulation
        
        // Apply to all voices in the pool
        // Note: This requires the voicePool to have an update method
        // For now, this is a placeholder - the actual implementation
        // will depend on how the voice pool exposes modulation updates
        for voice in voicePool.voices {
            voice.updateModulationParameters(modulationParams)
        }
    }
}

#Preview {
    ZStack {
        Color("BackgroundColour").ignoresSafeArea()
        VStack {
            VoiceLFOView()
        }
        .padding(25)
    }
}

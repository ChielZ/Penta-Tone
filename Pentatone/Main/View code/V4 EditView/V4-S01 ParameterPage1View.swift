//
//  V4-S01 ParameterPage1View.swift
//  Pentatone
//
//  Created by Chiel Zwinkels on 25/12/2025.
// SUBVIEW 1 - VOICE OSCILLATORS

/*
 PAGE 1 - VOICE OSCILLATORS
 1) Oscillator Waveform. LIST. Values: sine, triangle, square
 2) Carrier multiplier. SLIDER. Values: integers only, range 1-16
 3) Modulator multiplier coarse. SLIDER. Values: integers only, range 1-16
 4) Modulator multiplier fine. SLIDER. Values: 0-1 continuous
 5) Modulator base level. SLIDER. Values: 0-1 continuous
 6) Stereo offset mode. LIST. Values: constant, proportional
 7) Stereo offset amount. SLIDER. Values: 0-4 continuous for constant offset mode, 1.0000-1.0100 continuous for proportional offset mode
 */

import SwiftUI

struct OscillatorView: View {
    var body: some View {
        Group {
            ZStack { // Row 3
                RoundedRectangle(cornerRadius: radius)
                    .fill(Color("BackgroundColour"))
                Text("WAVEFORM")
                        .foregroundColor(Color("HighlightColour"))
            }
            ZStack { // Row 4
                RoundedRectangle(cornerRadius: radius)
                    .fill(Color("BackgroundColour"))
                Text("CARRIER MULTIPLIER")
                        .foregroundColor(Color("HighlightColour"))
            }
            ZStack { // Row 6
                RoundedRectangle(cornerRadius: radius)
                    .fill(Color("BackgroundColour"))
                Text("MODULATOR MULTIPLIER COARSE")
                        .foregroundColor(Color("HighlightColour"))
            }
            ZStack { // Row 6
                RoundedRectangle(cornerRadius: radius)
                    .fill(Color("BackgroundColour"))
                Text("MODULATOR MULTIPLIER FINE")
                        .foregroundColor(Color("HighlightColour"))
            }
            
            ZStack { // Row 7
                RoundedRectangle(cornerRadius: radius)
                    .fill(Color("BackgroundColour"))
                Text("MODULATOR BASE LEVEL")
                        .foregroundColor(Color("HighlightColour"))
            }
            ZStack { // Row 8
                RoundedRectangle(cornerRadius: radius)
                    .fill(Color("BackgroundColour"))
                Text("STEREO OFFSET MODE")
                        .foregroundColor(Color("HighlightColour"))
            }
            ZStack { // Row 9
                RoundedRectangle(cornerRadius: radius)
                    .fill(Color("BackgroundColour"))
                Text("STEREO OFFSET AMOUNT")
                        .foregroundColor(Color("HighlightColour"))
            }
        }
    }
}

#Preview {
    ZStack {
        Color("BackgroundColour").ignoresSafeArea()
        VStack {
            OscillatorView()
        }
        .padding(25)
    }
}

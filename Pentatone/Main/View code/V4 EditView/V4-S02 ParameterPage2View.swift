//
//  V4-S02 ParameterPage2View.swift
//  Pentatone
//
//  Created by Chiel Zwinkels on 25/12/2025.
// SUBVIEW 2 - VOICE CONTOUR

/*
 PAGE 2 - VOICE CONTOUR
 1) Amp Envelope Attack time. SLIDER. Values: 0-5 continuous
 2) Amp Envelope Decay time. SLIDER. Values: 0-5 continuous
 3) Amp Envelope Sustain level. SLIDER. Values: 0-1 continuous
 4) Amp Envelope Release time. SLIDER. Values: 0-5 continuous
 5) Lowpass Filter Cutoff frequency. SLIDER. Values: 20 - 20000 continuous << needs logarithmic scaling
 6) Lowpass Filter Resonance. SLIDER. Values: 0-2 continuous
 7) Lowpass Filter Saturation. SLIDER. Values: 0-10 continuous
 */

import SwiftUI

struct ContourView: View {
    var body: some View {
        Group {
            ZStack { // Row 3
                RoundedRectangle(cornerRadius: radius)
                    .fill(Color("BackgroundColour"))
                Text("AMP ENVELOPE ATTACK")
                        .foregroundColor(Color("HighlightColour"))
            }
            ZStack { // Row 4
                RoundedRectangle(cornerRadius: radius)
                    .fill(Color("BackgroundColour"))
                Text("AMP ENVELOPE DECAY")
                        .foregroundColor(Color("HighlightColour"))
            }
            ZStack { // Row 6
                RoundedRectangle(cornerRadius: radius)
                    .fill(Color("BackgroundColour"))
                Text("AMP ENVELOPE SUSTAIN")
                        .foregroundColor(Color("HighlightColour"))
            }
            ZStack { // Row 6
                RoundedRectangle(cornerRadius: radius)
                    .fill(Color("BackgroundColour"))
                Text("AMP ENVELOPE RELEASE")
                        .foregroundColor(Color("HighlightColour"))
            }
            
            ZStack { // Row 7
                RoundedRectangle(cornerRadius: radius)
                    .fill(Color("BackgroundColour"))
                Text("FILTER CUTOFF")
                        .foregroundColor(Color("HighlightColour"))
            }
            ZStack { // Row 8
                RoundedRectangle(cornerRadius: radius)
                    .fill(Color("BackgroundColour"))
                Text("FILTER RESONANCE")
                        .foregroundColor(Color("HighlightColour"))
            }
            ZStack { // Row 9
                RoundedRectangle(cornerRadius: radius)
                    .fill(Color("BackgroundColour"))
                Text("FILTER SATURATION")
                        .foregroundColor(Color("HighlightColour"))
            }
        }
    }
}

#Preview {
    ZStack {
        Color("BackgroundColour").ignoresSafeArea()
        VStack {
            ContourView()
        }
        .padding(25)
    }
}

//
//  V4-S04 ParameterPage4View.swift
//  Pentatone
//
//  Created by Chiel Zwinkels on 25/12/2025.
// SUBVIEW 4 - GLOBAL

/*
PAGE 4 - GLOBAL
 1) Tempo. SLIDER. Values: 30-240, integers only
 2) Voice mode. LIST. Values: Poly, Mono
 3) Octave offset. SLIDER. Values: -2 to +2, integers only
 4) Semitone offset. SLIDER. Values: -7 to +7, integers only
 5) Fine tune. SLIDER. Values: -50 to +50, integers only
 6) Pre volume (voice mixer volume). SLIDER. Values: 0-1 continuous
 7) Post volume (output mixer volume). SLIDER. Values: 0-1 continuous
 */

import SwiftUI

struct GlobalView: View {
    var body: some View {
        Group {
            ZStack { // Row 3
                RoundedRectangle(cornerRadius: radius)
                    .fill(Color("BackgroundColour"))
                Text("TEMPO")
                        .foregroundColor(Color("HighlightColour"))
            }
            ZStack { // Row 4
                RoundedRectangle(cornerRadius: radius)
                    .fill(Color("BackgroundColour"))
                Text("POLYPHONY")
                        .foregroundColor(Color("HighlightColour"))
            }
            ZStack { // Row 6
                RoundedRectangle(cornerRadius: radius)
                    .fill(Color("BackgroundColour"))
                Text("ROOT FREQUENCY")
                        .foregroundColor(Color("HighlightColour"))
            }
            ZStack { // Row 6
                RoundedRectangle(cornerRadius: radius)
                    .fill(Color("BackgroundColour"))
                Text("ROOT OCTAVE")
                        .foregroundColor(Color("HighlightColour"))
            }
            
            ZStack { // Row 7
                RoundedRectangle(cornerRadius: radius)
                    .fill(Color("BackgroundColour"))
                Text("FINE TUNE")
                        .foregroundColor(Color("HighlightColour"))
            }
            ZStack { // Row 8
                RoundedRectangle(cornerRadius: radius)
                    .fill(Color("BackgroundColour"))
                Text("PRE VOLUME")
                        .foregroundColor(Color("HighlightColour"))
            }
            ZStack { // Row 9
                RoundedRectangle(cornerRadius: radius)
                    .fill(Color("BackgroundColour"))
                Text("POST VOLUME")
                        .foregroundColor(Color("HighlightColour"))
            }
        }
    }
}

#Preview {
    ZStack {
        Color("BackgroundColour").ignoresSafeArea()
        VStack {
            GlobalView()
        }
        .padding(25)
    }
}

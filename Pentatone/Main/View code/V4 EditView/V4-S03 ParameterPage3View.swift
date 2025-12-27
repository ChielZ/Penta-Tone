//
//  V4-S03 ParameterPage3View.swift
//  Pentatone
//
//  Created by Chiel Zwinkels on 25/12/2025.
// SUBVIEW 3 - EFFECTS

/*
 PAGE 3 - EFFECTS
 1) Delay time. LIST. Values: 1/32, 1/24, 1/16, 3/32, 1/8, 3/16, 1/4
 2) Delay feedback. SLIDER. Values: 0-1 continuous
 3) Delay PingPong. LIST. Values: on, off
 4) Delay mix. SLIDER. Values: 0-1 continuous
 5) Reverb size. SLIDER. Values: 0-1 continuous
 6) Reverb tone. SLIDER. Values: 0-1 continuous
 7) Reverb mix. SLIDER. Values: 0-1 continuous
 */

import SwiftUI

struct EffectsView: View {
    var body: some View {
        Group {
            ZStack { // Row 3
                RoundedRectangle(cornerRadius: radius)
                    .fill(Color("BackgroundColour"))
                Text("DELAY TIME")
                        .foregroundColor(Color("HighlightColour"))
            }
            ZStack { // Row 4
                RoundedRectangle(cornerRadius: radius)
                    .fill(Color("BackgroundColour"))
                Text("DELAT FEEDBACK")
                        .foregroundColor(Color("HighlightColour"))
            }
            ZStack { // Row 6
                RoundedRectangle(cornerRadius: radius)
                    .fill(Color("BackgroundColour"))
                Text("DELAY PING PONG")
                        .foregroundColor(Color("HighlightColour"))
            }
            ZStack { // Row 6
                RoundedRectangle(cornerRadius: radius)
                    .fill(Color("BackgroundColour"))
                Text("DELAY MIX")
                        .foregroundColor(Color("HighlightColour"))
            }
            
            ZStack { // Row 7
                RoundedRectangle(cornerRadius: radius)
                    .fill(Color("BackgroundColour"))
                Text("REVERB SIZE")
                        .foregroundColor(Color("HighlightColour"))
            }
            ZStack { // Row 8
                RoundedRectangle(cornerRadius: radius)
                    .fill(Color("BackgroundColour"))
                Text("REVERB TONE")
                        .foregroundColor(Color("HighlightColour"))
            }
            ZStack { // Row 9
                RoundedRectangle(cornerRadius: radius)
                    .fill(Color("BackgroundColour"))
                Text("REVERB MIX")
                        .foregroundColor(Color("HighlightColour"))
            }
        }
    }
}

#Preview {
    ZStack {
        Color("BackgroundColour").ignoresSafeArea()
        VStack {
            EffectsView()
        }
        .padding(25)
    }
}

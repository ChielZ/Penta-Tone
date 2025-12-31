//
//  V4-S09 ParameterPage9View.swift
//  Pentatone
//
//  Created by Chiel Zwinkels on 25/12/2025.
// SUBVIEW 9 - TOUCH RESPONSE

/*

PAGE 9 - TOUCH RESPONSE
1) Initial touch to oscillator amplitude amount
2) Initial touch to mod envelope amount
3) Initial touch to aux envelope pitch amount
4) Initial touch to aux envelope cutoff amount
5) Aftertouch to filter frequency amount
6) Aftertouch to modulator level amount
7) Aftertouch to vibrato (voice lfo >> oscillator pitch) amount
*/

/*
 import SwiftUI

 struct TouchView: View {
     var body: some View {
         Group {
             ZStack { // Row 3
                 RoundedRectangle(cornerRadius: radius)
                     .fill(Color("BackgroundColour"))
                 Text("I.T. TO AMP")
                     .foregroundColor(Color("HighlightColour"))
                     .adaptiveFont("Futura", size: 30)
             }
             ZStack { // Row 4
                 RoundedRectangle(cornerRadius: radius)
                     .fill(Color("BackgroundColour"))
                 Text("I.T. TO MOD ENV")
                     .foregroundColor(Color("HighlightColour"))
                     .adaptiveFont("Futura", size: 30)
             }
             ZStack { // Row 5
                 RoundedRectangle(cornerRadius: radius)
                     .fill(Color("BackgroundColour"))
                 Text("I.T. TO AUX ENV PITCH")
                     .foregroundColor(Color("HighlightColour"))
                     .adaptiveFont("Futura", size: 30)
             }
             
             ZStack { // Row 6
                 RoundedRectangle(cornerRadius: radius)
                     .fill(Color("BackgroundColour"))
                 Text("I.T. TO AUX ENV FILTER")
                     .foregroundColor(Color("HighlightColour"))
                     .adaptiveFont("Futura", size: 30)
            }
             
             ZStack { // Row 7
                 RoundedRectangle(cornerRadius: radius)
                     .fill(Color("BackgroundColour"))
                 Text("A.T. TO FILTER")
                     .foregroundColor(Color("HighlightColour"))
                     .adaptiveFont("Futura", size: 30)

               }
             ZStack { // Row 8
                 RoundedRectangle(cornerRadius: radius)
                     .fill(Color("BackgroundColour"))
                 Text("A.T. TO MOD LEVEL")
                     .foregroundColor(Color("HighlightColour"))
                     .adaptiveFont("Futura", size: 30)

              }
             ZStack { // Row 9
                 RoundedRectangle(cornerRadius: radius)
                     .fill(Color("BackgroundColour"))
                 Text("A.T. TO VIBRATO")
                     .foregroundColor(Color("HighlightColour"))
                     .adaptiveFont("Futura", size: 30)

             }
         }
     }
 }

 #Preview {
     ZStack {
         Color("BackgroundColour").ignoresSafeArea()
         VStack {
             TouchView()
         }
         .padding(25)
     }
 }

 */

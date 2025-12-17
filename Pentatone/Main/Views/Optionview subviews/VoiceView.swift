//
//  VoiceView.swift
//  Penta-Tone
//
//  Created by Chiel Zwinkels on 06/12/2025.
//

import SwiftUI

struct VoiceView: View {
    var body: some View {
        Group {
            ZStack { // Row 3
                RoundedRectangle(cornerRadius: radius)
                    .fill(Color("BackgroundColour"))
                HStack {
                    RoundedRectangle(cornerRadius: radius)
                        .fill(Color("SupportColour"))
                        .aspectRatio(1.0, contentMode: .fit)
                        .overlay(
                            Text("<")
                                .foregroundColor(Color("BackgroundColour"))
                                .adaptiveFont("Futura", size: 30)
                        )
                    Spacer()
                    Text("TUNE: 0 CT")
                        .foregroundColor(Color("HighlightColour"))
                        .adaptiveFont("Futura", size: 30)
                    Spacer()
                    RoundedRectangle(cornerRadius: radius)
                        .fill(Color("SupportColour"))
                        .aspectRatio(1.0, contentMode: .fit)
                        .overlay(
                            Text(">")
                                .foregroundColor(Color("BackgroundColour"))
                                .adaptiveFont("Futura", size: 30)
                        )
                }
            }
            ZStack { // Row 4
                RoundedRectangle(cornerRadius: radius)
                    .fill(Color("BackgroundColour"))
                HStack {
                    
                }
            }
            ZStack { // Row 5
                RoundedRectangle(cornerRadius: radius)
                    .fill(Color("BackgroundColour"))
                HStack {
                    
                }
            }
            ZStack { // Row 6
                RoundedRectangle(cornerRadius: radius)
                    .fill(Color("BackgroundColour"))
                HStack {
                    
                }
            }
            ZStack { // Row 7
                RoundedRectangle(cornerRadius: radius)
                    .fill(Color("BackgroundColour"))
                HStack {
                    
                }
            }
            ZStack { // Row 8
                RoundedRectangle(cornerRadius: radius)
                    .fill(Color("BackgroundColour"))
                HStack {
                    RoundedRectangle(cornerRadius: radius)
                        .fill(Color("SupportColour"))
                        .aspectRatio(1.0, contentMode: .fit)
                        .overlay(
                            Text("<")
                                .foregroundColor(Color("BackgroundColour"))
                                .adaptiveFont("Futura", size: 30)
                        )
                    Spacer()
                    Text("POLY")
                        .foregroundColor(Color("HighlightColour"))
                        .adaptiveFont("Futura", size: 30)
                    Spacer()
                    RoundedRectangle(cornerRadius: radius)
                        .fill(Color("SupportColour"))
                        .aspectRatio(1.0, contentMode: .fit)
                        .overlay(
                            Text(">")
                                .foregroundColor(Color("BackgroundColour"))
                                .adaptiveFont("Futura", size: 30)
                        )
                }
            }
            ZStack { // Row 9
                RoundedRectangle(cornerRadius: radius)
                    .fill(Color("BackgroundColour"))
                HStack {
                    RoundedRectangle(cornerRadius: radius)
                        .fill(Color("SupportColour"))
                        .aspectRatio(1.0, contentMode: .fit)
                        .overlay(
                            Text("<")
                                .foregroundColor(Color("BackgroundColour"))
                                .adaptiveFont("Futura", size: 30)
                        )
                    Spacer()
                    Text("TENOR")
                        .foregroundColor(Color("HighlightColour"))
                        .adaptiveFont("Futura", size: 30)
                    Spacer()
                    RoundedRectangle(cornerRadius: radius)
                        .fill(Color("SupportColour"))
                        .aspectRatio(1.0, contentMode: .fit)
                        .overlay(
                            Text(">")
                                .foregroundColor(Color("BackgroundColour"))
                                .adaptiveFont("Futura", size: 30)
                        )
                }
            }
        }
    }
}

#Preview {
    ZStack {
        Color("BackgroundColour").ignoresSafeArea()
        VStack {
            VoiceView()
        }
        .padding(25)
    }
}

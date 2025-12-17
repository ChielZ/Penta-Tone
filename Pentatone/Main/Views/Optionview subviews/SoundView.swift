//
//  SoundView.swift
//  Penta-Tone
//
//  Created by Chiel Zwinkels on 06/12/2025.
//

import SwiftUI

// MARK: - Adaptive Font Modifier
struct AdaptiveFontSound: ViewModifier {
    @Environment(\.horizontalSizeClass) var horizontalSizeClass
    @Environment(\.verticalSizeClass) var verticalSizeClass
    
    let fontName: String
    let baseSize: CGFloat
    
    var adaptiveSize: CGFloat {
        // Regular width and height = iPad in any orientation
        if horizontalSizeClass == .regular && verticalSizeClass == .regular {
            return baseSize
        } else if horizontalSizeClass == .regular {
            // iPhone Plus/Max in landscape
            return baseSize * 0.75
        } else {
            // iPhone in portrait (compact width)
            return baseSize * 0.65
        }
    }
    
    func body(content: Content) -> some View {
        content
            .font(.custom(fontName, size: adaptiveSize))
    }
}

extension View {
    func adaptiveFontSound(_ name: String, size: CGFloat) -> some View {
        modifier(AdaptiveFontSound(fontName: name, baseSize: size))
    }
}

struct SoundView: View {
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
                                .adaptiveFontSound("Futura", size: 30)
                        )
                    Spacer()
                    Text("KEYS")
                        .foregroundColor(Color("HighlightColour"))
                        .adaptiveFontSound("Futura", size: 30)
                    Spacer()
                    RoundedRectangle(cornerRadius: radius)
                        .fill(Color("SupportColour"))
                        .aspectRatio(1.0, contentMode: .fit)
                        .overlay(
                            Text(">")
                                .foregroundColor(Color("BackgroundColour"))
                                .adaptiveFontSound("Futura", size: 30)
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
                    .fill(Color("HighlightColour"))
                RoundedRectangle(cornerRadius: radius)
                    .fill(Color("SupportColour"))
                    .padding(4)
                Text("VOLUME")
                    .foregroundColor(Color("BackgroundColour"))
                    .adaptiveFontSound("Futura", size: 30)
            }
            ZStack { // Row 6
                RoundedRectangle(cornerRadius: radius)
                    .fill(Color("HighlightColour"))
                RoundedRectangle(cornerRadius: radius)
                    .fill(Color("SupportColour"))
                    .padding(4)
                Text("TONE")
                    .foregroundColor(Color("BackgroundColour"))
                    .adaptiveFontSound("Futura", size: 30)
            }
            ZStack { // Row 7
                RoundedRectangle(cornerRadius: radius)
                    .fill(Color("HighlightColour"))
                RoundedRectangle(cornerRadius: radius)
                    .fill(Color("SupportColour"))
                    .padding(4)
                Text("SUSTAIN")
                    .foregroundColor(Color("BackgroundColour"))
                    .adaptiveFontSound("Futura", size: 30)
            }
            ZStack { // Row 8
                RoundedRectangle(cornerRadius: radius)
                    .fill(Color("HighlightColour"))
                RoundedRectangle(cornerRadius: radius)
                    .fill(Color("SupportColour"))
                    .padding(4)
                Text("MODULATION")
                    .foregroundColor(Color("BackgroundColour"))
                    .adaptiveFontSound("Futura", size: 30)
            }
            ZStack { // Row 9
                RoundedRectangle(cornerRadius: radius)
                    .fill(Color("BackgroundColour"))
                RoundedRectangle(cornerRadius: radius)
                    .fill(Color("HighlightColour"))
                RoundedRectangle(cornerRadius: radius)
                    .fill(Color("SupportColour"))
                    .padding(4)
                Text("AMBIENCE")
                    .foregroundColor(Color("BackgroundColour"))
                    .adaptiveFontSound("Futura", size: 30)
            }
        }
    }
}

#Preview {
    ZStack {
        Color("BackgroundColour").ignoresSafeArea()
        VStack {
            SoundView()
        }
        .padding(25)
    }
}

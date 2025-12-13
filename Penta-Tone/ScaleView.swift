//
//  ScaleView.swift
//  Penta-Tone
//
//  Created by Chiel Zwinkels on 06/12/2025.
//

import SwiftUI

struct ScaleView: View {
    // Current scale and navigation callbacks
    var currentScale: Scale = ScalesCatalog.centerMeridian_JI
    var onCycleIntonation: ((Bool) -> Void)? = nil
    var onCycleCelestial: ((Bool) -> Void)? = nil
    var onCycleTerrestrial: ((Bool) -> Void)? = nil
    
    var body: some View {
        Group {
            ZStack { // Row 3 - Intonation
                RoundedRectangle(cornerRadius: radius)
                    .fill(Color("BackgroundColour"))
                HStack {
                    RoundedRectangle(cornerRadius: radius)
                        .fill(Color("SupportColour"))
                        .aspectRatio(1.0, contentMode: .fit)
                        .overlay(
                            Text("<")
                                .foregroundColor(Color("BackgroundColour"))
                                .font(.custom("Futura",size:30))
                                .frame(width:40,height:20,alignment:.center)
                        )
                        .contentShape(Rectangle())
                        .onTapGesture {
                            onCycleIntonation?(false)
                        }
                    Spacer()
                    Text(currentScale.intonation.rawValue)
                        .foregroundColor(Color("HighlightColour"))
                        .font(.custom("Futura",size:30))
                        .frame(width:200,height:20,alignment:.center)
                    Spacer()
                    RoundedRectangle(cornerRadius: radius)
                        .fill(Color("SupportColour"))
                        .aspectRatio(1.0, contentMode: .fit)
                        .overlay(
                            Text(">")
                                .foregroundColor(Color("BackgroundColour"))
                                .font(.custom("Futura",size:30))
                                .frame(width:40,height:20,alignment:.center)
                        )
                        .contentShape(Rectangle())
                        .onTapGesture {
                            onCycleIntonation?(true)
                        }
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
                    RoundedRectangle(cornerRadius: radius)
                        .fill(Color("SupportColour"))
                        .aspectRatio(1.0, contentMode: .fit)
                        .overlay(
                            Text("<")
                                .foregroundColor(Color("BackgroundColour"))
                                .font(.custom("Futura",size:30))
                                .frame(width:40,height:20,alignment:.center)
                        )
                    Spacer()
                    Text("D")
                        .foregroundColor(Color("HighlightColour"))
                        .font(.custom("Futura",size:30))
                        .frame(width:200,height:20,alignment:.center)
                    Spacer()
                    RoundedRectangle(cornerRadius: radius)
                        .fill(Color("SupportColour"))
                        .aspectRatio(1.0, contentMode: .fit)
                        .overlay(
                            Text(">")
                                .foregroundColor(Color("BackgroundColour"))
                                .font(.custom("Futura",size:30))
                                .frame(width:40,height:20,alignment:.center)
                        )
                }
            }
            ZStack { // Row 7 - Celestial
                RoundedRectangle(cornerRadius: radius)
                    .fill(Color("BackgroundColour"))
                HStack {
                    RoundedRectangle(cornerRadius: radius)
                        .fill(Color("SupportColour"))
                        .aspectRatio(1.0, contentMode: .fit)
                        .overlay(
                            Text("<")
                                .foregroundColor(Color("BackgroundColour"))
                                .font(.custom("Futura",size:30))
                                .frame(width:40,height:20,alignment:.center)
                        )
                        .contentShape(Rectangle())
                        .onTapGesture {
                            onCycleCelestial?(false)
                        }
                    Spacer()
                    Text(currentScale.celestial.rawValue)
                        .foregroundColor(Color("HighlightColour"))
                        .font(.custom("Futura",size:30))
                        .frame(width:200,height:20,alignment:.center)
                    Spacer()
                    RoundedRectangle(cornerRadius: radius)
                        .fill(Color("SupportColour"))
                        .aspectRatio(1.0, contentMode: .fit)
                        .overlay(
                            Text(">")
                                .foregroundColor(Color("BackgroundColour"))
                                .font(.custom("Futura",size:30))
                                .frame(width:40,height:20,alignment:.center)
                        )
                        .contentShape(Rectangle())
                        .onTapGesture {
                            onCycleCelestial?(true)
                        }
                }
            }
            ZStack { // Row 8 - Terrestrial
                RoundedRectangle(cornerRadius: radius)
                    .fill(Color("BackgroundColour"))
                HStack {
                    RoundedRectangle(cornerRadius: radius)
                        .fill(Color("SupportColour"))
                        .aspectRatio(1.0, contentMode: .fit)
                        .overlay(
                            Text("<")
                                .foregroundColor(Color("BackgroundColour"))
                                .font(.custom("Futura",size:30))
                                .frame(width:40,height:20,alignment:.center)
                        )
                        .contentShape(Rectangle())
                        .onTapGesture {
                            onCycleTerrestrial?(false)
                        }
                    Spacer()
                    Text(currentScale.terrestrial.rawValue)
                        .foregroundColor(Color("HighlightColour"))
                        .font(.custom("Futura",size:30))
                        .frame(width:200,height:20,alignment:.center)
                    Spacer()
                    RoundedRectangle(cornerRadius: radius)
                        .fill(Color("SupportColour"))
                        .aspectRatio(1.0, contentMode: .fit)
                        .overlay(
                            Text(">")
                                .foregroundColor(Color("BackgroundColour"))
                                .font(.custom("Futura",size:30))
                                .frame(width:40,height:20,alignment:.center)
                        )
                        .contentShape(Rectangle())
                        .onTapGesture {
                            onCycleTerrestrial?(true)
                        }
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
                                .font(.custom("Futura",size:30))
                                .frame(width:40,height:20,alignment:.center)
                        )
                    Spacer()
                    Text("0")
                        .foregroundColor(Color("HighlightColour"))
                        .font(.custom("Futura",size:30))
                        .frame(width:200,height:20,alignment:.center)
                    Spacer()
                    RoundedRectangle(cornerRadius: radius)
                        .fill(Color("SupportColour"))
                        .aspectRatio(1.0, contentMode: .fit)
                        .overlay(
                            Text(">")
                                .foregroundColor(Color("BackgroundColour"))
                                .font(.custom("Futura",size:30))
                                .frame(width:40,height:20,alignment:.center)
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
            ScaleView(
                currentScale: ScalesCatalog.centerMeridian_JI,
                onCycleIntonation: { _ in },
                onCycleCelestial: { _ in },
                onCycleTerrestrial: { _ in }
            )
        }
        .padding(25)
    }
}

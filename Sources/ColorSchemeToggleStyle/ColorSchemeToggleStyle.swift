//
//  ColorSchemeToggleStyle.swift
//  ColorSchemeToggleStyle
//
//  Created by Lidor Fadida on 29/06/2024.
//

import SwiftUI

public struct ColorSchemeToggleStyle: ToggleStyle {
    
    public func makeBody(configuration: Configuration) -> some View {
        HStack {
            configuration.label
            Spacer()
            switchContentView(configuration: configuration)
        }
    }
    
    private func switchContentView(configuration: Configuration) -> some View {
        GeometryReader { proxy in
            ZStack(alignment: .leading) {
                backgroundShape(proxy: proxy, isOn: configuration.isOn)
                
                starsShape(proxy: proxy, isOn: configuration.isOn)
                
                cloudsView(proxy: proxy, isOn: configuration.isOn)
                
                colorSchemeSwitch(proxy: proxy, configuration: configuration)
            }
            .overlay(
                switchContentViewOverlay(proxy: proxy, isOn: configuration.isOn)
            )
            .clipShape(
                RoundedRectangle(cornerRadius: proxy.size.height / 2.0)
            )
            .contentShape(
                RoundedRectangle(cornerRadius: proxy.size.height / 2.0)
            )
            .onTapGesture {
                configuration.isOn.toggle()
            }
        }
    }
    
    private func backgroundShape(proxy: GeometryProxy, isOn: Bool) -> some View {
        RoundedRectangle(cornerRadius: 0.0)
            .fill(
                isOn ? Color.darkBackgroundColor : Color.lightBackgroundColor
            )
            .frame(width: proxy.size.width, height: proxy.size.height)
            .animation(.spring, value: isOn)
    }
    
    private func starsShape(proxy: GeometryProxy, isOn: Bool) -> some View {
        StarsShape()
            .fill(.white)
            .frame(
                width: proxy.size.width * 0.7,
                height: proxy.size.height
            )
            .rotationEffect(isOn ? .zero : .degrees(90))
            .offset(y: isOn ? .zero :  -proxy.size.height * 1.5)
            .animation(.spring, value: isOn)
    }
    
    private func cloudsView(proxy: GeometryProxy, isOn: Bool) -> some View {
        ZStack {
            CloudShape()
                .fill(Color.white.opacity(0.4))
                .offset(x: -5.0, y: -2.0)
            CloudShape()
                .fill(Color.white)
                .offset(y: 5.0)
        }
        .offset(y: isOn ? proxy.size.height * 2.0 : .zero)
        .animation(.spring(duration: 0.3), value: isOn)
    }
    
    private func colorSchemeSwitch(proxy: GeometryProxy, configuration: Configuration) -> some View {
        ColorSchemeSwitchShape(isOn: configuration.isOn)
            .frame(
                width: proxy.size.height * 0.8,
                height: proxy.size.height * 0.8
            )
            .background(
                Circle()
                    .fill(Color.moonCutColor)
            )
            .offset(
                x: configuration.isOn ? (proxy.size.width - proxy.size.height * 0.9) : 4.0
            )
            .background(backgroundLayers(proxy: proxy, isOn: configuration.isOn))
            .foregroundStyle(
                configuration.isOn ?
                Color.moonColor.shadow(
                    .inner(
                        color: .white.opacity(0.2),
                        radius: 2
                    )
                ).shadow(
                    .drop(
                        color: .white.opacity(0.2),
                        radius: 2.0
                    )
                ) : Color.sunColor.shadow(
                    .inner(
                        color: .black.opacity(0.2),
                        radius: 1
                    )
                )
                .shadow(
                    .drop(
                        color: .sunColor.opacity(0.3),
                        radius: 2
                    )
                )
            )
            .animation(.spring, value: configuration.isOn)
            .gesture(
                TapGesture()
                    .onEnded {
                        configuration.isOn.toggle()
                    }
                    .exclusively(
                        before: DragGesture(minimumDistance: 0)
                            .onChanged {
                                value in
                                let isOn = value.location.x > proxy.size.width / 2.0
                                configuration.isOn = isOn
                            }
                    )
            )
    }

    private func backgroundLayers(proxy: GeometryProxy, isOn: Bool) -> some View {
        let numberOfBackgroundLayers: Range<Int> = (1..<4)
        
        return ForEach(numberOfBackgroundLayers, id: \.self) { layerPosition in
            Circle()
                .fill(Color.white.opacity(Double((layerPosition + 1)) * 0.02))
                .frame(
                    width: proxy.size.height + CGFloat(Double(layerPosition * 20)),
                    height: proxy.size.height + CGFloat(Double(layerPosition) * 20)
                )
                .offset(
                    x: isOn ? (proxy.size.width - proxy.size.height * 0.8) : 4
                )
        }
    }
    
    private func switchContentViewOverlay(proxy: GeometryProxy, isOn: Bool) -> some View {
        RoundedRectangle(cornerRadius: proxy.size.height / 2.0)
            .stroke(isOn ? .white : .gray,
                    lineWidth: 1)
            .shadow(color: .gray,
                    radius: .zero)
            .clipShape(
                RoundedRectangle(cornerRadius: proxy.size.height / 2.0)
            )
            .animation(.spring, value: isOn)
    }
}


public extension ToggleStyle where Self == ColorSchemeToggleStyle {
    static var colorSchemeToggleStyle: ColorSchemeToggleStyle { .init() }
}

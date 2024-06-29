//
//  ColorSchemeSwitchShape.swift
//  ColorSchemeToggleStyle
//
//  Created by Lidor Fadida on 29/06/2024.
//

import SwiftUI

struct ColorSchemeSwitchShape: Shape {
    let isOn: Bool
    
    func path(in rect: CGRect) -> Path {
        let size = CGSize(width: rect.height, height: rect.height)
        let rect = CGRect(
            origin: .zero,
            size: size
        )
        return isOn ? moonPath(rect: rect) : sunPath(rect: rect)
    }
    
    private func sunPath(rect: CGRect) -> Path {
        let path = UIBezierPath(ovalIn: rect)
        return Path(path.cgPath)
    }
    
    private func moonPath(rect: CGRect) -> Path {
        let mainPath = UIBezierPath(ovalIn: rect)
        
        let smallCutout = UIBezierPath(
            ovalIn: CGRect(
                x: rect.maxX * 0.4,
                y: rect.maxY * 0.1,
                width: rect.width * 0.2,
                height: rect.width * 0.2
            )
        )
        
        let mediumCutout = UIBezierPath(
            ovalIn: CGRect(
                x: rect.maxX * 0.6,
                y: rect.midY,
                width: rect.width * 0.25,
                height: rect.width * 0.25
            )
        )
        
        let largeCutout = UIBezierPath(
            ovalIn: CGRect(
                x: rect.maxX * 0.1,
                y: rect.maxY * 0.4,
                width: rect.width * 0.3,
                height: rect.width * 0.3
            )
        )

        let path = Path(mainPath.cgPath)
            .subtracting(Path(smallCutout.cgPath))
            .subtracting(Path(mediumCutout.cgPath))
            .subtracting(Path(largeCutout.cgPath))
        
        return path
    }
}

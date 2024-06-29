//
//  CloudShape.swift
//  ColorSchemeToggleStyle
//
//  Created by Lidor Fadida on 29/06/2024.
//

import SwiftUI

struct CloudShape: Shape {
    
    private struct CloudConfiguration {
        let center: CGPoint
        let radius: CGFloat
        let startAngle: Angle
        let endAngle: Angle
    }

    private func makeConfigurations(rect: CGRect) -> [CloudConfiguration] {
        return [
            CloudConfiguration(
                center: CGPoint(x: rect.width * 0.1, y: rect.height * 1.25),
                radius: rect.width * 0.2,
                startAngle: .degrees(0),
                endAngle: .degrees(360)
            ),
            CloudConfiguration(
                center: CGPoint(x: rect.width * 0.3, y: rect.height * 1.19),
                radius: rect.width * 0.2,
                startAngle: .degrees(0),
                endAngle: .degrees(360)
            ),
            CloudConfiguration(
                center: CGPoint(x: rect.width * 0.5, y: rect.height),
                radius: rect.width * 0.1,
                startAngle: .degrees(0),
                endAngle: .degrees(360)
            ),
            CloudConfiguration(
                center: CGPoint(x: rect.width * 0.7, y: rect.height),
                radius: rect.width * 0.15,
                startAngle: .degrees(0),
                endAngle: .degrees(360)
            ),
            CloudConfiguration(
                center: CGPoint(x: rect.width * 0.9, y: rect.height * 0.8),
                radius: rect.width * 0.15,
                startAngle: .degrees(180),
                endAngle: .degrees(0)
            ),
            CloudConfiguration(
                center: CGPoint(x: rect.width, y: rect.height * 0.45),
                radius: rect.width * 0.15,
                startAngle: .degrees(0),
                endAngle: .degrees(360)
            )
        ]
    }
    
    func path(in rect: CGRect) -> Path {
        var path = Path()
        
        let configurations = makeConfigurations(rect: rect)
        
        for config in configurations {
            path.addArc(
                center: config.center,
                radius: config.radius,
                startAngle: config.startAngle,
                endAngle: config.endAngle,
                clockwise: false
            )
        }
        
        path.addLine(to: CGPoint(x: rect.maxX, y: rect.maxY))
        path.addLine(to: CGPoint(x: rect.minX, y: rect.maxY))
        path.closeSubpath()
        
        return path
    }
}

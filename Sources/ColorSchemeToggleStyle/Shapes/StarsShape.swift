//
//  StarsShape.swift
//  ColorSchemeToggleStyle
//
//  Created by Lidor Fadida on 29/06/2024.
//

import SwiftUI

struct StarsShape: Shape {
    private struct StarConfiguration {
        let position: CGPoint
        let size: CGFloat
    }

    private func makeConfigurations(rect: CGRect) -> [StarConfiguration] {
        return [
            StarConfiguration(position: CGPoint(x: rect.width * 0.2, y: rect.height * 0.2), size: rect.height * 0.2),
            StarConfiguration(position: CGPoint(x: rect.width * 0.55, y: rect.height * 0.5), size: rect.height * 0.2),
            StarConfiguration(position: CGPoint(x: rect.width * 0.6, y: rect.height * 0.2), size: rect.height * 0.26),
            StarConfiguration(position: CGPoint(x: rect.width * 0.2, y: rect.height * 0.6), size: rect.height * 0.3),
            StarConfiguration(position: CGPoint(x: rect.width * 0.7, y: rect.height * 0.8), size: rect.height * 0.35)
        ]
    }
    
    private func star(in rect: CGRect) -> Path {
        let mainPath = UIBezierPath(rect: rect)
        
        let leftSideX = rect.minX - rect.width / 2
        let rightSideX = rect.maxX - rect.width / 2
        let topY = rect.minY - rect.width / 2
        let bottomY = rect.midY
        let circleSize = rect.width
        
        let topLeftCircle = makeCircle(x: leftSideX, y: topY, size: circleSize)
        let bottomLeftCircle = makeCircle(x: leftSideX, y: bottomY, size: circleSize)
        let topRightCircle = makeCircle(x: rightSideX, y: topY, size: circleSize)
        let bottomRightCircle = makeCircle(x: rightSideX, y: bottomY, size: circleSize)
        
        // Create a mutable path
        let combinedPath = CGMutablePath()
        combinedPath.addPath(mainPath.cgPath)
        
        let maskedCirclesPath = CGMutablePath()
        maskedCirclesPath.addPath(bottomLeftCircle.cgPath)
        maskedCirclesPath.addPath(bottomRightCircle.cgPath)
        maskedCirclesPath.addPath(topLeftCircle.cgPath)
        maskedCirclesPath.addPath(topRightCircle.cgPath)
        
        let path = Path(combinedPath)
            .subtracting(Path(maskedCirclesPath))
        
        return path
    }
    
    private func makeCircle(x: CGFloat, y: CGFloat, size: CGFloat) -> UIBezierPath {
        return UIBezierPath(
            ovalIn: CGRect(
                origin: CGPoint(x: x, y: y),
                size: CGSize(width: size, height: size)
            )
        )
    }
    
    func path(in rect: CGRect) -> Path {
        var path = Path()
        let configurations = makeConfigurations(rect: rect)
        
        for config in configurations {
            let starRect = CGRect(
                x: config.position.x - config.size / 2,
                y: config.position.y - config.size / 2,
                width: config.size,
                height: config.size
            )
            path.addPath(star(in: starRect))
        }
        
        return path
    }
}

//
//  File.swift
//  
//
//  Created by Chris J W Walker on 25/01/2023.
//

import SwiftUI

struct CenterCircle: View {
    var boxSize: Double
    
    var body: some View {
        let boxSizeHalf: Double = boxSize / 2
        Path { path in
            path.move(to: CGPoint(x: boxSizeHalf, y: boxSizeHalf))
            path.addArc(
                center: .init(x: boxSizeHalf, y: boxSizeHalf),
                radius: boxSizeHalf * 0.8,
                startAngle: Angle(degrees: 0.0),
                endAngle: Angle(degrees: 360.0),
                clockwise: false
            )
        }
        .fill(Color.Named.white.colour)
        .frame(width: boxSize, height: boxSize)
    }
}

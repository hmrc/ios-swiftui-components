//
//  File.swift
//  
//
//  Created by Chris J W Walker on 25/01/2023.
//

import SwiftUI

struct ArcView: View {
    var startAngle: Double
    var endAngle: Double
    var colour: Color
    var boxSize: Double
    
    var body: some View {
        let boxSizeHalf: Double = boxSize / 2
        
        Path { path in
            path.move(to: CGPoint(x: boxSizeHalf, y: boxSizeHalf))
            path.addArc(
                center: .init(x: boxSizeHalf, y: boxSizeHalf),
                radius: boxSizeHalf,
                startAngle: Angle(degrees: -90 + startAngle),
                endAngle: Angle(degrees: -90 + endAngle),
                clockwise: false
            )
        }
        .fill(colour)
        .frame(width: boxSize, height: boxSize)
    }
}

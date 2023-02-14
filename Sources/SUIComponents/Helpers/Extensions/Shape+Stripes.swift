//
//  File.swift
//  
//
//  Created by Chris J W Walker on 14/02/2023.
//

import SwiftUI

extension Shape {
    func stripes(angle: Double = 45, stripeColour: Color) -> AnyView {
        guard
            let stripePattern = CGImage.generateStripePattern(colors: (.clear, stripeColour.uiColor()))
        else { return AnyView(self)}

        return AnyView(Rectangle().fill(ImagePaint(
            image: Image(decorative: stripePattern, scale: 1.0)))
        .scaleEffect(2)
        .rotationEffect(.degrees(angle))
        .clipShape(self))
    }
}

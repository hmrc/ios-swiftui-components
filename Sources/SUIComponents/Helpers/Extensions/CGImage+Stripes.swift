/*
 * Copyright 2023 HM Revenue & Customs
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

import UIKit
import CoreImage.CIFilterBuiltins

extension CGImage {
    static func generateStripePattern(colors: (UIColor, UIColor) = (.clear, .black), width: CGFloat = 2, ratio: CGFloat = 1) -> CGImage? {
        let context = CIContext()
        let stripes = CIFilter.stripesGenerator()
        stripes.color0 = CIColor(color: colors.0)
        stripes.color1 = CIColor(color: colors.1)
        stripes.width = Float(width)
        stripes.center = CGPoint(x: 1-width*ratio, y: 0)
        let size = CGSize(width: width, height: 1)

        guard
            let stripesImage = stripes.outputImage,
            let image = context.createCGImage(stripesImage, from: CGRect(origin: .zero, size: size))
        else { return nil }
        return image
    }
}


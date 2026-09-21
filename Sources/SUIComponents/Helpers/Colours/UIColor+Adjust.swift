/*
 * Copyright 2021 HM Revenue & Customs
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

public extension UIColor {

    func lighten(_ alpha: CGFloat) -> UIColor {
        overlaid(with: UIColor(white: 1, alpha: alpha))
    }

    func darken(_ alpha: CGFloat) -> UIColor {
        overlaid(with: UIColor(white: 0, alpha: alpha))
    }

    private func overlaid(with overlay: UIColor) -> UIColor {
        UIColor { traitCollection in
            var backgroundRed: CGFloat = 0
            var backgroundGreen: CGFloat = 0
            var backgroundBlue: CGFloat = 0
            var backgroundAlpha: CGFloat = 0

            var foregroundRed: CGFloat = 0
            var foregroundGreen: CGFloat = 0
            var foregroundBlue: CGFloat = 0
            var foregroundAlpha: CGFloat = 0

            self.resolvedColor(with: traitCollection).getRed(
                &backgroundRed,
                green: &backgroundGreen,
                blue: &backgroundBlue,
                alpha: &backgroundAlpha
            )
            overlay.resolvedColor(with: traitCollection).getRed(
                &foregroundRed,
                green: &foregroundGreen,
                blue: &foregroundBlue,
                alpha: &foregroundAlpha
            )

            return UIColor(
                red: foregroundAlpha * foregroundRed + (1 - foregroundAlpha) * backgroundRed,
                green: foregroundAlpha * foregroundGreen + (1 - foregroundAlpha) * backgroundGreen,
                blue: foregroundAlpha * foregroundBlue + (1 - foregroundAlpha) * backgroundBlue,
                alpha: 1.0
            )
        }
    }
}

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

import Foundation
import SwiftUI
import UIKit

public struct HexColour {
    public let red: Double
    public let green: Double
    public let blue: Double
    public let alpha: Double

    public init(_ hexString: String) {
        let hex = hexString.trimmingCharacters(in: CharacterSet.alphanumerics.inverted)
        var value: UInt64 = 0
        Scanner(string: hex).scanHexInt64(&value)

        let alphaValue, redValue, greenValue, blueValue: UInt64
        switch hex.count {
        case 3:
            (alphaValue, redValue, greenValue, blueValue) = (
                255,
                (value >> 8) * 17,
                (value >> 4 & 0xF) * 17,
                (value & 0xF) * 17
            )
        case 6:
            (alphaValue, redValue, greenValue, blueValue) = (
                255,
                value >> 16,
                value >> 8 & 0xFF,
                value & 0xFF
            )
        case 8:
            (alphaValue, redValue, greenValue, blueValue) = (
                value >> 24,
                value >> 16 & 0xFF,
                value >> 8 & 0xFF,
                value & 0xFF
            )
        default:
            (alphaValue, redValue, greenValue, blueValue) = (255, 0, 0, 0)
        }

        self.red = Double(redValue) / 255
        self.green = Double(greenValue) / 255
        self.blue = Double(blueValue) / 255
        self.alpha = Double(alphaValue) / 255
    }
}

public extension Color {
    init(hexString: String) {
        let hex = HexColour(hexString)
        self.init(.sRGB, red: hex.red, green: hex.green, blue: hex.blue, opacity: hex.alpha)
    }

    var hexString: String? {
        let children = Mirror(reflecting: self).children
        let _provider = children.filter { $0.label == "provider" }.first
        guard let provider = _provider?.value else {
            return nil
        }
        let providerChildren = Mirror(reflecting: provider).children
        let _base = providerChildren.filter { $0.label == "base" }.first
        guard let base = _base?.value else {
            return nil
        }
        var baseValue: String = ""
        dump(base, to: &baseValue)
        guard let firstLine = baseValue.split(separator: "\n").first,
              let hexString = firstLine.split(separator: " ")[1] as Substring? else {
            return nil
        }
        return String(hexString.trimmingCharacters(in: .newlines).dropLast(2))
    }
}

public extension UIColor {
    convenience init(hexString: String) {
        let hex = HexColour(hexString)
        self.init(
            red: CGFloat(hex.red),
            green: CGFloat(hex.green),
            blue: CGFloat(hex.blue),
            alpha: CGFloat(hex.alpha)
        )
    }
}

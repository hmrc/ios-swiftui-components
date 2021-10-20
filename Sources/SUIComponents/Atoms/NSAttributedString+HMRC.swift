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

import SwiftUI

public enum AttributedStringStyle {
    case H3
    case H4
    case H5
    case bold
    case body
    case info
    case link
    case error

    public var font: Font {
        switch self {
        case .H3: return Font.H3.font()
        case .H4: return Font.H4.font()
        case .H5: return Font.H5.font()
        case .bold: return Font.Bold.font()
        case .body, .info, .link, .error: return Font.Body.font()
        }
    }

    public var textColor: Color {
        switch self {
        case .info:
            return Color.Semantic.infoText
        case .link:
            return Color.Semantic.linkText
        case .error:
            return Color.Semantic.errorText
        default:
            return Color.Semantic.darkText
        }
    }

    public var backgroundColor: Color {
        return Color.clear
    }
}

extension NSMutableAttributedString {
    public static func styled(
        style: AttributedStringStyle,
        string: String? = nil)
    -> NSMutableAttributedString {
        let string = NSMutableAttributedString(string: string ?? "")
        string.setAppearance(for: style)
        return string
    }

    public func setAppearance(for style: AttributedStringStyle) {
        return setAppearance(for: style, subString: nil)
    }

    public func setAppearance(
        for style: AttributedStringStyle,
        subString: String?
    ) {
        let foundRange: NSRange = {
            if let subString = subString {
                return self.mutableString.range(of: subString)
            } else {
                return NSRange(location: 0, length: self.length)
            }
        }()
        if foundRange.location != NSNotFound {
            let attributes: [NSAttributedString.Key: Any] = [
                NSAttributedString.Key.font: style.font,
                NSAttributedString.Key.foregroundColor: style.textColor,
                NSAttributedString.Key.backgroundColor: style.backgroundColor
            ]
            self.addAttributes(attributes, range: foundRange)
        }
    }
}

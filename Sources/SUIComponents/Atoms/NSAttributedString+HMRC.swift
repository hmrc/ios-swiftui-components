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

extension NSMutableAttributedString {
    public static func styled_sui(
        style: TextStyle,
        string: String? = nil)
    -> NSMutableAttributedString {
        let string = NSMutableAttributedString(string: string ?? "")
        string.setAppearance_sui(for: style)
        return string
    }

    public func setAppearance_sui(for style: TextStyle) {
        return setAppearance_sui(for: style, subString: nil)
    }

    public func setAppearance_sui(
        for style: TextStyle,
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

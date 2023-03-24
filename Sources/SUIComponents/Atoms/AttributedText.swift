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

import SwiftUI

extension Components.Atoms {
    public struct Text: UIViewRepresentable {
        public let text: String
        public let style: TextStyle
        public let accessibilityAttributedLabel: NSAttributedString?
        public let accessibilityAttributedHint: NSAttributedString?

        public init(
            _ text: String,
            style: TextStyle = .body,
            accessibilityAttributedLabel: NSAttributedString? = nil,
            accessibilityAttributedHint: NSAttributedString? = nil
        ) {
            self.text = text
            self.style = style
            self.accessibilityAttributedLabel = accessibilityAttributedLabel
            self.accessibilityAttributedHint = accessibilityAttributedHint
        }

        public func makeUIView(context: Context) -> UILabel {
            let label = UILabel()
            label.lineBreakMode = .byClipping
            label.numberOfLines = 0
            return label
        }

        public func updateUIView(_ uiView: UILabel, context: Context) {
            uiView.text = text
            uiView.font = style.uiFont
            uiView.textColor = style.textColor.uiColor()
            uiView.accessibilityAttributedLabel = accessibilityAttributedLabel
            uiView.accessibilityAttributedHint = accessibilityAttributedHint
        }
    }
    public struct AttributedText: UIViewRepresentable {

        public let attributedString: NSAttributedString
        public let accessibilityAttributedLabel: NSAttributedString?
        public let accessibilityAttributedHint: NSAttributedString?

        public init(
            _ attributedString: NSAttributedString,
            accessibilityAttributedLabel: NSAttributedString? = nil,
            accessibilityAttributedHint: NSAttributedString? = nil
        ) {
            self.attributedString = attributedString
            self.accessibilityAttributedLabel = accessibilityAttributedLabel
            self.accessibilityAttributedHint = accessibilityAttributedHint
        }

        public func makeUIView(context: Context) -> UILabel {
            let label = UILabel()
            label.lineBreakMode = .byClipping
            label.numberOfLines = 0
            return label
        }

        public func updateUIView(_ uiView: UILabel, context: Context) {
            uiView.attributedText = attributedString
            uiView.accessibilityAttributedLabel = accessibilityAttributedLabel
            uiView.accessibilityAttributedHint = accessibilityAttributedHint
        }
    }
}

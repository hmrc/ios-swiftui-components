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

public extension Components.Atoms {
    public class UITextViewWithHeight: UITextView {
        @Binding var height: CGFloat
        var didEndInput: VoidHandler?

        public init(height: Binding<CGFloat>) {
            self._height = height
            super.init(frame: .zero, textContainer: nil)
        }

        required init?(coder: NSCoder) {
            fatalError("init(coder:) has not been implemented")
        }

        public override func layoutSubviews() {
            super.layoutSubviews()
            self.height = sizeThatFits(.init(width: frame.width, height: 0)).height
        }
    }

    public struct TextView: UIViewRepresentable {
        @Binding public var text: String
        @Binding private var height: CGFloat
        @Binding private var editing: Bool
        private let didEndInput: VoidHandler?

        private let isScrollEnabled: Bool
        private let multiLine: Bool
        private let maxLength: Int
        private let enforceMaxLength: Bool
        private let accentColor: Color
        private var borderColor: UIColor
        private var borderWidth: CGFloat
        private var cornerRadius: CGFloat

        public init(
            text: Binding<String>,
            height: Binding<CGFloat>,
            editing: Binding<Bool>,
            isScrollEnabled: Bool = false,
            multiLine: Bool = false,
            maxLength: Int = 0,
            enforceMaxLength: Bool = true,
            accentColor: Color? = nil,
            borderColor: Color? = nil,
            borderWidth: CGFloat? = nil,
            cornerRadius: CGFloat? = nil,
            _ didEndInput: VoidHandler?=nil) {
            self._text = text
            self._height = height
            self._editing = editing
            self.isScrollEnabled = isScrollEnabled
            self.multiLine = multiLine
            self.maxLength = maxLength
            self.enforceMaxLength = enforceMaxLength
            self.accentColor = accentColor ?? .blue
            self.borderColor = borderColor?.uiColor() ?? .lightGray
            self.borderWidth = borderWidth ?? 0.0
            self.cornerRadius = cornerRadius ?? 0.0
            self.didEndInput = didEndInput
        }

        public func makeCoordinator() -> Coordinator {
            Coordinator(
                text: $text,
                editing: $editing,
                multiLine: multiLine,
                maxLength: maxLength,
                enforceMaxLength: enforceMaxLength
            )
        }

        public func makeUIView(context: Context) -> UITextViewWithHeight {
            let view = UITextViewWithHeight(height: $height)
            view.setContentCompressionResistancePriority(.defaultLow, for: .horizontal)
            view.isScrollEnabled = isScrollEnabled
            view.backgroundColor = .clear
            view.didEndInput = didEndInput
            view.delegate = context.coordinator
            return view
        }

        public func updateUIView(_ uiView: UITextViewWithHeight, context: Context) {
            uiView.text = text
            uiView.font = Font.Body.uiFont()
            uiView.tintColor = accentColor.uiColor()

            uiView.layer.borderWidth = borderWidth
            uiView.layer.cornerRadius = cornerRadius
            uiView.layer.borderColor = borderColor.cgColor

            let fixedWidth = uiView.frame.size.width
            let newSize = uiView.sizeThatFits(CGSize(width: fixedWidth, height: CGFloat.greatestFiniteMagnitude))
            print(newSize)
            DispatchQueue.main.async {
                self.height = newSize.height
            }

        }

        public func border(_ color: Color, width: CGFloat) -> TextView {
            var view = self
            view.borderColor = color.uiColor()
            view.borderWidth = width
            return view
        }

        public func cornerRadius(_ cornerRadius: CGFloat) -> TextView {
            var view = self
            view.cornerRadius = cornerRadius
            return view
        }

        public class Coordinator: NSObject, UITextViewDelegate {
            @Binding private var text: String
            @Binding private var editing: Bool
            let multiLine: Bool
            let maxLength: Int
            let enforceMaxLength: Bool

            init(text: Binding<String>, editing: Binding<Bool>, multiLine: Bool, maxLength: Int, enforceMaxLength: Bool = true) {
                _text = text
                _editing = editing
                self.multiLine = multiLine
                self.maxLength = maxLength
                self.enforceMaxLength = enforceMaxLength
            }

            open func textViewDidBeginEditing(_ textView: UITextView) {
                editing = true
            }

            open func textViewDidEndEditing(_ textView: UITextView) {
                editing = false
                (textView as? UITextViewWithHeight)?.didEndInput?()
            }

            open func textView(
                _ textView: UITextView,
                shouldChangeTextIn range: NSRange,
                replacementText text: String
            ) -> Bool {
                if !multiLine, text == "\n" {
                    textView.resignFirstResponder()
                    return false
                }

                if maxLength > 0, enforceMaxLength {
                    return textView.text.count + (text.count - range.length) <= maxLength
                }

                return true
            }

            open func textViewDidChange(_ textView: UITextView) {
                text = textView.text
            }
        }
    }
}

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
     
     struct SecureInputTextView: UIViewRepresentable {
        @Binding public var text: String
        @Binding private var height: CGFloat
        @Binding private var editing: Bool
        @Binding private var isSecureField: Bool
        @Binding private var internalText: String
        private let didEndInput: VoidHandler?
        private let shouldChangeText: TextViewShouldChangeHandler?
        private let maxLength: Int
        private let enforceMaxLength: Bool
        private let accentColor: Color
        private var borderColor: UIColor
        private var borderWidth: CGFloat
        private var cornerRadius: CGFloat
        private var keyboardType: UIKeyboardType
        
        public init(
            text: Binding<String>,
            height: Binding<CGFloat>,
            editing: Binding<Bool>,
            isSecureField: Binding<Bool>,
            internalText: Binding<String>,
            maxLength: Int = 0,
            enforceMaxLength: Bool = true,
            accentColor: Color? = nil,
            borderColor: Color? = nil,
            borderWidth: CGFloat? = nil,
            cornerRadius: CGFloat? = nil,
            keyboardType: UIKeyboardType = .numberPad,
            shouldChangeText: TextViewShouldChangeHandler? = nil,
            _ didEndInput: VoidHandler? = nil) {
                self._text = text
                self._height = height
                self._editing = editing
                self._isSecureField = isSecureField
                self._internalText = text
                self.maxLength = maxLength
                self.enforceMaxLength = enforceMaxLength
                self.accentColor = accentColor ?? .blue
                self.borderColor = borderColor?.uiColor() ?? .lightGray
                self.borderWidth = borderWidth ?? 0.0
                self.cornerRadius = cornerRadius ?? 0.0
                self.keyboardType = keyboardType
                self.didEndInput = didEndInput
                self.shouldChangeText = shouldChangeText
            }
        
        public func makeCoordinator() -> Coordinator {
            Coordinator(
                text: $text,
                internalText: $internalText,
                editing: $editing,
                isSecureField: $isSecureField,
                maxLength: maxLength
            )
        }
        
        public func makeUIView(context: Context) -> UITextViewWithHeight {
            let view = UITextViewWithHeight(height: $height)
            view.setContentCompressionResistancePriority(.defaultLow, for: .horizontal)
            view.backgroundColor = .clear
            view.isSecureTextEntry = isSecureField
            view.didEndInput = didEndInput
            view.shouldChangeText = shouldChangeText
            view.delegate = context.coordinator
            return view
        }
        
        public func updateUIView(_ uiView: UITextViewWithHeight, context: Context) {
            uiView.text = secureText(uiView.text, context.coordinator)
            uiView.font = Font.Body.uiFont()
            uiView.tintColor = accentColor.uiColor()
            
            uiView.layer.borderWidth = borderWidth
            uiView.layer.cornerRadius = cornerRadius
            uiView.layer.borderColor = borderColor.cgColor
            uiView.keyboardType = keyboardType
            uiView.isSecureTextEntry = isSecureField
            
            let fixedWidth = uiView.frame.size.width
            let newSize = uiView.sizeThatFits(CGSize(width: fixedWidth, height: CGFloat.greatestFiniteMagnitude))
            DispatchQueue.main.async {
                self.height = newSize.height
            }
            
        }
        
        private func secureText(_ textViewText: String, _ coordinator: Coordinator) -> String {
            if isSecureField {
                let secureText = String(repeating: "●", count: text.count)
                if textViewText != secureText {
                    return secureText
                }
            } else {
                if textViewText != internalText {
                    return internalText
                }
            }
            return text
        }
        
        public class Coordinator: NSObject, UITextViewDelegate {
            @Binding private var text: String
            @Binding private var internalText: String
            @Binding private var editing: Bool
            @Binding private var isSecureField: Bool
            let maxLength: Int
            let enforceMaxLength: Bool
            @State private var keepInternalPassword = false
            
            init(
                text: Binding<String>,
                internalText: Binding<String>,
                editing: Binding<Bool>,
                isSecureField: Binding<Bool>,
                maxLength: Int,
                enforceMaxLength: Bool = true
            ) {
                self._text = text
                self._internalText = internalText
                self._editing = editing
                self._isSecureField = isSecureField
                self.maxLength = maxLength
                self.enforceMaxLength = enforceMaxLength
            }
            
            public func textView(_ textView: UITextView, shouldChangeTextIn range: NSRange, replacementText text: String) -> Bool {
                guard let textViewText = textView.text else { return false }
                
                if text == "\n" {
                    textView.resignFirstResponder()
                    return false
                }
                
                if let shouldChangeTextHandler = (textView as? UITextViewWithHeight)?.shouldChangeText {
                    
                    if let internalTextRange = Range(range, in: internalText) {
                        let newInternalText = internalText.replacingCharacters(in: internalTextRange, with: text)
                        
                        if maxLength > 0, enforceMaxLength && newInternalText.count > maxLength {
                            return false
                        }
                        internalText = newInternalText
                        if textView.isSecureTextEntry {
                            let secureText = String(repeating: "●", count: text.count)
                            textView.text = secureText
                        } else {
                            textView.text = internalText
                        }
                        return false
                    }
                    return shouldChangeTextHandler(textView.text, range, text)
                }
                return true
            }
            
            open func textViewDidBeginEditing(_ textView: UITextView) {
                editing = true
            }

            open func textViewDidEndEditing(_ textView: UITextView) {
                editing = false
                (textView as? UITextViewWithHeight)?.didEndInput?()
            }
            
            open func textViewDidChange(_ textView: UITextView) {
                if textView.text != nil {
                    text = textView.text!
                }
            }
        }
        
    }
}

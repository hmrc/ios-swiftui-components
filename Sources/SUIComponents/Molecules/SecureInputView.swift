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

extension Components.Molecules {
    public struct SecureInputView: View {
        public struct Model {
            let title: String?
            let hint: String?
            let placeholder: String
            let maxLength: Int
            let keyboardType: UIKeyboardType
            let secureFieldLabel: String?
            let submit: VoidHandler?
            let useClear: Bool = false
            let showText: String
            let hideText: String
            let showTextAccessibility: String?
            let hideTextAccessibility: String?
            let accessibilityLabel: String?
            let speakOutText: Bool?
            let attributedText: Bool?
            
            public init(
                title: String? = nil,
                hint: String? = nil,
                placeholder: String = "",
                maxLength: Int = 0,
                keyboardType: UIKeyboardType = .numberPad,
                secureFieldLabel: String = "",
                action submit: VoidHandler? = nil,
                showText: String,
                hideText: String,
                showTextAccessibility: String? = nil,
                hideTextAccessibility: String? = nil,
                accessibilityLabel: String? = nil,
                speakOutText: Bool? = false,
                attributedTextInAccessibility: Bool? = false
            ) {
                self.title = title
                self.hint = hint
                self.maxLength = maxLength
                self.placeholder = placeholder
                self.keyboardType = keyboardType
                self.secureFieldLabel = secureFieldLabel
                self.submit = submit
                self.showText = showText
                self.hideText = hideText
                self.showTextAccessibility = showTextAccessibility ?? showText
                self.hideTextAccessibility = hideTextAccessibility ?? hideText
                self.accessibilityLabel = accessibilityLabel ?? title
                self.speakOutText = speakOutText
                self.attributedText = attributedTextInAccessibility
            }
        }
        
        let model: Model
        @Binding var text: String
        @Binding var internalText: String
        @Binding var isSecureField: Bool
        @State private var calculatedTextViewWidth: CGFloat = .spacer36
        @State private var textViewHeight: CGFloat = 0
        @State private var editing: Bool = false
        var didEndEditing: VoidHandler?
        @Binding var validationError: String?
        let hide: Double = 0.0
        let show: Double = 1.0
        var speakOutText: Bool = false
        var attributedString: Bool = false
        
        fileprivate var secureInputView: some View {
            ZStack(alignment: .trailing) {
                Components.Atoms.SecureInputTextView(
                    text: $text,
                    height: $textViewHeight,
                    editing: $editing,
                    isSecureField: $isSecureField,
                    internalText: $internalText,
                    maxLength: model.maxLength,
                    shouldChangeText: { textViewText, range, replacementText in
                        var newText = internalText
                        if let internalTextRange = Range(range, in: internalText) {
                            newText = internalText.replacingCharacters(in: internalTextRange, with: replacementText)
                        }
                        return newText.isEmpty || newText.isNumericValue()
                    },
                    didEndEditing
                )
                .accessibilityElement(children: .ignore)
                .accessibilityAddTraits(.allowsDirectInteraction)
                .accessibilityLabel(accessibilityTextOut)
                .onAppear {
                    accessibilityTextOut = updateAccessibilityTextOutput(validationError)
                }
                .onChange(of: text, perform: { _ in
                    accessibilityTextOut = updateAccessibilityTextOutput(validationError)
                })
                .onChange(of: isSecureField, perform: { _ in
                    accessibilityTextOut = updateAccessibilityTextOutput(validationError)
                })
            }
        }
        
        @State private var accessibilityTextOut: Text = Text("")
        
        private func updateAccessibilityTextOutput(_ withError: String?) -> Text {
            guard var output = model.accessibilityLabel?.fillParameters([""])
            else {
                return Text("")
            }
            
            if !isSecureField && attributedString {
                let accessibilityText = speakOutText ? text.splitUp(separator: ",") : text
                output =
                    (model.accessibilityLabel != nil ? model.accessibilityLabel?.fillParameters([accessibilityText]) : accessibilityText)!
            }
            
            //attach error if needed
            if let error = withError {
                return Text(output.appending(", Error, \(error)"))
            }
            return Text(output)
        }
        
        private var accessibilityButtonLabel: Text {
            isSecureField ?
            Text(model.showTextAccessibility ?? "") :
            Text(model.hideTextAccessibility ?? "")
        }
        
        public init(
            model: Model,
            text: Binding<String>,
            internalText: Binding<String>,
            secureField: Binding<Bool>,
            validationError: Binding<String?>
        ) {
            self.model = model
            self._text = text
            self._internalText = internalText
            self._validationError = validationError
            self._isSecureField = secureField
            self.speakOutText =  model.speakOutText ?? false
            self.attributedString = model.attributedText ?? false
        }
        
        @Namespace var nspace
        public var body: some View {
            VStack(alignment: .leading, spacing: 5) {
                Text(model.title ?? "")
                    .style(.bold)
                if let hint = model.hint {
                    Text(hint)
                        .style(.body)
                }
                HStack {
                    // MARK: SecureField content
                    HStack(alignment: .center) {
                        secureInputView
                    }
                    .frame(height: textViewHeight)
                    .padding(.vertical, .spacer4)
                    // MARK: overlay show/hide button
                    Button(
                        isSecureField ? model.showText : model.hideText
                    ){
                        withAnimation(.easeIn(duration: 0.3)) {
                            self.isSecureField.toggle()
                        }
                    }
                    .accentColor( Color.Semantic.primaryButtonBackground)
                    .frame(height: textViewHeight, alignment: .leading)
                    .accessibilityAddTraits(.isButton)
                    .accessibilityLabel(accessibilityButtonLabel)
                    .padding(.standardCardHorizontal)
                }
                .padding(.horizontal, .spacer0)
                .overlay(
                    RoundedRectangle(cornerRadius: 4.0)
                        .stroke(
                            Color.Named.black.colour,
                            lineWidth: 1.0
                        )
                )
                    
                HStack {
                    if let error = validationError {
                        Text(error)
                            .style(.error)
                            .accessibilityHidden(true)
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .onAppear {
                                accessibilityTextOut = updateAccessibilityTextOutput(validationError)
                            }
                    }
                }.frame(maxWidth: .infinity, alignment: .trailing)
            }
        }
    }
    
    #Preview {
        var text = ""
        let textBinding = Binding<String> {
            text
        } set: { newText in
            text = newText
            print("SecureInputView Value did change: \(text)")
        }
        var internalText = ""
        let passwordBinding = Binding<String> {
            internalText
        } set: { newText in
            internalText = newText
            print("SecureInputView Value did change: \(internalText)")
        }
        var secure = true
        let secureBinding = Binding<Bool> {
            secure
        } set: { newValue in
            secure = newValue
            print("SecureInputView toogle did change: \(secure)")
        }
        
        var error = "error"
        let errorBinding = Binding<String?> {
            error
        } set: { newValue in
            error = newValue ?? ""
            print("SecureInputView toogle did change: \(error)")
        }
        
        return SecureInputView(
            model: .init(
                title: "Title",
                hint: "Hint",
                placeholder: "Create a 6-digit PIN",
                maxLength: 6,
                showText: "Show",
                hideText: "Hide"
            ),
            text: textBinding,
            internalText: passwordBinding,
            secureField: secureBinding,
            validationError: errorBinding)
    }
}

fileprivate extension String {
    func splitUp(separator: String = " ") -> String {
        (self.map { String($0) }).joined(separator: separator)
    }
    func fillParameters(_ params: [String]) -> String {
        return String(format: self, arguments: params)
    }
}

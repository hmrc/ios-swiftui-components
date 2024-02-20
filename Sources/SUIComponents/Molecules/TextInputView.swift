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
    public struct TextInputView: View {
        public struct Model {
            public let title: String
            public let hint: String?
            public let placeholder: String
            public let leftViewText: String?
            public let maxLength: Int
            public let enforceMaxLength: Bool
            public let multiLine: Bool
            public let keyboardType: UIKeyboardType
            public let shouldChangeText: TextViewShouldChangeHandler?

            public init(
                title: String? = nil,
                hint: String? = nil,
                placeholder: String? = nil,
                leftViewText: String? = nil,
                maxLength: Int = 0,
                enforceMaxLength: Bool = true,
                multiLine: Bool = false,
                keyboardType: UIKeyboardType = .default,
                shouldChangeText: TextViewShouldChangeHandler? = nil
            ) {
                self.title = title ?? ""
                self.hint = hint
                self.placeholder = placeholder ?? ""
                self.leftViewText = leftViewText
                self.maxLength = maxLength
                self.enforceMaxLength = enforceMaxLength
                self.multiLine = multiLine
                self.keyboardType = keyboardType
                self.shouldChangeText = shouldChangeText
            }
        }

        let model: Model
        @Binding var text: String
        @State private var textFieldHeight: CGFloat = 0
        @State private var editing: Bool = false
        var validationError: String?

        public init(text: Binding<String>, model: Model, validationError: String? = nil) {
            self.model = model
            self._text = text
            self.validationError = validationError
        }
        private var accessibilityLabel: Text {
            var text = ""
            if let validationError = validationError {
                text.append(" \(validationError) ")
            }
            if let hint = model.hint {
                text.append(" \(hint) ")
            }
            text.append(model.title)
            return Text(text)
        }
        public var body: some View {
            VStack(alignment: .leading, spacing: 5) {
                Text(model.title)
                    .style(.bold)
                    .accessibility(hidden: true)
                if let hint = model.hint {
                    Text(hint)
                        .style(.body)
                        .accessibility(hidden: true)
                }
                HStack {
                    if let leftText = model.leftViewText {
                        Text(leftText)
                            .font(Font.Body.font())
                            .foregroundColor(Color.Semantic.textInputLeftViewTint)
                            .padding(.leading, .spacer8)
                            .accessibility(hidden: true)
                    }
                    Components.Atoms.TextView(
                        text: $text,
                        height: $textFieldHeight,
                        editing: $editing,
                        multiLine: model.multiLine,
                        maxLength: model.maxLength,
                        enforceMaxLength: model.enforceMaxLength,
                        accentColor: Color.Named.blue.colour,
                        borderWidth: 0.0,
                        keyboardType: model.keyboardType,
                        shouldChangeText: model.shouldChangeText
                    ) {
                        print("Text committed: \(text)")
                    }
                    .frame(height: textFieldHeight)
                    .accessibility(label: accessibilityLabel)
                    if editing && text.count > 0 {
                        Button {
                            text = ""
                        } label: {
                            Image(
                                "clear_icon",
                                bundle: Bundle.resource
                            ).foregroundColor(Color.Named.black.colour)
                        }
                    }
                }
                .padding(.trailing, .spacer8)
                .overlay(
                    RoundedRectangle(cornerRadius: 4.0)
                        .stroke(
                            Color.Semantic.textInputBorder,
                            lineWidth: 1.0
                        )
                )

                HStack {
                    if let error = validationError {
                        Text(error)
                            .style(.error)
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .accessibility(hidden: true)
                    }
                }.frame(maxWidth: .infinity, alignment: .trailing)
            }
        }
    }
}

struct TextInputView_Previews: PreviewProvider {
    static var previews: some View {
        var text = ""
        let textBinding = Binding<String> {
            text
        } set: { newText in
            text = newText
            print("TextInputView Value did change: \(text)")
        }
        Components.Molecules.TextInputView(
            text: textBinding,
            model: .init(
                title: "Title",
                hint: "Hint",
                leftViewText: "@LeftView",
                maxLength: 10,
                multiLine: false,
                keyboardType: .emailAddress
            )
        )
    }
}

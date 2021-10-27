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
    public struct CurrencyInputView: View {
        public struct Model {
            let title: String?
            let maxLength: Int
            public init(
                title: String? = nil,
                maxLength: Int = 0
            ) {
                self.title = title
                self.maxLength = maxLength
            }
            fileprivate var textInputViewModel: TextInputView.Model {
                .init(
                    title: title,
                    leftViewText: "£",
                    maxLength: maxLength,
                    multiLine: false,
                    keyboardType: .decimalPad,
                    showCharCount: false,
                    shouldChangeText: { textViewText, range, replacementText in
                        let newText = (textViewText as NSString).replacingCharacters(in: range, with: replacementText)
                        return newText.isEmpty || newText.isCurrencyValue()
                    }
                )
            }
        }

        let model: Model
        @Binding var text: String
        var validationError: String?

        public init(text: Binding<String>, model: Model, validationError: String? = nil) {
            self.model = model
            self._text = text
            self.validationError = validationError
        }

        public var body: some View {
            TextInputView(text: _text, model: model.textInputViewModel, validationError: validationError)
        }
    }
}

struct CurrencyInputView_Previews: PreviewProvider {
    static var previews: some View {
        var text = ""
        let textBinding = Binding<String> {
            text
        } set: { newText in
            text = newText
            print("CurrencyInputView Value did change: \(text)")
        }
        Components.Molecules.CurrencyInputView(
            text: textBinding,
            model: .init(title: "Title", maxLength: 20)
        )
    }
}

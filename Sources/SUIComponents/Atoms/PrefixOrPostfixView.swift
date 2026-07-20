/*
 * Copyright 2018 HM Revenue & Customs
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

/// View to be used to prefix or postfix a text input to provide addtional context for the input type
public struct PrefixOrPostfixView: View {
    
    private enum ViewTraits {
        static let height: CGFloat = 52
        static let borderWidth: CGFloat = 1
    }
    
    public enum InputType {
        case currency, percentage
        
        public var text: String {
            switch self {
            case .currency:
                return "£"
            case .percentage:
                return "%"
            }
        }
    }
    
    let inputType: InputType
    
    public var body: some View {
        Text(inputType.text)
            .multilineTextAlignment(.center)
            .font(Font.Body.font())
            .foregroundColor(Color.Semantic.textInputLeftViewTint)
            .accessibility(hidden: true)
            .frame(minWidth: ViewTraits.height,
                   maxWidth: ViewTraits.height,
                   minHeight: ViewTraits.height,
                   maxHeight: .infinity)
            .background(
                Color.Semantic.prefixBackgroundColour,
                in: Rectangle()
            )
            .overlay(
                Rectangle()
                    .stroke(Color.Named.black.colour,
                            lineWidth: ViewTraits.borderWidth)
            )
    }
}

struct PrefixOrPostfixView_Previews: PreviewProvider {
    static var previews: some View {
        ForEach(ColorScheme.allCases, id: \.self) {
            VStack {
                PrefixOrPostfixView(inputType: .currency)
                PrefixOrPostfixView(inputType: .percentage)
            }
            .preferredColorScheme($0)
        }
    }
}

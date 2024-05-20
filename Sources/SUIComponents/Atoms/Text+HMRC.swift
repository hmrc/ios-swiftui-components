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

public enum TextStyle {
    case H3
    case H4
    case H5
    case bold
    case body
    case info
    case debug
    case link
    case linkBold
    case error
    case errorBold

    public var font: Font {
        switch self {
            case .H3: return Font.H3.font()
            case .H4: return Font.H4.font()
            case .H5: return Font.H5.font()
            case .bold, .linkBold, .errorBold: return Font.Bold.font()
            case .body, .info, .link, .error: return Font.Body.font()
            case .debug: return Font.Debug.font()
        }
    }
    public var uiFont: UIFont {
        switch self {
            case .H3: return Font.H3.uiFont()
            case .H4: return Font.H4.uiFont()
            case .H5: return Font.H5.uiFont()
            case .bold, .linkBold, .errorBold: return Font.Bold.uiFont()
            case .body, .info, .link, .error: return Font.Body.uiFont()
            case .debug: return Font.Debug.uiFont()
        }
    }
    public var textColor: Color {
        switch self {
            case .info, .debug:
                return Color.Semantic.infoText
            case .link, .linkBold:
                return Color.Semantic.linkText
            case .error, .errorBold:
                return Color.Semantic.errorText
            default:
                return Color.Semantic.darkText
        }
    }
}

public extension Text {
    func style(_ style: TextStyle) -> some View {
        self.modifier(Title(model: style))
    }
    struct Title: ViewModifier {
        let model: TextStyle
        @Environment(\.dynamicTypeSize) var dynamicTypeSize
        
        public func body(content: Content) -> some View {
            if model == .H3 || model == .H4 || model == .H5 {
                return AnyView(content
                    .font(model.font)
                    .foregroundColor(model.textColor)
                    .fixedSize(horizontal: false, vertical: true)
                    .accessibility(addTraits: .isHeader)
                )
            } else {
                return AnyView(content
                    .font(model.font)
                    .foregroundColor(model.textColor)
                    .fixedSize(horizontal: false, vertical: true)
                )
            }
        }
    }
}
public extension Text {
    init(pounds: Int, pence: Int? = nil, poundsFont: Font?=nil, penceFont: Font?=nil) {
        let poundsComponent = Text("£\(pounds)").font(poundsFont ?? Font.H3.font())
        
        if let pence = pence, pence > 0 {
            let penceComponent = Text(".\(pence)").font(penceFont ?? Font.H5.font())
            self = poundsComponent + penceComponent
        } else {
            self = poundsComponent
        }
    }
    
    init(_ text: String, style: TextStyle) {
        self = .init(text)
            .font(style.font)
            .foregroundColor(style.textColor)
                   
    }
}

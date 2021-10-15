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
    case error

    public var font: Font {
        switch self {
            case .H3: return Font.H3()
            case .H4: return Font.H4()
            case .H5: return Font.H5()
            case .bold: return Font.bold()
            case .body, .info, .link, .error: return Font.body()
            case .debug: return Font.debug()
        }
    }
    public var textColor: Color {
        switch self {
        case .info, .debug:
            return Color.Semantic.infoText
        case .link:
            return Color.Semantic.linkText
        case .error:
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
        public func body(content: Content) -> some View {
            content
                .font(model.font)
        }
    }
}

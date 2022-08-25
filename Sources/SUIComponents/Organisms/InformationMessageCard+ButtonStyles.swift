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

extension Components.Organisms.InformationMessageCard {

    public enum ButtonStyle {
        case action(enabled: Bool = true)
        case outline(padding: CGFloat = .spacer16)
    }

    struct ActionButtonStyle: SwiftUI.ButtonStyle {
        let enabled: Bool
        init(_ enabled: Bool = true) {
            self.enabled = enabled
        }
        func makeBody(configuration: Configuration) -> some View {
            WrappedButton(configuration: configuration)
        }
        private var backgroundColor: Color {
            enabled ?  Color.Semantic.whiteBackground : Color.Semantic.primaryButtonDisabledBackground
        }
        private var textColor: Color {
            enabled ?  Color.Semantic.primaryButtonText : Color.Semantic.primaryButtonDisabledText
        }
        struct WrappedButton: View {
            let configuration: Configuration
            @Environment(\.isEnabled) private var isEnabled: Bool

            private func backgroundColour(for configuration: Configuration, isEnabled: Bool)-> Color {
                if !isEnabled {
                    return Color.Semantic.primaryButtonDisabledBackground
                } else {
                    return configuration.isPressed ? Color.Semantic.secondaryButtonHighlightedBackground : Color.Semantic.whiteBackground
                }
            }

            private func textColour(for configuration: Configuration, isEnabled: Bool)-> Color {
                isEnabled ? Color.Semantic.secondaryButtonText : Color.Semantic.primaryButtonDisabledText
            }

            var body: some View {
                configuration.label
                    .frame(maxWidth: .infinity)
                    .padding(.spacer12)
                    .background(backgroundColour(for: configuration, isEnabled: isEnabled))
                    .foregroundColor(textColour(for: configuration, isEnabled: isEnabled))
            }
        }
    }

    struct OutlineButtonStyle: SwiftUI.ButtonStyle {
        let padding: CGFloat
        let theme: Components.Organisms.InformationMessageCard.Theme
        init(_ padding: CGFloat = .spacer24, theme: Components.Organisms.InformationMessageCard.Theme) {
            self.padding = padding
            self.theme = theme
        }

        func makeBody(configuration: Configuration) -> some View {
            WrappedButton(configuration: configuration, padding: padding, theme: theme)
        }

        struct WrappedButton: View {
            let configuration: Configuration
            let padding: CGFloat
            let theme: Components.Organisms.InformationMessageCard.Theme
            @Environment(\.isEnabled) private var isEnabled: Bool

            init(
                configuration: OutlineButtonStyle.Configuration,
                padding: CGFloat,
                theme: Components.Organisms.InformationMessageCard.Theme
            ) {
                self.configuration = configuration
                self.padding = padding
                self.theme = theme
            }

            private var backgroundColor: Color {
                switch theme {
                case .urgent:
                    return .Semantic.errorText
                case .info:
                    return .Semantic.linkText
                case .warning:
                    return .Named.yellow.colour
                case .notice:
                    return .Semantic.darkText
                case let .custom(backgroundColor, _, _):
                    return backgroundColor
                }
            }
            private var highlightedBackgroundColor: Color {
                let amount = Double(0.92)
                switch theme {
                case .urgent:
                    return .Semantic.errorText.opacity(amount)
                case .info:
                    return .white.opacity(0.1)
                case .warning:
                    return .Named.yellow.colour.opacity(amount)
                case .notice:
                    return .Semantic.darkText.opacity(amount)
                case let .custom(backgroundColor, _, _):
                    return backgroundColor.opacity(amount)
                }
            }
            private var titleColor: Color {
                switch theme {
                case .urgent:
                    return .Semantic.lightText
                case .info:
                    return .Semantic.lightText
                case .warning:
                    return .black
                case .notice:
                    return .Semantic.lightText
                case let .custom(_, bodyTextColor, _):
                    return bodyTextColor
                }
            }

            private func backgroundColour(for configuration: Configuration, isEnabled: Bool)-> Color {
                return configuration.isPressed ? highlightedBackgroundColor : backgroundColor
            }

            var body: some View {
                configuration.label
                    .frame(maxWidth: .infinity, alignment: .center)
                    .padding(.spacer12)
                    .background(backgroundColour(for: configuration, isEnabled: isEnabled))
                    .foregroundColor(titleColor)
                    .border(Color.Semantic.whiteBackground, width: 1)
            }
        }
    }
}

extension Button {
    @ViewBuilder
    public func infoMessageStyled(
        _ style: Components.Organisms.InformationMessageCard.ButtonStyle,
        theme: Components.Organisms.InformationMessageCard.Theme
    ) -> some View {
        switch style {
        case .action(let enabled):
            self.buttonStyle(Components.Organisms.InformationMessageCard.ActionButtonStyle(enabled))
        case .outline(let padding):
            self.buttonStyle(Components.Organisms.InformationMessageCard.OutlineButtonStyle(padding, theme: theme))
        }
    }
}

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

extension Components.Organisms {
    public struct InformationMessageCard: View {

        public let id: String
        public let theme: Theme
        public let icon: Image
        public let headline: Headline
        public let itemSpacing: CGFloat
        public let insets: EdgeInsets
        public var handler: VoidHandler

        public init(
            id: String,
            theme: Theme,
            icon: Image,
            headline: Headline,
            itemSpacing: CGFloat = .spacer16,
            insets: EdgeInsets = .init(padding: .spacer16),
            handler: @escaping VoidHandler
        ) {
            self.id = id
            self.theme = theme
            self.icon = icon
            self.headline = headline
            self.itemSpacing = itemSpacing
            self.insets = insets
            self.handler = handler
        }

        public var body: some View {
            VStack(
                alignment: .leading,
                spacing: itemSpacing,
                content: {
                    HStack(
                        alignment: .center,
                        spacing: .spacer8) {
                            icon
                                .resizable()
                                .frame(width: 32, height: 32)
                                .foregroundColor(theme.iconTintColor())
                            Text(headline.title)
                                .foregroundColor(theme.iconTintColor())
                                .style(.bold)
                        }
                    if let body = headline.body {
                        Text(body)
                            .foregroundColor(theme.bodyLabelColor())
                            .style(.body)
                    }

                    if let ctas = headline.ctas {
                        VStack {
                            ForEach(0..<ctas.count, id: \.self) { index in
                                button(from: ctas[index])
                            }
                        }
                    }
                }
            )
            .cardView(
                insets: insets,
                backgroundColor: theme.backgroundColor()
            )
        }

        func button(from cta: CTA) -> AnyView {
            switch cta.displayType {
            case .action:
                return primary(cta: cta)
            case .outline:
                return secondary(cta: cta)
            }
        }

        @ViewBuilder func primary(cta: CTA) -> AnyView {
            AnyView(
                Button(cta.message, action: handler)
                    .infoMessageStyled(.action(enabled: true), theme: theme)
                    .multilineTextAlignment(.center)
            )
        }

        @ViewBuilder func secondary(cta: CTA) -> AnyView {
            AnyView(
                Button(cta.message, action: handler)
                    .infoMessageStyled(.outline(padding: .spacer8), theme: theme)
                    .multilineTextAlignment(.center)

            )
        }

        public enum Theme {
            case info
            case warning
            case urgent
            case notice
            case custom(backgroundColor: Color, bodyTextColor: Color, iconTintColor: Color)

            public func accessibilityLabelPrefix() -> String {
                switch self {
                case .info:
                    return NSLocalizedString("Info; ", comment: "Prefix for information message")
                case .warning:
                    return NSLocalizedString("Warning; ", comment: "Prefix for warning message")
                case .urgent:
                    return NSLocalizedString("Urgent; ", comment: "Prefix for urgent message")
                case .notice:
                    return NSLocalizedString("Notice; ", comment: "Prefix for notice message")
                case .custom:
                    return NSLocalizedString("Custom; ", comment: "Prefix for notice message")
                }
            }

            public func backgroundColor() -> Color {
                switch self {
                case .info:
                    return .Semantic.linkText
                case .warning:
                    return .Named.yellow.colour
                case .urgent:
                    return .Semantic.errorText
                case .notice:
                    return .Semantic.darkText
                case let .custom(backgroundColor, _, _):
                    return backgroundColor
                }
            }

            public func bodyLabelColor() -> Color {
                switch self {
                case .info, .urgent, .notice:
                    return .Semantic.lightText
                case .warning:
                    return .black
                case let .custom(_, labelColor, _):
                    return labelColor
                }
            }

            public func iconTintColor() -> Color {
                switch self {
                case .info, .urgent, .notice:
                    return .Semantic.lightText
                case .warning:
                    return .black
                case let .custom(_, _, iconTintColor):
                    return iconTintColor
                }
            }
        }

        public struct CTA {
            public let message: String
            public let link: String
            public let accessibilityHint: String?
            public let linkType: LinkType
            public let displayType: DisplayType

            public enum LinkType {
                case normal
                case sso
                case inApp
                case newScreen
            }

            public enum DisplayType {
                case action
                case outline
            }

            public init(
                message: String,
                link: String,
                accessibilityHint: String? = nil,
                linkType: LinkType,
                displayType: DisplayType
            ) {
                self.message = message
                self.link = link
                self.accessibilityHint = accessibilityHint
                self.linkType = linkType
                self.displayType = displayType
            }
        }

        public struct Headline {
            let title: String
            let body: String?
            public let ctas: [CTA]?

            public init(title: String, body: String? = nil, ctas: [CTA]? = nil) {
                self.title = title
                self.body = body
                self.ctas = ctas
            }
        }
    }
}

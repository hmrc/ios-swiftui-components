/*
 * Copyright 2023 HM Revenue & Customs
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
    public struct IconButtonWithDisclosureView: View {
        public let model: Model

        @State private var selected: Bool = false
        @State private var currentGeometry: GeometryProxy?

        public init(model: Model) {
            self.model = model
        }
        private let spacing = CGFloat(12)
        public var body: some View {
            HStack {
                if let icon = model.icon {
                    Components.Atoms.ImageAligningHStack(spacing: spacing) {
                        icon
                            .foregroundColor(model.iconTintColor)
                            .accessibility(hidden: true)
                            .frame(height: FontMetrics.scaledValue(for: .spacer24))
                    } rightContent: {
                        Text(model.title)
                            .style(.link)
                            .accessibility(hidden: true)
                    }
                    .padding(model.insets)
                    .frame(
                        maxWidth: .infinity,
                        alignment: .leading
                    )
                } else {
                    HStack {
                        Text(model.title)
                            .style(.link)
                            .accessibility(hidden: true)
                    }
                    .padding(model.insets)
                    .frame(
                        maxWidth: .infinity,
                        alignment: .leading
                    )
                }
                Image("ChevronRight", bundle: .module)
                    .padding(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: model.insets.trailing))
                    .accessibility(hidden: true)
            }
            .background(
                (selected ? model.highlightedBackgroundColour : model.normalBackgroundColour)
                    .accessibility(addTraits: .isButton)
                    .accessibility(hidden: false)
                    .accessibility(hint: Text(model.accessibilityHint ?? ""))
                    .accessibility(label: Text(model.title))
            )
            .background(GeometryReader { geometry in
                Color.clear.onAppear {
                    currentGeometry = geometry
                }
            })
            ._onButtonGesture(pressing: { pressing in
                selected = pressing
            }, perform: {
                model.handler()
            })
        }
    }
}

extension Components.Molecules.IconButtonWithDisclosureView {
    open class Model {
        public let icon: Image?
        public let title: String
        public let iconTintColor: Color?
        public let accessibilityHint: String?
        public let accessibilityIdentifier: String?
        public let insets: EdgeInsets
        public let normalBackgroundColour: Color
        public let highlightedBackgroundColour: Color
        public var handler: VoidHandler

        public init(icon: Image? = nil,
                    title: String,
                    iconTintColor: Color = TextStyle.link.textColor,
                    accessibilityHint: String? = nil,
                    accessibilityIdentifier: String? = nil,
                    insets: EdgeInsets = .init(
                        top: 16, leading: 0, bottom: 16, trailing: 0
                    ),
                    normalBackgroundColour: Color = .Semantic.cardBackground,
                    highlightedBackgroundColour: Color = .Semantic.secondaryButtonHighlightedBackground,
                    handler: @escaping VoidHandler
        ) {
            self.icon = icon
            self.title = title
            self.accessibilityHint = accessibilityHint
            self.accessibilityIdentifier = accessibilityIdentifier
            self.iconTintColor = iconTintColor
            self.insets = insets
            self.normalBackgroundColour = normalBackgroundColour
            self.highlightedBackgroundColour = highlightedBackgroundColour
            self.handler = handler
        }
    }
}

struct IconButtonWithDisclosureView_Previews: PreviewProvider {
    static var previews: some View {
        HStack(
            alignment: .top,
            spacing: .spacer16,
            content: {
                VStack(
                    alignment: .leading,
                    spacing: .spacer16,
                    content: {
                        Components.Molecules.IconButtonWithDisclosureView(
                            model: .init(
                                icon: Image(systemName: "moon.stars.fill"),
                                title: "Title",
                                iconTintColor: .blue,
                                accessibilityHint: "hint",
                                accessibilityIdentifier: "identifier",
                                handler: {
                                    print("Handler fired")
                                }
                             )
                        ).background(Color.Semantic.whiteBackground)
                        Components.Molecules.IconButtonWithDisclosureView(
                            model: .init(
                                icon: nil,
                                title: "Title",
                                iconTintColor: .blue,
                                accessibilityHint: "hint",
                                accessibilityIdentifier: "identifier",
                                handler: {
                                    print("Handler fired")
                                }
                             )
                        ).background(Color.Semantic.whiteBackground)
                    }
                ).frame(
                    maxWidth: .infinity,
                    maxHeight: .infinity,
                    alignment: .leading
                ).background(
                    Color.Semantic.pageBackground
                ).padding()
            }
        ).background(Color.Semantic.pageBackground)
    }
}

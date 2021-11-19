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
    public struct IconButtonView: View {
        let model: Model
        
        public init(model: Model) {
            self.model = model
        }
        private let spacing = CGFloat(12)
        public var body: some View {
            Components.Atoms.ImageAligningHStack(spacing: spacing) {
                model.icon
                    .foregroundColor(model.iconTintColor)
                    .accessibility(hidden: true)
            } rightContent: {
                Text(model.title)
                    .style(.link)
                    .accessibility(hidden: true)
            }
            .padding(model.insets)
            .frame(maxWidth: .infinity, alignment: .leading)
            .background(
                Color.clear
                    .accessibility(addTraits: .isButton)
                    .accessibility(hidden: false)
                    .accessibility(hint: Text(model.accessibilityHint ?? ""))
                    .accessibility(label: Text(model.title))
            )
            
            .onTapGesture {
                model.handler()
            }
        }
    }
}

extension Components.Molecules.IconButtonView {
    open class Model {
        public let icon: Image
        public let title: String
        public let iconTintColor: Color?
        public let accessibilityHint: String?
        public let accessibilityIdentifier: String?
        public let insets: EdgeInsets
        public var handler: VoidHandler
        
        public init(icon: Image,
                    title: String,
                    iconTintColor: Color? = nil,
                    accessibilityHint: String? = nil,
                    accessibilityIdentifier: String? = nil,
                    insets: EdgeInsets = .init(padding: .spacer16),
                    handler: @escaping VoidHandler
        ) {
            self.icon = icon
            self.title = title
            self.accessibilityHint = accessibilityHint
            self.accessibilityIdentifier = accessibilityIdentifier
            self.iconTintColor = iconTintColor
            self.handler = handler
            self.insets = insets
        }
    }
}

struct IconButtonView_Previews: PreviewProvider {
    static var previews: some View {
        HStack(
            alignment: .top,
            spacing: .spacer16,
            content: {
                VStack(
                    alignment: .leading,
                    spacing: .spacer16,
                    content: {
                        Components.Molecules.IconButtonView(
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

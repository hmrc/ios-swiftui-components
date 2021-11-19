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
    public struct WarningView: View {
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
                    .style(.bold)
                    .accessibility(hint: Text(model.accessibilityHint ?? ""))
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            .background(
                Color.clear
                    .accessibility(hidden: false)
                    .accessibility(label: Text("Warning; \(model.title)"))
            )
        }
    }
}

extension Components.Molecules.WarningView {
    open class Model {
        public let icon: Image
        public let title: String
        public let iconTintColor: Color?
        public let accessibilityHint: String?
        public let accessibilityIdentifier: String?
        
        public init(icon: Image,
                    title: String,
                    iconTintColor: Color? = nil,
                    accessibilityHint: String? = nil,
                    accessibilityIdentifier: String? = nil
        ) {
            self.icon = icon
            self.title = title
            self.accessibilityHint = accessibilityHint
            self.accessibilityIdentifier = accessibilityIdentifier
            self.iconTintColor = iconTintColor
        }
    }
}

struct WarningView_Previews: PreviewProvider {
    static var previews: some View {
        HStack(
            alignment: .top,
            spacing: .spacer16,
            content: {
                VStack(
                    alignment: .leading,
                    spacing: .spacer16,
                    content: {
                        Components.Molecules.WarningView(
                            model: .init(
                                icon: Image(systemName: "moon.stars.fill"),
                                title: "Title",
                                iconTintColor: .blue,
                                accessibilityHint: "hint",
                                accessibilityIdentifier: "identifier"
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

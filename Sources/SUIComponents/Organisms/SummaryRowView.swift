/*
 * Copyright 2022 HM Revenue & Customs
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
    public struct SummaryRowView<Content: View>: View {

        let model: Model

        public init(model: Model) {
            self.model = model
        }

        public var body: some View {
            HStack(alignment: .center, spacing: .spacer16) {
                if let icon = model.icon, let tint = model.iconTint {
                    icon.resizable()
                        .frame(width: .spacer24, height: .spacer24)
                        .foregroundColor(tint)
                        .accessibility(hidden: true)
                }
                VStack(
                    alignment: .leading,
                    spacing: .spacer8,
                    content: {
                        if !model.title.isEmpty {
                            Text(model.title, style: .bold)
                        }
                        model.rowViews
                    }
                )
            }.cardView(
                backgroundColor: .clear,
                disclosureAction: model.disclosureAction
            )
        }
    }
}

extension Components.Organisms.SummaryRowView {
    public struct Model {
        public let title: String
        public let rowViews: Content
        public let icon: Image?
        public let iconTint: Color?
        public let insets: EdgeInsets
        public let disclosureAction: VoidHandler?
        public let accessibilityIdentifier: String?
        public let accessibilityLabel: String?
        public let accessibilityHint: String?

        public init(title: String,
                    @ViewBuilder rowViews: () -> Content,
                    icon: Image? = nil,
                    iconTint: Color? = nil,
                    insets: EdgeInsets = .init(padding: .spacer16),
                    disclosureAction: VoidHandler? = nil,
                    accessibilityIdentifier: String? = nil,
                    accessibilityLabel: String? = nil,
                    accessibilityHint: String? = nil) {
            self.title = title
            self.rowViews = rowViews()
            self.icon = icon
            self.iconTint = iconTint
            self.insets = insets
            self.disclosureAction = disclosureAction
            self.accessibilityIdentifier = accessibilityIdentifier
            self.accessibilityLabel = accessibilityLabel
            self.accessibilityHint = accessibilityHint
        }
    }
}

struct SummaryRowView_Previews: PreviewProvider {
    static var previews: some View {
        VStack(
            alignment: .leading,
            spacing: .spacer16,
            content: {
                Components.Organisms.SummaryRowView(
                    model: .init(
                        title: "Title",
                        rowViews: {

                        }
                    )
                )
            }
        ).frame(
            maxWidth: .infinity,
            maxHeight: .infinity,
            alignment: .leading
        ).background(Color.gray)
    }
}

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

/*
 public let icon: UIImage
 public let iconSize: CGSize
 public let title: String
 public let body: NSAttributedString?
 public let buttonModel: ButtonModel?
 public let iconTintColor: UIColor?
 */

extension Components.Organisms {
    public struct StatusCardView<Content: View>: View {
        let icon: Image
        let title: String
        let bodyString: String?
        let buttonModel: Components.Molecules.StatusView.Model.ButtonModel?
        let journeyId: String?
        let insets: EdgeInsets
        let itemSpacing: CGFloat
        let content: Content

        public init(
            icon: Image,
            title: String,
            body: String? = nil,
            buttonModel: Components.Molecules.StatusView.Model.ButtonModel? = nil,
            journeyId: String? = nil,
            insets: EdgeInsets = .init(padding: .spacer16),
            itemSpacing: CGFloat = .spacer16,
            @ViewBuilder content: () -> Content
        ) {
            self.icon = icon
            self.title = title
            self.bodyString = body
            self.buttonModel = buttonModel
            self.journeyId = journeyId
            self.insets = insets
            self.itemSpacing = itemSpacing
            self.content = content()
        }

        public var body: some View {
            VStack(
                spacing: itemSpacing,
                content: {
                    Components.Molecules.StatusView(
                        model: .init(
                            icon: icon,
                            title: title,
                            body: bodyString,
                            buttonModel: buttonModel
                        )
                    )
                    content
                    if let journeyId = journeyId {
                        Text(journeyId).style(.debug)
                    }
                }
            ).frame(
                maxWidth: .infinity
            ).cardView(insets: insets)
        }
    }
}

extension Components.Organisms.StatusCardView where Content == EmptyView {
    public init(
        icon: Image,
        title: String,
        body: String? = nil,
        buttonModel: Components.Molecules.StatusView.Model.ButtonModel? = nil,
        journeyId: String? = nil,
        insets: EdgeInsets = .init(padding: .spacer16),
        itemSpacing: CGFloat = 0) {
        self.init(
            icon: icon,
            title: title,
            body: body,
            buttonModel: buttonModel,
            journeyId: journeyId,
            insets: insets,
            itemSpacing: itemSpacing,
            content: { EmptyView() }
        )
    }
}

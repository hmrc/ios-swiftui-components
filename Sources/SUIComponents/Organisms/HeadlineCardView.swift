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
    public struct HeadlineCardView<Content: View>: View {
        let title: String
        let headline: Text
        let insets: EdgeInsets
        let itemSpacing: CGFloat
        let content: Content
        let disclosureModel: DisclosureView.Model?

        public init(
            title: String,
            @ViewBuilder headline: () -> Text,
            insets: EdgeInsets = EdgeInsets(padding: .spacer16),
            itemSpacing: CGFloat = .spacer16,
            disclosureModel: DisclosureView.Model? = nil,
            @ViewBuilder content: () -> Content
        ) {
            self.title = title
            self.headline = headline()
            self.insets = insets
            self.itemSpacing = itemSpacing
            self.content = content()
            self.disclosureModel = disclosureModel
        }

        public var body: some View {
            VStack(
                alignment: .leading,
                spacing: itemSpacing,
                content: {
                    VStack(spacing: itemSpacing) {
                        Text(title)
                            .style(.H5)
                            .frame(maxWidth: .infinity, alignment: .leading)
                        headline
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .fixedSize(horizontal: false, vertical: true)
                        content
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .fixedSize(horizontal: false, vertical: true)
                    }
                }
            )
            .cardView(insets: insets, disclosureModel: disclosureModel)
        }
    }
}

extension Components.Organisms.HeadlineCardView {
    public init(
        title: String,
        headline: String,
        headlineStyle: TextStyle = .H3,
        insets: EdgeInsets = EdgeInsets(padding: .spacer16),
        itemSpacing: CGFloat = .spacer16,
        disclosureModel: DisclosureView.Model? = nil,
        @ViewBuilder content: () -> Content
    ) {
        self.init(title: title, headline: {
            Text(headline, style: headlineStyle)
        }, insets: insets, itemSpacing: itemSpacing, disclosureModel: disclosureModel, content: content)
    }

    public init(
        title: String,
        currencyAmount: Decimal,
        insets: EdgeInsets = EdgeInsets(padding: .spacer16),
        itemSpacing: CGFloat = .spacer16,
        disclosureModel: DisclosureView.Model? = nil,
        @ViewBuilder content: () -> Content
    ) {
        let pounds = currencyAmount.whole
        let pence = currencyAmount.fractional

        self.init(title: title, headline: {
            Text(pounds: pounds, pence: pence, poundsFont: Font.H3.font(), penceFont: Font.H5.font())

        }, insets: insets, itemSpacing: itemSpacing, disclosureModel: disclosureModel, content: content)
    }
}

struct HeadlineCardView_Previews: PreviewProvider {
    static var previews: some View {
        HStack(
            alignment: .top,
            spacing: .spacer16,
            content: {
                VStack(
                    alignment: .leading,
                    spacing: .spacer16,
                    content: {
                        Components.Organisms.HeadlineCardView(
                            title: "A title",
                            headline: {
                                Text("")
                            },
                            content: {
                            }
                        )
                    }
                )
            }
        ).frame(
            maxWidth: .infinity,
            maxHeight: .infinity,
            alignment: .top
        ).background(Color.Semantic.pageBackground)
    }
}

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
    public struct HeadlineCardView: View {
        let title: String
        let headline: AnyView
        let insets: EdgeInsets
        let itemSpacing: CGFloat
        let content: AnyView
        let disclosureAction: VoidHandler?

        public init(
            title: String,
            @ViewBuilder headline: () -> AnyView,
            insets: EdgeInsets = EdgeInsets(padding: .spacer16),
            itemSpacing: CGFloat = .spacer16,
            disclosureAction: VoidHandler? = nil,
            @ViewBuilder content: () -> AnyView
        ) {
            self.title = title
            self.headline = headline()
            self.insets = insets
            self.itemSpacing = itemSpacing
            self.content = content()
            self.disclosureAction = disclosureAction
        }

        public var body: some View {
            VStack(
                alignment: .leading,
                spacing: itemSpacing,
                content: {
                    VStack(spacing: itemSpacing) {
                        Text(title)
                            .style(.H5)
                            .accessibility(label: Text("\(title), heading"))
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .accessibility(label: Text("\(title), heading"))
                        headline
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .fixedSize(horizontal: false, vertical: true)
                        content
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .fixedSize(horizontal: false, vertical: true)
                    }
                }
            )
            .cardView(insets: insets, disclosureAction: disclosureAction)
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
        disclosureAction: VoidHandler? = nil,
        @ViewBuilder content: () -> AnyView
    ) {
        self.init(title: title, headline: {
            Text(headline, style: headlineStyle)
                .typeErased
        }, insets: insets, itemSpacing: itemSpacing, disclosureAction: disclosureAction, content: content)
    }

    public init(
        title: String,
        currencyAmount: Decimal,
        insets: EdgeInsets = EdgeInsets(padding: .spacer16),
        itemSpacing: CGFloat = .spacer16,
        disclosureAction: VoidHandler? = nil,
        @ViewBuilder content: () -> AnyView
    ) {
        let pounds = currencyAmount.whole
        let pence = currencyAmount.fractional

        self.init(title: title, headline: {
            Text(pounds: pounds, pence: pence, poundsFont: Font.H3.font(), penceFont: Font.H5.font())
                .accessibility(label: Text("£\(pounds).\(pence)"))
                .typeErased

        }, insets: insets, itemSpacing: itemSpacing, disclosureAction: disclosureAction, content: content)
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
                                    .typeErased
                            },
                            content: {
                                EmptyView().typeErased
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

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
    public struct PrimaryCardView<Content: View>: View {
        let title: String
        let insets: EdgeInsets
        let itemSpacing: CGFloat
        let content: Content

        public init(
            title: String,
            insets: EdgeInsets = EdgeInsets(padding: .spacer16),
            itemSpacing: CGFloat = .spacer16,
            @ViewBuilder content: () -> Content
        ) {
            self.title = title
            self.insets = insets
            self.itemSpacing = itemSpacing
            self.content = content()
        }

        public var body: some View {
            VStack(
                alignment: .leading,
                spacing: itemSpacing,
                content: {
                    Text(title)
                        .style(.H5)
                    content
                }
            ).cardView(insets: insets)
        }
    }
}

extension Components.Organisms.PrimaryCardView where Content == EmptyView {
    public init(
        title: String,
        insets: EdgeInsets = EdgeInsets(padding: .spacer16),
        itemSpacing: CGFloat = .spacer16) {
        self.init(
            title: title,
            insets: insets,
            itemSpacing: itemSpacing,
            content: { EmptyView() }
        )
    }
}

struct PrimaryCardView_Previews: PreviewProvider {
    static var previews: some View {
        HStack(
            alignment: .top,
            spacing: .spacer16,
            content: {
                VStack(
                    alignment: .leading,
                    spacing: .spacer16,
                    content: {
                        Components.Organisms.PrimaryCardView(
                            title: "A title"
                        )

                        Components.Organisms.PrimaryCardView(
                            title: "A title",
                            content: {
                                Text("A body")
                            }
                        )

                        Components.Organisms.PrimaryCardView(
                            title: "A title",
                            insets: .init(padding: .spacer24),
                            itemSpacing: .spacer24,
                            content: {
                                Text("A body")
                                Button("Button title") {
                                    print("tapped")
                                }.styled(.primary())
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

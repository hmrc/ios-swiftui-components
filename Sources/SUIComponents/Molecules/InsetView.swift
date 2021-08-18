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
    public struct InsetView<Content: View>: View {
        private let title: String?
        private let content: Content

        public init(
            title: String? = nil,
            @ViewBuilder content: () -> Content
        ) {
            self.title = title
            self.content = content()
        }

        public var body: some View {
            HStack(
                alignment: .top,
                spacing: .spacer16,
                content: {
                    Rectangle()
                        .fill(Color.Semantic.insetBar)
                        .frame(maxWidth: 4)
                    VStack(
                        alignment: .leading,
                        spacing: .spacer16,
                        content: {
                            if let title = self.title {
                                Text(title)
                                    .style(.body)
                            } else if let content = self.content {
                                content
                            }
                        }
                    )
                }
            ).cardView()
            .fixedSize(horizontal: false, vertical: true)
        }
    }
}

extension Components.Molecules.InsetView where Content == EmptyView {
    public init(
        title: String
    ) {
        self.init(
            title: title,
            content: { EmptyView() }
        )
    }
}

struct InsetView_Previews: PreviewProvider {
    static var previews: some View {
        HStack(
            alignment: .top,
            spacing: .spacer16,
            content: {
                VStack(
                    alignment: .leading,
                    spacing: .spacer16,
                    content: {
                        Components.Molecules.InsetView(
                            title: "A title"
                        )

                        Components.Molecules.InsetView {
                            Text("A body")
                            Text("Another very very very very very very very very very very very very very very very very very very very loooooooong body")
                        }
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

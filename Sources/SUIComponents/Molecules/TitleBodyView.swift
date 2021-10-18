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
    public struct TitleBodyView: View {
        public struct Model {
            let title: String
            let body: String
            let style: TextStyle

            public init(
                title: String,
                body: String,
                style: TextStyle
            ) {
                self.title = title
                self.body = body
                self.style = style
            }
        }

        let model: Model

        public init(model: Model) {
            self.model = model
        }

        public var body: some View {
            VStack(
                alignment: .leading,
                spacing: .spacer8,
                content: {
                    Text(model.title)
                        .style(model.style)
                    if !model.body.isEmpty {
                        Text(model.body)
                    }
                }
            ).frame(
                maxWidth: .infinity,
                alignment: .leading
            )
        }
    }
}

struct TitleBodyView_Previews: PreviewProvider {
    static var previews: some View {
        VStack(
            alignment: .leading,
            spacing: .spacer16,
            content: {
                Components.Molecules.TitleBodyView(
                    model: .init(
                        title: "H3 Title",
                        body: "H3 Body",
                        style: .H3
                    )
                )
                Components.Molecules.TitleBodyView(
                    model: .init(
                        title: "H4 Title",
                        body: "H4 Body",
                        style: .H4
                    )
                )
                Components.Molecules.TitleBodyView(
                    model: .init(
                        title: "H5 Title",
                        body: "H5 Body",
                        style: .H5
                    )
                )
                Components.Molecules.TitleBodyView(
                    model: .init(
                        title: "Bold Title",
                        body: "Bold Body",
                        style: .bold
                    )
                )
                Components.Molecules.TitleBodyView(
                    model: .init(
                        title: "Body Title",
                        body: "Body Body",
                        style: .body
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

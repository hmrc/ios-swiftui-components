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
        public struct Model {
            let content: Content

            public init(@ViewBuilder content: () -> Content) {
                self.content = content()
            }
        }

        let model: Model

        public init(model: Model) {
            self.model = model
        }

        public var body: some View {
            HStack(
                alignment: .center,
                spacing: .spacer8,
                content: {
                    Rectangle()
                        .foregroundColor(Color.Semantic.insetBar)
                        .frame(width: 4)
                    model.content
                }
            ).frame(
                maxWidth: .infinity,
                alignment: .leading
            )
        }
    }
}

struct InsetView_Previews: PreviewProvider {
    static var previews: some View {
        VStack(
            alignment: .leading,
            spacing: .spacer16,
            content: {
                Components.Molecules.InsetView(
                    model: .init(
                        body: "Body"
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

extension Components.Molecules.InsetView.Model where Content == AnyView {
    public init(body: String) {
        self.init {
            Text(body)
                .style(.body)
                .fixedSize(horizontal: false, vertical: true)
                .typeErased
        }
    }
}

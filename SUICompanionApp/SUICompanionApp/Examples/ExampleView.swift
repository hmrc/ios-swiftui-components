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
import SUIComponents

struct ExampleView<Component: Examplable>: View {
    var body: some View {
        ScrollView(.vertical) {
            VStack(alignment: .leading, spacing: .spacer16) {
                Text("Placeholders:")
                    .style(.bold)
                Component.withPlaceholders()
                    .background(
                        Example.Images.previewBackground.image
                            .resizable(resizingMode: .tile)
                    )
                Text("Examples:")
                    .style(.bold)
                Component.examples()
            }
            .padding(.spacer16)
        }
        .background(Component.exampleBackgroundColor)
        .navigationTitle(Component.title)
    }
}

struct ExampleView_Previews: PreviewProvider {
    static var previews: some View {
        ExampleView<Components.Molecules.StatusView>()
    }
}
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

extension Components.Organisms.PrimaryCardView: Examplable {
    static var title: String { "PrimaryCardView" }

    static var exampleBackgroundColor: Color { Color.Semantic.pageBackground }

    static func withPlaceholders() -> AnyView {
        AnyView(
            Components.Organisms.PrimaryCardView(
                title: "Primary Card View"
            )
        )
    }

    static func examples() -> AnyView {
        AnyView(
            VStack(spacing: .spacer16) {
                Components.Organisms.PrimaryCardView(
                    title: "Rewew your tax credits") {
                    Text("Renew your tax credits or check the progress of your claims").style(.body)
                }
                Components.Organisms.PrimaryCardView(
                    title: "Rewew your tax credits") {
                    VStack(alignment: .leading) {
                        Text("Rewew your tax credits")
                            .style(.body)
                        Button("Renew or check my claims") {
                            print("Renew Tapped")
                        }.styled(.primary)
                    }
                }
                Components.Organisms.PrimaryCardView(
                    title: Example.Text.longerIpsum) {
                    VStack(alignment: .leading, spacing: .spacer8) {
                        Text(Example.Text.longestIpsum)
                            .style(.body)
                        Button(Example.Text.longIpsum) {
                            print("Lorem")
                        }.styled(.secondary(padding: 0))
                    }
                }
            }
        )
    }
}

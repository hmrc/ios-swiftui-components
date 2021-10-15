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

extension Text: Examplable {
    static var title: String {
        "Text Styles"
    }

    static var exampleBackgroundColor: Color {
        return Color.Named.white.raw
    }

    static func withPlaceholders() -> AnyView {
        return AnyView(
            Text("Title")
                .style(.H3)
                .frame(maxWidth: .infinity)
        )
    }

    static func examples() -> AnyView {
        return AnyView(
            VStack(alignment: .leading, spacing: .spacer16) {
                Text("H3 Text").style(.H3)
                Text("H4 Text").style(.H4)
                Text("H5 Text").style(.H5)
                Text("Bold Text").style(.bold)
                Text("Body Text").style(.body)
                Text("Info Text").style(.info)
                Text("Link Text").style(.link)
                Text("Error Text").style(.error)
            }
        )
    }
}

// I had to make a struct here instead of
// extension Button: Examplable {
// As I was getting strange generics errors:
// "`button` requires the types `label` and `text` to be equivalent"
struct ExampleButton: Examplable {
    static var title: String {
        "Button Styles"
    }

    static var exampleBackgroundColor: Color {
        return Color.Named.white.raw
    }

    static func withPlaceholders() -> AnyView {
        AnyView(
            Button("Title") {
                print("Lorem")
            }.styled(.primary)
        )
    }

    static func examples() -> AnyView {
        AnyView(
            VStack(spacing: .spacer16) {
                Button("Primary Button") {
                    print("Lorem")
                }.styled(.primary)
                Button("Secondary Button") {
                    print("Lorem")
                }.styled(.secondary(padding: 0))
            }
        )
    }
}

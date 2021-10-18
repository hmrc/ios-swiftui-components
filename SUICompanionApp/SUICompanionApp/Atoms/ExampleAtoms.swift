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
    static var title: String { "Text Styles" }

    static var exampleBackgroundColor: Color { Color.Named.white.raw }

    static func withPlaceholders() -> AnyView {
        AnyView(
            Text("Title")
                .style(.H3)
                .frame(maxWidth: .infinity)
        )
    }

    static func examples() -> AnyView {
        AnyView(
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
    static var title: String { "Button Styles" }

    static var exampleBackgroundColor: Color { Color.Named.white.raw }

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

extension Switch: Examplable {
    static var title: String { "Switch" }

    static var exampleBackgroundColor: Color { Color.Named.white.raw }

    static func withPlaceholders() -> AnyView {
        AnyView(
            Switch(
                isOn: binding(initialState: false),
                onTintColor: Color.Semantic.switchTint,
                borderColor: Color.Named.grey2.raw,
                borderWidth: 1,
                cornerRadius: 14.0
            ).frame(maxWidth: .infinity)
        )
    }

    static func examples() -> AnyView {
        AnyView(
            VStack(alignment: .leading, spacing: .spacer16) {
                Switch(
                    isOn: binding(initialState: true),
                    onTintColor: .red,
                    borderColor: .black,
                    borderWidth: 2,
                    cornerRadius: 14.0
                )
                Switch(
                    isOn: binding(initialState: true),
                    onTintColor: .orange,
                    borderColor: .clear,
                    borderWidth: 0,
                    cornerRadius: 14.0
                )
                Switch(
                    isOn: binding(initialState: true),
                    onTintColor: .yellow,
                    borderColor: Color.Named.grey2.raw,
                    borderWidth: 1,
                    cornerRadius: 0
                )
                Switch(
                    isOn: binding(initialState: true),
                    onTintColor: .green,
                    borderColor: Color.Named.grey2.raw,
                    borderWidth: 0,
                    cornerRadius: 14.0
                )
                Switch(
                    isOn: binding(initialState: true),
                    onTintColor: .blue,
                    borderColor: .blue,
                    borderWidth: 1,
                    cornerRadius: 0
                )
                Switch(
                    isOn: binding(initialState: true),
                    onTintColor: Color(hexString: "#4B0082"),
                    borderColor: Color.Named.grey2.raw,
                    borderWidth: 1,
                    cornerRadius: 14.0
                )
                Switch(
                    isOn: binding(initialState: true),
                    onTintColor: Color(hexString: "#8F00FF"),
                    borderColor: Color.Named.grey2.raw,
                    borderWidth: 1,
                    cornerRadius: 14.0
                )
            }
        )
    }

    private static func binding(initialState: Bool) -> Binding<Bool> {
        var isOnVar = initialState
        let isOnBinding = Binding<Bool> {
            isOnVar
        } set: { isOn in
            isOnVar = isOn
            print("Switch Value did change: \(isOnVar)")
        }
        return isOnBinding
    }
}

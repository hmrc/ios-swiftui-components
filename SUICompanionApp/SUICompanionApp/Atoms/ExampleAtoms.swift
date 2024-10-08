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

    static var exampleBackgroundColor: Color { Color.Named.white.colour }

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
                Text("Bold Error Text").style(.errorBold)
                Text("Bold Link Text").style(.linkBold)
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
extension Components.Atoms {
    struct ExampleButton: Examplable {
        static var title: String { "Button Styles" }

        static var exampleBackgroundColor: Color { Color.Named.white.colour }

        static func withPlaceholders() -> AnyView {
            AnyView(
                Button("Title") {
                    print("Lorem")
                }.styled(.primary())
            )
        }

        static func examples() -> AnyView {
            AnyView(
                VStack(spacing: .spacer16) {
                    Button("Primary Button") {
                        print("Lorem")
                    }.styled(.primary())
                    Button("Disabled primary Button") {
                        print("Disabled tapped, this shouldnt fire!")
                    }
                    .styled(.primary(enabled: false))
                    .disabled(true)
                    
                    Button("Secondary Button") {
                        print("Lorem")
                    }.styled(.secondary())
                    Button("Secondary Button Left Aligned") {
                        print("Lorem")
                    }.styled(.secondary(alignment: .leading))
                }
            )
        }
    }
}

extension Components.Atoms.Switch: Examplable {
    static var title: String { "Switch" }

    static var exampleBackgroundColor: Color { Color.Named.white.colour }

    static func withPlaceholders() -> AnyView {
        AnyView(
            Self(
                isOn: binding(initialState: false),
                onTintColor: Color.Semantic.switchTint,
                borderColor: Color.Named.grey2.colour,
                borderWidth: 1,
                cornerRadius: 14.0
            ).frame(maxWidth: .infinity)
        )
    }

    static func examples() -> AnyView {
        AnyView(
            VStack(alignment: .leading, spacing: .spacer16) {
                Self(
                    isOn: binding(initialState: true),
                    onTintColor: .red,
                    borderColor: .black,
                    borderWidth: 2,
                    cornerRadius: 14.0
                )
                Self(
                    isOn: binding(initialState: true),
                    onTintColor: .orange,
                    borderColor: .clear,
                    borderWidth: 0,
                    cornerRadius: 14.0
                )
                Self(
                    isOn: binding(initialState: true),
                    onTintColor: .yellow,
                    borderColor: Color.Named.grey2.colour,
                    borderWidth: 1,
                    cornerRadius: 0
                )
                Self(
                    isOn: binding(initialState: true),
                    onTintColor: .green,
                    borderColor: Color.Named.grey2.colour,
                    borderWidth: 0,
                    cornerRadius: 14.0
                )
                Self(
                    isOn: binding(initialState: true),
                    onTintColor: .blue,
                    borderColor: .blue,
                    borderWidth: 1,
                    cornerRadius: 0
                )
                Self(
                    isOn: binding(initialState: true),
                    onTintColor: Color(hexString: "#4B0082"),
                    borderColor: Color.Named.grey2.colour,
                    borderWidth: 1,
                    cornerRadius: 14.0
                )
                Self(
                    isOn: binding(initialState: true),
                    onTintColor: Color(hexString: "#8F00FF"),
                    borderColor: Color.Named.grey2.colour,
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

extension Components.Atoms.TextView: Examplable {
    static var title: String { "TextView" }

    static var exampleBackgroundColor: Color { Color.Named.white.colour }

    struct ViewWrapper: View {
        @State var text: String
        @State var height: CGFloat = 0
        @State var editing: Bool = false
        @State var isSecureField: Bool = false

        private let isScrollEnabled: Bool
        private let multiLine: Bool
        private let maxLength: Int
        private let enforceMaxLength: Bool
        private let accentColor: Color
        private let borderColor: Color
        private let borderWidth: CGFloat
        private let cornerRadius: CGFloat
        private let shouldChangeText: TextViewShouldChangeHandler?
        private let didEndInput: VoidHandler?

        init(
            initialText: String = "",
            isScrollEnabled: Bool = false,
            multiLine: Bool = false,
            maxLength: Int = 0,
            enforceMaxLength: Bool = true,
            accentColor: Color? = nil,
            borderColor: Color? = Color.Named.grey2.colour,
            borderWidth: CGFloat? = 1.0,
            cornerRadius: CGFloat? = 4.0,
            shouldChangeText: TextViewShouldChangeHandler? = nil,
            _ didEndInput: VoidHandler? = nil) {
            self.text = initialText
            self.isScrollEnabled = isScrollEnabled
            self.multiLine = multiLine
            self.maxLength = maxLength
            self.enforceMaxLength = enforceMaxLength
            self.accentColor = accentColor ?? .blue
            self.borderColor = borderColor ?? .gray
            self.borderWidth = borderWidth ?? 0.0
            self.cornerRadius = cornerRadius ?? 0.0
            self.shouldChangeText = shouldChangeText
            self.didEndInput = didEndInput
        }

        var body: some View {
            Components.Atoms.TextView(
                text: $text,
                height: $height,
                editing: $editing,
                isScrollEnabled: isScrollEnabled,
                multiLine: multiLine,
                maxLength: maxLength,
                enforceMaxLength: enforceMaxLength,
                accentColor: accentColor,
                borderColor: borderColor,
                borderWidth: borderWidth,
                cornerRadius: cornerRadius
            ).frame(height: height)
        }
    }

    static func withPlaceholders() -> AnyView {
        AnyView(
            ViewWrapper(
                initialText: "Text"
            )
        )
    }

    static func examples() -> AnyView {
        AnyView(
            VStack {
                ViewWrapper(initialText: "With Initial Text")
                ViewWrapper(
                    initialText: "Enforce character limit (30)",
                    isScrollEnabled: false,
                    multiLine: false,
                    maxLength: 30,
                    enforceMaxLength: true
                )
                ViewWrapper(
                    initialText: "Multi line enabled\nReturn add a newline instead of closing the textview",
                    multiLine: true
                )
                ViewWrapper(
                    initialText: "Customisable UI",
                    accentColor: .orange,
                    borderColor: .red,
                    borderWidth: 1.0,
                    cornerRadius: 4.0
                )
            }
        )
    }
}
extension Components.Atoms.ImageAligningHStack: Examplable {
    static var title: String { "ImageAligningHStack" }

    static var exampleBackgroundColor: Color { Color.Semantic.pageBackground }

    static func withPlaceholders() -> AnyView {
        AnyView(
            Components.Atoms.ImageAligningHStack(spacing: 10, leftContent: {
                Text("Left view")
            }) {
                Text("Right view")
            }
                 
        )
    }

    static func examples() -> AnyView {
        AnyView(VStack(spacing: .spacer16) {
            Components.Atoms.ImageAligningHStack(spacing: 10, leftContent: {
                Example.Images.info.image
            }) {
                Text("A single line of text")
            }.cardView()
            Components.Atoms.ImageAligningHStack(spacing: 10, leftContent: {
                Example.Images.info.image
            }) {
                Text("Multiple lines\nof text")
            }.cardView()
        })
    }
}

extension Components.Atoms.Divider: Examplable {
    static var title: String { "Divider" }

    static var exampleBackgroundColor: Color { Color.Semantic.pageBackground }

    static func withPlaceholders() -> AnyView {
        AnyView(
            Components.Atoms.Divider()
        )
    }

    static func examples() -> AnyView {
        AnyView(VStack(spacing: .spacer16) {
            Text(Example.Text.longIpsum)
            Components.Atoms.Divider()
            Text(Example.Text.longIpsum)
            Components.Atoms.Divider()
            Text(Example.Text.longIpsum)
        }.cardView())
    }
}

extension Components.Atoms.AttributedText: Examplable {
    static var title: String { "AttributedText" }

    static var exampleBackgroundColor: Color { Color.Semantic.pageBackground }

    static func withPlaceholders() -> AnyView {
        AnyView(
            Components.Atoms.AttributedText(NSAttributedString(string: "Attributed Text"))
        )
    }

    static func examples() -> AnyView {
        AnyView(VStack(spacing: .spacer16) {
            Components.Atoms.AttributedText(NSAttributedString(string: "Attributed Text"))
            Components.Atoms.Text(
                "CS 70 01 00 A",
                accessibilityAttributedLabel: NSAttributedString(
                    string: "CS700100A",
                    attributes: [.accessibilitySpeechSpellOut: true]
                )
            )
            Components.Atoms.AttributedText(NSAttributedString(
                string: "CS 70 01 00 A",
                attributes: [.accessibilitySpeechSpellOut: true]
            ))
        }.cardView())
    }
}

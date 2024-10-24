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


extension Components.Molecules.IconButtonWithDisclosureView: Examplable {
    static var title: String { "IconButtonWithDisclosureView" }

    static var exampleBackgroundColor: Color { Color.Semantic.pageBackground }

    static func withPlaceholders() -> AnyView {
        AnyView(
            VStack {
                Components.Molecules.IconButtonWithDisclosureView(
                    model: .init(
                        icon: Example.Images.info.image,
                        title: "Title",
                        normalBackgroundColour: .clear,
                        handler: {}
                    )
                )
                Components.Atoms.SeparatorView()
                Components.Molecules.IconButtonWithDisclosureView(
                    model: .init(
                        title: "Title without icon",
                        normalBackgroundColour: .clear,
                        handler: {}
                    )
                )
            }
        )
    }

    static func examples() -> AnyView {
        AnyView(VStack(spacing: .spacer16) {
            Components.Molecules.IconButtonWithDisclosureView(
                model: .init(
                    icon: Example.Images.info.image,
                    title: "About your bonuses",
                    handler: {}
                )
            )
            VStack(spacing: 0) {
                Components.Molecules.IconButtonWithDisclosureView(
                    model: .init(
                        title: "General enquiries",
                        handler: {}
                    )
                )
                Components.Atoms.SeparatorView()
                Components.Molecules.IconButtonWithDisclosureView(
                    model: .init(
                        title: "Help and information",
                        handler: {}
                    )
                )
            }
        })
    }
}

extension Components.Molecules.WarningView: Examplable {
    static var title: String { "WarningView" }

    static var exampleBackgroundColor: Color { Color.Semantic.pageBackground }

    static func withPlaceholders() -> AnyView {
        AnyView(
            Components.Molecules.WarningView(
                model:
                    .init(
                        icon: Example.Images.info.image,
                        title: "Body Text",
                        iconTintColor: Color.Semantic.darkText,
                        accessibilityHint: "AccessibilityHint",
                        accessibilityIdentifier: "AccessibilityIdentifier"
                    )
            )
        )
    }

    static func examples() -> AnyView {
        AnyView(VStack(spacing: .spacer16) {
            Components.Molecules.WarningView(
                model:
                    .init(
                        icon: Example.Images.info.image,
                        title: "You must renew your tax credits by 31 July 2019",
                        iconTintColor: Color.Semantic.darkText,
                        accessibilityHint: "AccessibilityHint",
                        accessibilityIdentifier: "AccessibilityIdentifier"
                    )
            ).cardView()
            Components.Molecules.WarningView(
                model:
                    .init(
                        icon: Example.Images.info.image,
                        title: "We are currently working out your payments as your child is changing their education or training. This should be done by 7 September 2019.",
                        iconTintColor: Color.Semantic.darkText,
                        accessibilityHint: "AccessibilityHint",
                        accessibilityIdentifier: "AccessibilityIdentifier"
                    )
            ).cardView()
            Components.Molecules.WarningView(
                model:
                    .init(
                        icon: Example.Images.info.image,
                        title: Example.Text.longestIpsum,
                        iconTintColor: Color.Semantic.darkText,
                        accessibilityHint: "AccessibilityHint",
                        accessibilityIdentifier: "AccessibilityIdentifier"
                    )
            ).cardView()
         
        })
    }
}
extension Components.Molecules.IconButtonView: Examplable {
    static var title: String { "IconButtonView" }

    static var exampleBackgroundColor: Color { Color.Semantic.pageBackground }

    static func withPlaceholders() -> AnyView {
        AnyView(
            Components.Molecules.IconButtonView(
                model:
                    .init(
                        icon: Example.Images.info.image, 
                        title: "Title",
                        iconTintColor: TextStyle.link.textColor,
                        accessibilityHint: "AccessibilityHint",
                        accessibilityIdentifier: "AccessibilityIdentifier",
                        normalBackgroundColour: .clear,
                        handler: {
                            print("Icon Button View Tapped")
                        }
                    )
            )
        )
    }

    static func examples() -> AnyView {
        AnyView(VStack(spacing: .spacer16) {
            Components.Molecules.IconButtonView(
                model:
                    .init(
                        icon: Example.Images.help.image,
                        title: "About the calculator",
                        iconTintColor: TextStyle.link.textColor,
                        accessibilityIdentifier: "AccessibilityIdentifier",
                        insets: .init(padding:.spacer16),
                        handler: {
                            print("About the calculator Tapped")
                        }
                    )
            )
            Components.Molecules.IconButtonView(
                model:
                    .init(
                        icon: Example.Images.help.image,
                        title: Example.Text.longerIpsum,
                        iconTintColor: TextStyle.link.textColor,
                        accessibilityHint: "AccessibilityHint",
                        accessibilityIdentifier: "AccessibilityIdentifier",
                        insets: .init(padding:.spacer16),
                        handler: {
                            print("Lorem Ipsum tapped")
                        }
                    )
            )
        })
    }
}
extension Components.Molecules.StatusView: Examplable {
    static var title: String { "StatusView" }

    static var exampleBackgroundColor: Color { Color.Semantic.pageBackground }

    static func withPlaceholders() -> AnyView {
        AnyView(
            Components.Molecules.StatusView(
                model: .init(
                    icon: Example.Images.maintenance.image,
                    title: "Title",
                    body: "Body"
                )
            )
        )
    }

    static func examples() -> AnyView {
        AnyView(VStack(spacing: .spacer16) {
            Components.Molecules.StatusView(
                model: .init(
                    icon: Example.Images.maintenance.image,
                    title: "Service unavailable",
                    body: "You'll need to try again later."
                )
            ).cardView()
            Components.Molecules.StatusView(
                model: .init(
                    icon: Example.Images.info.image,
                    title: "Your Help to Save account closed on 21 May 2018"
                )
            ).cardView()
            Components.Molecules.StatusView(
                model: .init(
                    icon: Example.Images.coins.image,
                    title: Example.Text.longerIpsum,
                    body: Example.Text.longestIpsum,
                    iconTintColor: Color.Semantic.primaryButtonBackground
                )
            ).cardView()
        })
    }
}

extension Components.Molecules.TitleBodyView: Examplable {
    static var title: String { "TitleBodyView" }

    static var exampleBackgroundColor: Color { Color.Semantic.pageBackground }

    static func withPlaceholders() -> AnyView {
        AnyView(
            Components.Molecules.TitleBodyView(
                model: .init(
                    title: "Title",
                    body: "Body",
                    style: .H3
                )
            )
        )
    }

    static func examples() -> AnyView {
        AnyView(VStack(spacing: .spacer16) {
            Components.Molecules.TitleBodyView(
                model: .init(
                    title: "Pay As You Earn",
                    body: "6 April 2018 to 5 April 2019",
                    style: .H4
                )
            ).cardView()
            Components.Molecules.TitleBodyView(
                model: .init(
                    title: "You don't have any money in this account.",
                    body: "Your closing balance of £240 was transferred to your UK bank account on 28 February 2020.",
                    style: .H5
                )
            ).cardView()
            Components.Molecules.TitleBodyView(
                model: .init(
                    title: "Date and time",
                    body: "7 February 2019 at 17:12:45 GMT",
                    style: .bold
                )
            ).cardView()
            Components.Molecules.TitleBodyView(
                model: .init(
                    title: "Body label is only added shown if body parameter present",
                    body: "",
                    style: .bold
                )
            ).cardView()
        })
    }
}

extension Components.Molecules.SwitchRowView: Examplable {
    static var title: String { "SwitchRowView" }

    static var exampleBackgroundColor: Color { Color.Semantic.pageBackground }

    static func withPlaceholders() -> AnyView {
        AnyView(
            exampleView(
                initialState: false,
                titleBodyModel: .init(
                    title: "Switch Row Title",
                    body: "Switch Row Body",
                    style: .bold
                )
            )
        )
    }

    static func examples() -> AnyView {
        AnyView(
            VStack {
                exampleView(
                    initialState: true,
                    titleBodyModel: .init(
                        title: "Start of the month",
                        body: "Get a reminder on the first day of each month",
                        style: .bold
                    )
                ).cardView()
                exampleView(
                    initialState: false,
                    titleBodyModel: .init(
                        title: "End of the month",
                        body: "Get a reminder 5 days before the end of each month",
                        style: .bold
                    )
                ).cardView()
                exampleView(
                    initialState: false,
                    titleBodyModel: .init(
                        title: "Fingerprint ID",
                        body: "",
                        style: .bold
                    )
                ).cardView()
                exampleView(
                    initialState: false,
                    titleBodyModel: .init(
                        title: Example.Text.longIpsum,
                        body: "",
                        style: .bold
                    )
                ).cardView()
                exampleView(
                    initialState: true,
                    titleBodyModel: .init(
                        title: Example.Text.longIpsum,
                        body: Example.Text.longestIpsum,
                        style: .bold
                    )
                ).cardView()
            }
        )
    }

    private static func exampleView(initialState: Bool, titleBodyModel: Components.Molecules.TitleBodyView.Model) -> Components.Molecules.SwitchRowView {
        var isOnVar = initialState
        let isOnBinding = Binding<Bool> {
            isOnVar
        } set: { isOn in
            isOnVar = isOn
            print("SwitchRow Value did change: \(isOnVar)")
        }
        return Components.Molecules.SwitchRowView(
            isOn: isOnBinding,
            titleBodyModel: titleBodyModel
        )
    }
}

extension Components.Molecules.TextInputView: Examplable {
    static var title: String { "TextInputView" }

    static var exampleBackgroundColor: Color { Color.Semantic.pageBackground }

    struct ViewWrapper: View {
        @State var text: String
        let model: Components.Molecules.TextInputView.Model
        let error: String?

        init(initialText: String = "", model: Components.Molecules.TextInputView.Model, error: String? = nil) {
            self.text = initialText
            self.model = model
            self.error = error
        }

        var body: some View {
            Components.Molecules.TextInputView(
                text: $text,
                model: model,
                validationError: error
            )
        }
    }

    static func withPlaceholders() -> AnyView {
        AnyView(
            ViewWrapper(
                model: .init(
                    title: "Title",
                    hint: "Hint",
                    placeholder: "Placeholder",
                    leftViewText: "@leftText",
                    maxLength: 20
                ),
                error: "Validation Error"
            )
        )
    }

    static func examples() -> AnyView {
        AnyView(
            VStack(spacing: .spacer16) {
                ViewWrapper(
                    initialText: "Enter text",
                    model: .init(
                        title: "Enter text",
                        hint: "A hint message below the text. this is a descriptive hint message",
                        placeholder: "Enter text here please",
                        maxLength: 0
                    ), error: "error"
                ).cardView()
                ViewWrapper(
                    initialText: "Some text",
                    model: .init(
                        title: "Enter text",
                        placeholder: "Enter text here please",
                        maxLength: 0
                    )
                ).cardView()
                ViewWrapper(
                    initialText: "Some text",
                    model: .init(
                        title: "Enter text",
                        placeholder: "Enter text here please",
                        maxLength: 10
                    )
                ).cardView()
                ViewWrapper(
                    initialText: "Some text with limit not enforced",
                    model: .init(
                        title: "Enter text",
                        placeholder: "Enter text here please",
                        maxLength: 10,
                        enforceMaxLength: false
                    )
                ).cardView()
                ViewWrapper(
                    initialText: "Some text",
                    model: .init(
                        title: "Enter text",
                        placeholder: "Enter text here please",
                        maxLength: 100
                    ),
                    error: "Validation Error"
                ).cardView()
                ViewWrapper(
                    initialText: "Multi line\nMultiPass",
                    model: .init(
                        title:  "Multi Line",
                        maxLength: 100,
                        multiLine: true
                    )
                ).cardView()
            }
        )
    }
}

extension Components.Molecules.CurrencyInputView: Examplable {
    static var title: String { "CurrencyInputView" }

    static var exampleBackgroundColor: Color { Color.Semantic.pageBackground }

    struct ViewWrapper: View {
        @State var text: String
        let model: Components.Molecules.CurrencyInputView.Model
        let error: String?

        init(initialText: String = "", model: Components.Molecules.CurrencyInputView.Model, error: String? = nil) {
            self.text = initialText
            self.model = model
            self.error = error
        }

        var body: some View {
            Components.Molecules.CurrencyInputView(
                text: $text,
                model: model,
                validationError: error
            )
        }
    }

    static func withPlaceholders() -> AnyView {
        AnyView(
            ViewWrapper(
                initialText: "InitialText",
                model: .init(title: "Title", maxLength: 0),
                error: "Validation Error"
            )
        )
    }

    static func examples() -> AnyView {
        AnyView(
            VStack(spacing: .spacer16) {
                ViewWrapper(
                    initialText: "49.99",
                    model: .init(
                        title: "Pay amount",
                        maxLength: 0
                    ),
                    error: nil
                ).cardView()
                ViewWrapper(
                    initialText: "49.99",
                    model: .init(
                        title: "Pay amount",
                        hint: "Hint text",
                        maxLength: 0
                    ),
                    error: nil
                ).cardView()
            }
        )
    }
}

extension Components.Molecules.InsetView: Examplable {
    static var title: String { "InsetView" }

    static var exampleBackgroundColor: Color { Color.Semantic.pageBackground }

    static func withPlaceholders() -> AnyView {
        AnyView(
            Components.Molecules.InsetView(
                model: .init(
                    body: "Inset text"
                )
            )
        )
    }

    static func examples() -> AnyView {
        AnyView(
            VStack(spacing: .spacer16) {
                Components.Molecules.InsetView(
                    model: .init(
                        body: "Your employer or pension provider takes off Income Tax before they pay you. This is called Pay As You Earn (PAYE). The amount of tax you pay depends on your income, how much of it is tax-free, and your tax code."  // swiftlint:disable:this line_length
                    )
                ).cardView()
                Components.Molecules.InsetView(
                    model: .init(content: {
                        VStack(alignment: .leading, spacing: .spacer8) {
                            Components.Molecules.MultiColumnRowView(
                                models: [
                                    .init(label: "Child Tax Credit", style: .bold),
                                    .init(label: "£124.56", style: .body)
                                ]
                            )
                            Components.Molecules.MultiColumnRowView(
                                models: [
                                    .init(label: "Working Tax Credit", style: .bold),
                                    .init(label: "£171.84", style: .body)
                                ]
                            )
                            Components.Molecules.MultiColumnRowView(
                                models: [
                                    .init(label: "Another Tax Credit", style: .bold),
                                    .init(label: "£15.23", style: .body)
                                ]
                            )
                        }
                    })
                ).cardView()
            }
        )
    }
}

extension Components.Molecules.MultiColumnRowView: Examplable {
    static var title: String { "MultiColumnRowView" }

    static var exampleBackgroundColor: Color { Color.Semantic.pageBackground }

    static func withPlaceholders() -> AnyView {
        AnyView(
            Components.Molecules.MultiColumnRowView(
                models: [
                    .init(label: "Label 1", style: .body, weight: 1, textAlignment: .leading),
                    .init(label: "Label 2", style: .body, weight: 1, textAlignment: .trailing),
                    .init(label: "Label 3", style: .body, weight: 1, textAlignment: .trailing)
                ]
            )
        )
    }

    static func examples() -> AnyView {
        AnyView(
            VStack(spacing: .spacer16) {
                Components.Molecules.MultiColumnRowView(
                    labels: [
                        "Estimated annual income",
                    ],
                    style: .body
                ).cardView()
                Components.Molecules.MultiColumnRowView(
                    labels: [
                        Example.Text.longestIpsum
                    ],
                    style: .error
                ).cardView()
                Components.Molecules.MultiColumnRowView(
                    labels: [
                        "Estimated annual income",
                        "£24,000"
                    ],
                    style: .body
                ).cardView()
                Components.Molecules.MultiColumnRowView(
                    labels: [
                        Example.Text.longerIpsum,
                        Example.Text.longIpsum,
                    ],
                    style: .bold
                ).cardView()
                Components.Molecules.MultiColumnRowView(
                    models: [
                        .init(label: "Account number", style: .body),
                        .init(label: "10084712", style: .bold)
                    ]
                ).cardView()
                Components.Molecules.MultiColumnRowView(
                    models: [
                        .init(label: "Your final bonus", style: .body),
                        .init(label: "£0", style: .bold)
                    ]
                ).cardView()
                Components.Molecules.MultiColumnRowView(
                    models: [
                        .init(label: "£31,865", style: .info, weight: 1, textAlignment: .leading),
                        .init(label: "20%", style: .info, weight: 1, textAlignment: .trailing),
                        .init(label: "£6,373", style: .info, weight: 1, textAlignment: .trailing)
                    ]
                ).cardView()
                Components.Molecules.MultiColumnRowView(
                    models: [
                        .init(label: Example.Text.longIpsum, style: .body, weight: 1, textAlignment: .leading),
                        .init(label: Example.Text.longIpsum, style: .body, weight: 1, textAlignment: .trailing),
                        .init(label: Example.Text.longIpsum, style: .body, weight: 1, textAlignment: .trailing)
                    ]
                ).cardView()
            }
        )
    }
}

extension Components.Molecules.SelectRowView: Examplable {
    static var title: String { "SelectRowView" }

    static var exampleBackgroundColor: Color { Color.Semantic.pageBackground }


    static func withPlaceholders() -> AnyView {
        AnyView(
            exampleView(initialState: .init(rows: [
                .init(body: "Option 1")
            ]))
        )
    }
    private static func exampleView(initialState: Components.Molecules.SelectRowView.Model) -> Components.Molecules.SelectRowView {
        var modelVar = initialState
        let binding = Binding<Components.Molecules.SelectRowView.Model> {
            initialState
        } set: { model in
            modelVar = model
            print("SelectRow Value did change: \(model)")
        }
        return Components.Molecules.SelectRowView(model: binding) { num in
            print("Selected \(num)")
        }
    }
    static func examples() -> AnyView {
        AnyView(
            VStack(spacing: .spacer16) {
                exampleView(initialState: .init(rows: [
                    .init(body: "Option 1"),
                    .init(body: "Option 2"),
                    .init(body: "Option 3"),
                    .init(body: "Option 4")
                ])).cardView()
                
            }
        )
    }
}

extension Components.Molecules.SecureInputView: Examplable {
    private static func exampleView(initialState: Bool, model secureInputViewModel: Components.Molecules.SecureInputView.Model) -> some View {
        var isSecureVar = initialState
        let isSecureBinding = Binding<Bool> {
            isSecureVar
        } set: { secure in
            isSecureVar = secure
            print("Show Hide toggle: \(isSecureVar)")
        }
        return ZStack(alignment: .trailing) {
            HStack {
                ViewWrapper(
                    initialText: "",
                    model: secureInputViewModel,
                    error: "error",
                    secure: initialState
                ).cardView()
                
                
            }
        }
    }
    
    static func examples() -> AnyView {
        
        return AnyView(
            exampleView(
                initialState: true,
                model: .init(
                    title: "Enter Pin",
                    hint: "A hint message below the text. this is a descriptive hint message",
                    placeholder: "Enter text here please",
                    maxLength: 0,
                    keyboardType: .decimalPad,
                    secureFieldLabel: "Enter a 6 digit Pin",
                    showText: "Show",
                    hideText: "Hide",
                    accessibilityLabel: "Enter Pin %@, text field, tap to edit",
                    speakOutText: true,
                    attributedTextInAccessibility: true
                )
            )
        )
    }
    
    static var title: String { "SecureInputView" }

    static var exampleBackgroundColor: Color { Color.Semantic.pageBackground }

    struct ViewWrapper: View {
        @State var text: String
        @State var secureText: String
        @State var secure: Bool
        @State var error: String?
        let model: Components.Molecules.SecureInputView.Model

        init(
            initialText: String = "",
            secureText: String = "",
            model: Components.Molecules.SecureInputView.Model,
            error: String? = nil,
            secure: Bool = true
        ) {
            self.text = initialText
            self.secureText = secureText
            self.model = model
            self.error = error
            self.secure = secure
        }

        var body: some View {
            Components.Molecules.SecureInputView(
                model: model, 
                text: $text, 
                internalText: $secureText,
                secureField: $secure,
                validationError: $error
            )
        }
    }

    static func withPlaceholders() -> AnyView {
        AnyView(
            ViewWrapper(
                initialText: "SecureTextField",
                model: .init(
                    title: "Title",
                    hint: "A hint message",
                    maxLength: 0,
                    showText: "Show",
                    hideText: "Hide"
                ),
                error: "Validation Error",
                secure: false
            )
        )
    }
}

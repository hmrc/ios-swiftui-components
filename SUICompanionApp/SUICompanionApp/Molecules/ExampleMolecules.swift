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
                    icon: Example.Images.maintenance.image,
                    title: "Your Help to Save account closed on 21 May 2018"
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
                        placeholder: "Enter text here please",
                        maxLength: 0
                    )
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

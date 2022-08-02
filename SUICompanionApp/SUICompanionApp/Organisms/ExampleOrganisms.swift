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

extension Components.Organisms.HeadlineCardView: Examplable {
    static var title: String { "HeadlineCardView" }

    static var exampleBackgroundColor: Color { Color.Semantic.pageBackground }

    static func withPlaceholders() -> AnyView {
        AnyView(
            Components.Organisms.HeadlineCardView(
                title: "Title",
                headline: "Headline",
                content: {
                    Text("Body")
                }
            )
        )
    }

    static func examples() -> AnyView {
        AnyView(
            VStack(spacing: .spacer16) {
                Components.Organisms.HeadlineCardView(
                    title: "HMRC owes you a refund",
                    currencyAmount: 500.34,
                    content: {
                        Button("Claim your refund") {
                            print("Claim your refund tapped")
                        }.styled(.primary())
                    }
                )
                Components.Organisms.HeadlineCardView(
                    title: "Your PAYE income tax estimate",
                    currencyAmount: 12345,
                    disclosureModel: .init({
                        print("Disclosure Tapped")
                    })) {
                        Text("This is the income tax we think you will have paid by the end of the year", style: .body)
                    }
                Components.Organisms.HeadlineCardView(
                    title: Example.Text.longerIpsum,
                    headline: Example.Text.longIpsum,
                    headlineStyle: .H3,
                    content: {
                        Text(Example.Text.longestIpsum, style: .body)
                    }
                )
                Components.Organisms.HeadlineCardView(
                    title: "Your PAYE income tax estimate",
                    currencyAmount: 12345,
                    content: {
                        Text("This is the income tax we think you will have paid by the end of the year", style: .body)
                        Button("View tax estimate") {
                            print("View tax estimate tapped")
                        }.styled(.primary())
                    }
                )
                Components.Organisms.HeadlineCardView(
                    title: Example.Text.longerIpsum,
                    headline: Example.Text.longIpsum,
                    headlineStyle: .H3,
                    content: {
                        VStack(spacing: 0) {
                            Text(Example.Text.longestIpsum, style: .body)
                            Button(Example.Text.longIpsum) {
                                print("Ipsum tapped")
                            }.styled(.secondary(padding: 8))
                        }
                    }
                )
                Components.Organisms.HeadlineCardView(
                    title: "Your PAYE income tax estimate",
                    currencyAmount: 12345,
                    content: {
                        VStack(spacing: .spacer24 + .spacer4) {
                            Text("This is the income tax we think you will have paid by the end of the year", style: .body)
                                .frame(maxWidth: .infinity, alignment: .leading)
                            Components.Molecules.IconButtonView(
                                model:
                                        .init(
                                            icon: Example.Images.info.image,
                                            title: "How is this calculated?",
                                            iconTintColor: Color.Semantic.linkText,
                                            accessibilityHint: nil,
                                            accessibilityIdentifier: nil,
                                            handler: {
                                                print("How is this calculated?")
                                            })
                            )
                        }
                    }
                )
                
                Components.Organisms.HeadlineCardView(
                    title: "Your PAYE income tax estimate",
                    currencyAmount: 12345,
                    content: {
                        VStack(spacing: .spacer24 + .spacer4) {
                            Text("This is the income tax we think you will have paid by the end of the year", style: .body)
                                .frame(maxWidth: .infinity, alignment: .leading)
                            Components.Molecules.InsetView(model: .init(content: {
                                Text("Your employer or pension provider takes off Income Tax before they pay you. This is called Pay As You Earn (PAYE). The amount of tax you pay depends on your income, how much of it is tax-free, and your tax code.", style: .body)
                            }))
                        }
                    }
                )
            }
        )
    }
}

extension Components.Organisms.SummaryRowView: Examplable {
    static var title: String { "SummaryRowView" }

    static var exampleBackgroundColor: Color { Color.Semantic.pageBackground }

    static func withPlaceholders() -> AnyView {
        AnyView(
            Components.Organisms.SummaryRowView(
                model: .init(
                    title: "Title",
                    rowViews: {
                        VStack(alignment: .leading, spacing: .spacer8) {
                            Components.Molecules.MultiColumnRowView(
                                models: [
                                    .init(
                                        label: "Text 1",
                                        style: .info,
                                        weight: 4,
                                        textAlignment: .leading
                                    ),
                                    .init(
                                        label: "Text 2",
                                        style: .info,
                                        weight: 3,
                                        textAlignment: .trailing
                                    ),
                                    .init(
                                        label: "Text 3",
                                        style: .info,
                                        weight: 3,
                                        textAlignment: .trailing
                                    ),
                                ]
                            )
                        }
                    },
                    icon: Example.Images.warning.image,
                    iconTint: TextStyle.link.textColor,
                    disclosureModel: .init({
                        print("Summary Row Tapped")
                    })
                )
            ).cardView(insets: .none, backgroundColor: .clear)
        )
    }

    static func examples() -> AnyView {
        AnyView(
            VStack(spacing: .spacer16) {
                VStack(spacing: 0) {
                    Components.Organisms.SummaryRowView(
                        model: .init(
                            title: "Sainsbury's PLC",
                            rowViews: {
                                VStack(alignment: .leading, spacing: .spacer8) {
                                    Components.Molecules.MultiColumnRowView(
                                        labels: ["Payroll", "96245SLJK88"],
                                        style: .info
                                    )
                                    Components.Molecules.MultiColumnRowView(
                                        labels: ["Taxcode", "1185L"],
                                        style: .info
                                    )
                                    Components.Molecules.MultiColumnRowView(
                                        models: [
                                            .init(
                                                label: "Estimated taxable income",
                                                style: .info,
                                                textAlignment: .leading
                                            ),
                                            .init(
                                                label: "£5,690",
                                                style: .info,
                                                textAlignment: .trailing
                                            ),
                                        ]
                                    )
                                }
                            },
                            disclosureModel: .init(
                                accessibilityLabel: "Read about your income from Sainsbury's PLC",
                                accessibilityHint: "opens in a browser",
                                {
                                    print("Sainsbury's Tapped")
                                }
                            )
                        )
                    )
                    Components.Atoms.Divider()
                        .padding(.horizontal, .spacer16)
                    Components.Organisms.SummaryRowView(
                        model: .init(
                            title: "Eastwood Charter School (7601)",
                            rowViews: {
                                VStack(alignment: .leading, spacing: .spacer8) {
                                    Components.Molecules.MultiColumnRowView(
                                        labels: ["Taxcode", "BR"],
                                        style: .info
                                    )
                                    Components.Molecules.MultiColumnRowView(
                                        models: [
                                            .init(
                                                label: "Estimated taxable income",
                                                style: .info,
                                                textAlignment: .leading
                                            ),
                                            .init(
                                                label: "£4,143",
                                                style: .info,
                                                textAlignment: .trailing
                                            ),
                                        ]
                                    )
                                }
                            },
                            disclosureModel: .init({
                                print("Eastwood's Tapped")
                            })
                        )
                    )
                }.cardView(insets: .none)
                Components.Organisms.SummaryRowView(
                    model: .init(
                        title: "Fingerprint ID",
                        rowViews: {
                            Components.Molecules.MultiColumnRowView(
                                labels: ["On"], style: .info
                            )
                        },
                        icon: Example.Images.warning.image,
                        iconTint: TextStyle.link.textColor,
                        disclosureModel: .init({
                            print("Fingerprint ID tapped")
                        })
                    )
                ).cardView(insets: .none)
                Components.Organisms.SummaryRowView(
                    model: .init(
                        title: "",
                        rowViews: {
                            Components.Molecules.MultiColumnRowView(
                                labels: ["Final bonus", "£200"], style: .bold
                            )
                            Text(
                                "Paid into your UK bank account from 28 February 2020",
                                style: .body
                            ).fixedSize(horizontal: false, vertical: true)
                        }
                    )
                ).cardView(insets: .none)
                VStack(spacing: 0) {
                    Components.Organisms.SummaryRowView(
                        model: .init(
                            title: Example.Text.longerIpsum,
                            rowViews: {
                                Components.Molecules.MultiColumnRowView(
                                    labels: [Example.Text.longestIpsum],
                                    style: .info
                                )
                            },
                            disclosureModel: .init({
                                print("Row 1 Tapped")
                            })
                        )
                    )
                    Components.Atoms.Divider()
                        .padding(.horizontal, .spacer16)
                    Components.Organisms.SummaryRowView(
                        model: .init(
                            title: Example.Text.longerIpsum,
                            rowViews: {
                                Components.Molecules.MultiColumnRowView(
                                    labels: [Example.Text.longIpsum, Example.Text.longIpsum],
                                    style: .info
                                )
                            }
                        )
                    )
                    Components.Atoms.Divider()
                        .padding(.horizontal, .spacer16)
                    Components.Organisms.SummaryRowView(
                        model: .init(
                            title: Example.Text.longerIpsum,
                            rowViews: {
                                VStack(alignment: .leading, spacing: .spacer8) {
                                    Components.Molecules.MultiColumnRowView(
                                        labels: [Example.Text.longIpsum, Example.Text.longIpsum, Example.Text.longIpsum],
                                        style: .info
                                    )
                                    Components.Molecules.MultiColumnRowView(
                                        labels: [Example.Text.longIpsum],
                                        style: .info
                                    )
                                }
                            },
                            disclosureModel: .init({
                                print("Row 3 Tapped")
                            })
                        )
                    )
                }.cardView(insets: .none)
            }
        )
    }
}

extension Components.Organisms.PrimaryCardView: Examplable {
    static var title: String { "PrimaryCardView" }

    static var exampleBackgroundColor: Color { Color.Semantic.pageBackground }

    static func withPlaceholders() -> AnyView {
        AnyView(
            Components.Organisms.PrimaryCardView(
                title: "Title"
            ){
                Text("Body")
                    .style(.body)
            }
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
                    title: Example.Text.longerIpsum) {
                        VStack(alignment: .leading, spacing: .spacer8) {
                            Text(Example.Text.longestIpsum)
                                .style(.body)
                            Components.Molecules.InsetView(model: .init(body: Example.Text.longerIpsum))

                        }
                    }
                Components.Organisms.PrimaryCardView(
                    title: "Rewew your tax credits") {
                        VStack(alignment: .leading) {
                            Text("Rewew your tax credits")
                                .style(.body)
                            Button("Renew or check my claims") {
                                print("Renew Tapped")
                            }.styled(.primary())
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
                Components.Organisms.PrimaryCardView(
                    title: Example.Text.longerIpsum) {
                        Components.Molecules.IconButtonView(
                            model: .init(
                                icon: Example.Images.info.image,
                                title: Example.Text.longIpsum,
                                iconTintColor: Color.Semantic.linkText,
                                accessibilityHint: "Hint",
                                accessibilityIdentifier: "Identifier",
                                handler: {
                                    print("Lorem")
                                }
                            )
                        )
                    }
            }
        )
    }
}

extension Components.Organisms.StatusCardView: Examplable {
    static var title: String { "StatusCardView" }

    static var exampleBackgroundColor: Color { Color.Semantic.pageBackground }

    static func withPlaceholders() -> AnyView {
        AnyView(
            Components.Organisms.StatusCardView(
                icon: Example.Images.maintenance.image,
                title: "Title",
                body: "Body",
                buttonModel: .init(
                    title: "Button Title",
                    style: .secondary(padding: 0),
                    handler: {
                        print("tapped")
                    }
                ),
                journeyId: "121212-343434-565656-787878"
            )
        )
    }
    static func examples() -> AnyView {
        AnyView(
            VStack(spacing: .spacer16) {
                Components.Organisms.StatusCardView(
                    icon: Example.Images.maintenance.image,
                    title: "Service unavailable",
                    body: "You'll need to try again later.",
                    journeyId: "121212-343434-565656-787878"
                )

                Components.Organisms.StatusCardView(
                    icon: Example.Images.info.image,
                    title: "Your Help to Save account closed on 21 May 2018",
                    buttonModel: .init(
                        title: "Tell me more",
                        style: .secondary(padding: 0),
                        handler: {
                            print("tapped")
                        }
                    )
                )

                Components.Organisms.StatusCardView(
                    icon: Example.Images.info.image,
                    title: "Your Help to Save account closed on 21 May 2018"
                )

                Components.Organisms.StatusCardView(
                    icon: Example.Images.info.image,
                    title: "Your Help to Save account closed on 21 May 2018",
                    body: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.",
                    buttonModel: .init(
                        title: "Tell me more",
                        style: .secondary(padding: 0),
                        handler: {
                            print("tapped")
                        }
                    ),
                    journeyId: "121212-343434-565656-787878"
                )

                Components.Organisms.StatusCardView(
                    icon: Example.Images.info.image,
                    title: "You can't access John Smith's information right now",
                    body: "We have been told that John Smith is deceased so we can't show the information you are expecting.\n\n" +
                    "If you need to discuss this account, please contact the PAYE helpline.",
                    buttonModel: .init(
                        title: "Call 0300 200 3300",
                        style: .primary(enabled: true),
                        handler: {
                            print("tapped")
                        }
                    ),
                    insets: .init(top: .spacer16, leading: .spacer16, bottom: 0, trailing: .spacer16),
                    itemSpacing: 0
                ) {
                    Components.Molecules.IconButtonView(
                        model: .init(
                            icon: Example.Images.info.image,
                            title: "Learn about call charges",
                            iconTintColor: TextStyle.link.textColor,
                            insets: .init(top: .spacer16, leading: 0, bottom: .spacer16, trailing: .spacer16),
                            handler: {
                                print("Learn about call charges tapped")
                            }
                        )
                    )
                }

                Components.Organisms.StatusCardView(
                    icon: Example.Images.info.image,
                    title: Example.Text.longerIpsum,
                    body: nil,
                    buttonModel: .init(
                        title: Example.Text.longIpsum,
                        style: .primary(enabled: true),
                        handler: {
                            print("tapped")
                        }
                    )
                )

                Components.Organisms.StatusCardView(
                    icon: Example.Images.coins.image,
                    title: Example.Text.longerIpsum,
                    body: Example.Text.longestIpsum,
                    buttonModel: .init(
                        title: Example.Text.longIpsum,
                        style: .secondary(padding: 0),
                        handler: {
                            print("tapped")
                        }
                    ),
                    iconTintColor: .Named.green1.colour,
                    insets: .init(top: .spacer16, leading: .spacer16, bottom: 0, trailing: .spacer16)
                )
            }
        )
    }
}

extension Components.Organisms.IconButtonCardView: Examplable {
    static var title: String { "IconButtonCardView" }

    static var exampleBackgroundColor: Color { Color.Semantic.pageBackground }

    static func withPlaceholders() -> AnyView {
        AnyView(
            Components.Organisms.IconButtonCardView(
                model: .init(
                    icon: Example.Images.info.image,
                    title: "Title",
                    handler: {

                    }
                )
            )
        )
    }

    static func examples() -> AnyView {
        AnyView(
            VStack {
                Components.Organisms.IconButtonCardView(
                    model: .init(
                        icon: Example.Images.help.image,
                        title: "About the calculator",
                        handler: {

                        }
                    )
                )
                Components.Organisms.IconButtonCardView(
                    model: .init(
                        icon: Example.Images.help.image,
                        title: Example.Text.longerIpsum,
                        handler: {

                        }
                    )
                )
            }
        )
    }


}

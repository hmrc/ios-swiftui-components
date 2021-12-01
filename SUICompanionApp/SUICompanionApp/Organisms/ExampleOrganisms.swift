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
                        .typeErased
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
                        }.styled(.primary)
                            .typeErased
                    }
                )

                Components.Organisms.HeadlineCardView(
                    title: "Your PAYE income tax estimate",
                    currencyAmount: 12345, disclosureAction: {
                        print("Disclosure Tapped")
                    })
                    {
                        Text("This is the income tax we think you will have paid by the end of the year", style: .body)
                            .typeErased
                    }
                Components.Organisms.HeadlineCardView(
                    title: Example.Text.longerIpsum,
                    headline: Example.Text.longIpsum,
                    headlineStyle: .H3,
                    content: {
                        Text(Example.Text.longestIpsum, style: .body)
                            .typeErased
                    }
                )
                Components.Organisms.HeadlineCardView(
                    title: "Your PAYE income tax estimate",
                    currencyAmount: 12345) {
                        VStack(spacing: 0) {
                        Text("This is the income tax we think you will have paid by the end of the year", style: .body)
                        Button("View tax estimate") {
                            print("View tax estimate tapped")
                        }.styled(.primary)
                        }.typeErased
                    }

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
                        }.typeErased
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
                        }.typeErased
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
                        }.typeErased
                    }
                )
            }
        )
    }
}

extension Components.Organisms.ExpandingRowView: Examplable {
    static var title: String { "ExpandingRowView" }

    static var exampleBackgroundColor: Color { Color.Semantic.pageBackground }

    static func withPlaceholders() -> AnyView {
        AnyView(
            Components.Organisms.ExpandingRowView(
                title: "Title",
                subtitle: "Subtitle",
                icon: Example.Images.help.image) {
                Components.Molecules.InsetView(
                    model: .init(body:"Description text"))
            }    
        )
    }
    
    static func examples() -> AnyView {
        AnyView(
            VStack(spacing: .spacer16) {
                Components.Organisms.ExpandingRowView(
                    title: "What is Pay As You Earn?",
                    icon: Example.Images.help.image) {
                    Components.Molecules.InsetView(
                        model: .init(body:"Your employer or pension provider takes off Income Tax before they pay you. This is called Pay As You Earn (PAYE). The amount of tax you pay depends on your income, how much of it is tax-free, and your tax code."))
                }.cardView()
                Components.Organisms.ExpandingRowView(
                    title: "How to set up a regular payment",
                    icon: Example.Images.poundSign.image,
                    accessibilityHint: "Overrides default accessibility message",
                    accessibilityExpandHint: "Show more information on how to set up a regular payment.",
                    accessibilityCollapseHint: "Show less information on how to set up a regular payment.") {
                    
                    VStack(alignment: .leading, spacing: .spacer8) {
                        Text("You’ll never forget to save if you set up a regular payment, called a standing order, with your bank.", style: .body)
                        Text("Standing order details for your bank", style: .bold)
                        Components.Molecules.InsetView(model: .init(content: {
                            VStack(alignment: .leading, spacing: .spacer16) {
                                Text("Account number: ", style: .body) + Text("10028471", style: .bold)
                                Text("Sort code: ", style: .body) + Text("60 80 77", style: .bold)
                                Text("Payment reference: ", style: .body) + Text("4321876345290", style: .bold)
                            }
                        }))
                    }
                }.cardView()
            }
        )
    }
}

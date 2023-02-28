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

extension Components.Organisms.InformationMessageCard: Examplable {
    static var title: String { "InformationMessageCard" }

    static var exampleBackgroundColor: Color { Color.Semantic.pageBackground }

    static func withPlaceholders() -> AnyView {
        AnyView(
            Components.Organisms.InformationMessageCard(
                id: "",
                theme: .info,
                icon: Image("warning"),
                headline: .init(
                    title: "Placeholder",
                    ctas: [
                        .init(
                            message: "CTA Action Message",
                            link: "",
                            linkType: .normal,
                            displayType: .action
                        ),
                        .init(
                            message: "CTA Outline Message",
                            link: "",
                            linkType: .normal,
                            displayType: .outline
                        )
                    ]
                ))
        )
    }

    static func examples() -> AnyView {
        AnyView (
            VStack{
                Components.Organisms.InformationMessageCard(
                    id: "",
                    theme: .info,
                    icon: Image("warning"),
                    headline: .init(
                        title: "Info message",
                        body: "This is where can have a short bit of copy about this thing.",
                        ctas: [
                            .init(
                                message: "Do something",
                                link: "",
                                linkType: .normal,
                                displayType: .action
                            ),
                            .init(
                                message: "Do something else",
                                link: "",
                                linkType: .normal,
                                displayType: .outline
                            )
                        ]
                    )
                )

                Components.Organisms.InformationMessageCard(
                    id: "",
                    theme: .warning,
                    icon: Image("warning"),
                    headline: .init(
                        title: "Warning message",
                        ctas: [
                            .init(
                                message: "Do something with a long long message",
                                link: "",
                                linkType: .normal,
                                displayType: .action
                            )
                        ]
                    )
                )

                Components.Organisms.InformationMessageCard(
                    id: "",
                    theme: .notice,
                    icon: Image("warning"),
                    headline: .init(
                        title: "Notice Message"
                    )
                )
            }
        )
    }
}

extension Components.Organisms.DonutChartView: Examplable {
    static var title: String = "DonutChartView"
    
    static var exampleBackgroundColor: Color { Color.Semantic.pageBackground }
    
    static func withPlaceholders() -> AnyView {
        let sliceData: [Components.Organisms.DonutChartView.SliceData] = [
            .init(
                key: "Test1",
                amount: 3781,
                styleProperties: Components.Organisms.DonutChartView.SliceStyleProperties(
                    colour: Color.Named.teal.colour,
                    smallColour: Color.Named.teal.colour,
                    dashStyle: nil
                )
            ),
            .init(
                key: "Test2",
                amount: 855,
                styleProperties: Components.Organisms.DonutChartView.SliceStyleProperties(
                    colour: Color.Named.blue.colour,
                    smallColour: Color.Named.teal.colour,
                    dashStyle: nil
                )
            ),
        ]
        
        return AnyView(
            HStack {
                Spacer()
                Components.Organisms.DonutChartView(
                    sliceDetails: sliceData.convertToSliceDetails(),
                    globalStyleProperties: Components.Organisms.DonutChartView.GlobalStylingProperties(
                        animationDuration: 1.0,
                        viewHeight: 200,
                        sliceWidth: 30.0
                    )
                )
                Spacer()
            }
        )
    }
    
    static func examples() -> AnyView {
        AnyView(
            VStack {
                VStack {
                    let example1: [Components.Organisms.DonutChartView.SliceData] = [
                        .init(
                            key: "Test1",
                            amount: 150,
                            styleProperties: Components.Organisms.DonutChartView.SliceStyleProperties(
                                colour: Color.Named.pink.colour,
                                smallColour: Color.Named.pink.colour,
                                dashStyle: [3, 3]
                            )
                        ),
                        .init(
                            key: "Test2",
                            amount: 700,
                            styleProperties: Components.Organisms.DonutChartView.SliceStyleProperties(
                                colour: Color.Named.teal.colour,
                                smallColour: Color.Named.teal.colour,
                                dashStyle: nil
                            )
                        ),
                        .init(
                            key: "Test3",
                            amount: 150,
                            styleProperties: Components.Organisms.DonutChartView.SliceStyleProperties(
                                colour: Color.Named.blue.colour,
                                smallColour: Color.Named.blue.colour,
                                dashStyle: nil
                            )
                        ),
                    ]
                    
                    HStack {
                        Spacer()
                        Components.Organisms.DonutChartView(
                            sliceDetails: example1.convertToSliceDetails(),
                            globalStyleProperties: Components.Organisms.DonutChartView.GlobalStylingProperties(
                                animationDuration: 1.0,
                                viewHeight: 200,
                                sliceWidth: 30.0
                            )
                        )
                        Spacer()
                    }
                    Text("3 Slice example with striped slice")
                }

                VStack {
                    let example2: [Components.Organisms.DonutChartView.SliceData] = [
                        .init(
                            key: "Test1",
                            amount: 3000,
                            styleProperties: Components.Organisms.DonutChartView.SliceStyleProperties(
                                colour: Color.Named.green1.colour,
                                smallColour: Color.Named.green1.colour,
                                dashStyle: nil
                            )
                        ),
                        .init(
                            key: "Test2",
                            amount: 1000,
                            styleProperties: Components.Organisms.DonutChartView.SliceStyleProperties(
                                colour: Color.Named.yellow.colour,
                                smallColour: Color.Named.yellow.colour,
                                dashStyle: nil
                            )
                        ),
                        .init(
                            key: "Test3",
                            amount: 1000,
                            styleProperties: Components.Organisms.DonutChartView.SliceStyleProperties(
                                colour: Color.Named.red.colour,
                                smallColour: Color.Named.red.colour,
                                dashStyle: nil
                            )
                        ),
                        .init(
                            key: "Test4",
                            amount: 1000,
                            styleProperties: Components.Organisms.DonutChartView.SliceStyleProperties(
                                colour: Color.Named.green2.colour,
                                smallColour: Color.Named.green2.colour,
                                dashStyle: nil
                            )
                        ),
                        .init(
                            key: "Test5",
                            amount: 3000,
                            styleProperties: Components.Organisms.DonutChartView.SliceStyleProperties(
                                colour: Color.Named.pink.colour,
                                smallColour: Color.Named.pink.colour,
                                dashStyle: nil
                            )
                        ),
                        .init(
                            key: "Test6",
                            amount: 1000,
                            styleProperties: Components.Organisms.DonutChartView.SliceStyleProperties(
                                colour: Color.Named.blue.colour,
                                smallColour: Color.Named.blue.colour,
                                dashStyle: nil
                            )
                        ),
                    ]
                    
                    HStack {
                        Spacer()
                        Components.Organisms.DonutChartView(
                            sliceDetails: example2.convertToSliceDetails(),
                            globalStyleProperties: Components.Organisms.DonutChartView.GlobalStylingProperties(
                                animationDuration: 1.0,
                                viewHeight: 200,
                                sliceWidth: 30.0
                            )
                        )
                        Spacer()
                    }
                    Text("6 Slice example")
                }
                
                VStack {
                    let example3: [Components.Organisms.DonutChartView.SliceData] = [
                        .init(
                            key: "Test1",
                            amount: 3000,
                            styleProperties: Components.Organisms.DonutChartView.SliceStyleProperties(
                                colour: Color.Named.green1.colour,
                                smallColour: Color.Named.green1.colour,
                                dashStyle: nil
                            )
                        ),
                        .init(
                            key: "Test2",
                            amount: 1000,
                            styleProperties: Components.Organisms.DonutChartView.SliceStyleProperties(
                                colour: Color.Named.yellow.colour,
                                smallColour: Color.Named.yellow.colour,
                                dashStyle: [3, 3]
                            )
                        ),
                        .init(
                            key: "Test3",
                            amount: 1000,
                            styleProperties: Components.Organisms.DonutChartView.SliceStyleProperties(
                                colour: Color.Named.red.colour,
                                smallColour: Color.Named.red.colour,
                                dashStyle: [3, 3]
                            )
                        ),
                        .init(
                            key: "Test4",
                            amount: 1000,
                            styleProperties: Components.Organisms.DonutChartView.SliceStyleProperties(
                                colour: Color.Named.green2.colour,
                                smallColour: Color.Named.green2.colour,
                                dashStyle: nil
                            )
                        ),
                        .init(
                            key: "Test5",
                            amount: 3000,
                            styleProperties: Components.Organisms.DonutChartView.SliceStyleProperties(
                                colour: Color.Named.pink.colour,
                                smallColour: Color.Named.pink.colour,
                                dashStyle: [3, 3]
                            )
                        ),
                        .init(
                            key: "Test6",
                            amount: 1000,
                            styleProperties: Components.Organisms.DonutChartView.SliceStyleProperties(
                                colour: Color.Named.blue.colour,
                                smallColour: Color.Named.blue.colour,
                                dashStyle: nil
                            )
                        ),
                    ]
                    
                    HStack {
                        Spacer()
                        Components.Organisms.DonutChartView(
                            sliceDetails: example3.convertToSliceDetails(),
                            globalStyleProperties: Components.Organisms.DonutChartView.GlobalStylingProperties(
                                animationDuration: 1.0,
                                viewHeight: 200,
                                sliceWidth: 30.0
                            )
                        )
                        Spacer()
                    }
                    Text("6 Slice example with multiple striped slices")
                }
            }
        )
    }
}

extension Components.Organisms.EditableListView: Examplable {
    static var title: String { "EditableListView" }

    static var exampleBackgroundColor: Color { Color.Semantic.pageBackground }

    static func withPlaceholders() -> AnyView {
        AnyView(
            Components.Organisms.EditableListView(model: .init(
                title: "Editable List View",
                rowButtonTitle: "Edit",
                rowAccessibilityHint: "Row accessibility hint",
                startEditingButtonTitle: "Start Editing",
                startEditingButtonImage: Example.Images.edit.image,
                stopEditingButtonTitle: "Stop Editing",
                stopEditingButtonImage: Example.Images.tick.image,
                views: [
                    Components.Molecules.MultiColumnRowView(labels: ["Row 1:", "Value 1"], style: .body),
                    Components.Molecules.MultiColumnRowView(labels: ["Row 2:", "Value 2"], style: .body),
                    Components.Molecules.MultiColumnRowView(labels: ["Row 3:", "Value 3"], style: .body),
                ],
                didTapRow: { index in
                    print("Edit row at index \(index)")
                }
            ))
        )
    }

    static func examples() -> AnyView {
        AnyView (
            VStack{
                Components.Organisms.EditableListView(model: .init(
                    title: "Your Company Benefits",
                    rowButtonTitle: "Change",
                    rowAccessibilityHint: "opens in a browser",
                    startEditingButtonTitle: "Update or remove benefit",
                    startEditingButtonImage: Example.Images.edit.image,
                    stopEditingButtonTitle: "Finish updating benefits",
                    stopEditingButtonImage: Example.Images.tick.image,
                    views: [
                        Components.Molecules.MultiColumnRowView(labels: ["Medical:", "£1000"], style: .body),
                        Components.Molecules.MultiColumnRowView(labels: ["Car Benefit:", "£600"], style: .body),
                        Components.Molecules.MultiColumnRowView(labels: ["Insurance:", "£300000"], style: .body),
                        Components.Molecules.MultiColumnRowView(labels: ["Tax Benefits:", "£55500"], style: .body)
                    ],
                    didTapRow: { index in
                        print("Edit row at index \(index)")
                    }
                ))
                Components.Organisms.EditableListView(model: .init(
                    title: "Your Company Benefits",
                    rowButtonTitle: "Change",
                    rowAccessibilityHint: "opens in a browser",
                    startEditingButtonTitle: "Update or remove benefit",
                    startEditingButtonImage: Example.Images.edit.image,
                    stopEditingButtonTitle: "Finish updating benefits",
                    stopEditingButtonImage: Example.Images.tick.image,
                    views: [
                        Components.Molecules.MultiColumnRowView(labels: [Example.Text.longIpsum, Example.Text.longerIpsum], style: .body),
                        Components.Molecules.MultiColumnRowView(labels: [Example.Text.longerIpsum, Example.Text.longestIpsum], style: .body),
                        Components.Molecules.MultiColumnRowView(labels: [Example.Text.longestIpsum, Example.Text.longIpsum], style: .body)
                    ],
                    didTapRow: { index in
                        print("Edit row at index \(index)")
                    }
                ))
            }
        )
    }
}

extension Components.Organisms.DonutLegendView: Examplable {
    static var title: String = "DonutLegendView"
    
    static var exampleBackgroundColor: Color { Color.Semantic.pageBackground }
    
    static func withPlaceholders() -> AnyView {
        AnyView(
            Components.Organisms.DonutLegendView(
                donutLegendItems: [
                    Components.Organisms.DonutLegendView.DonutLegendItem(
                        colour: Color.Named.teal.colour,
                        title: "Total after Tax",
                        value: "£100.00"
                    ),
                    Components.Organisms.DonutLegendView.DonutLegendItem(
                        colour: Color.Named.blue.colour,
                        title: "Income Tax paid",
                        value: "£110.00"
                    ),
                    Components.Organisms.DonutLegendView.DonutLegendItem(
                        colour: Color.Named.pink.colour,
                        title: "National Insurance Paid",
                        value: "£120.00"
                    )
                ],
                vStackSpacing: 8
            )
        )
    }
    
    static func examples() -> AnyView {
        AnyView(
            VStack {
                Components.Organisms.DonutLegendView(
                    donutLegendItems: [
                        Components.Organisms.DonutLegendView.DonutLegendItem(
                            colour: Color.Named.teal.colour,
                            title: "Total after Tax",
                            value: "£1041.00"
                        ),
                        Components.Organisms.DonutLegendView.DonutLegendItem(
                            colour: Color.Named.blue.colour,
                            title: "Income Tax paid",
                            value: "£315.00"
                        ),
                        Components.Organisms.DonutLegendView.DonutLegendItem(
                            colour: Color.Named.pink.colour,
                            title: "National Insurance Paid",
                            value: "£189.00"
                        )
                    ],
                    vStackSpacing: 8
                )
                
                Components.Organisms.DonutLegendView(
                    donutLegendItems: [
                        Components.Organisms.DonutLegendView.DonutLegendItem(
                            colour: Color.Named.teal.colour,
                            title: "Total after Tax",
                            value: "£1041.00"
                        ),
                        Components.Organisms.DonutLegendView.DonutLegendItem(
                            colour: Color.Named.blue.colour,
                            title: "Income Tax paid",
                            value: "£315.00"
                        ),
                        Components.Organisms.DonutLegendView.DonutLegendItem(
                            colour: Color.Named.pink.colour,
                            title: "National Insurance Paid",
                            value: "£189.00",
                            dashed: true
                        )
                    ],
                    vStackSpacing: 8
                )
                
                Components.Organisms.DonutLegendView(
                    donutLegendItems: [
                        Components.Organisms.DonutLegendView.DonutLegendItem(
                            colour: Color.Named.teal.colour,
                            title: "Total after Tax",
                            value: "£1041.00",
                            dashed: true
                        ),
                        Components.Organisms.DonutLegendView.DonutLegendItem(
                            colour: Color.Named.blue.colour,
                            title: "Income Tax paid",
                            value: "£315.00",
                            dashed: true
                        ),
                        Components.Organisms.DonutLegendView.DonutLegendItem(
                            colour: Color.Named.pink.colour,
                            title: "National Insurance Paid",
                            value: "£189.00",
                            dashed: true
                        )
                    ],
                    vStackSpacing: 8
                )
            }
        )
    }
}

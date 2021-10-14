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
    static var title: String {
        return "StatusView"
    }

    static var exampleBackgroundColor: Color {
        Color.Semantic.pageBackground
    }

    static func withPlaceholders() -> AnyView {
        let model = Components.Molecules.StatusView.Model(
            icon: Example.Images.maintenance.image,
            title: "Title",
            body: "Body"
        )
        return AnyView(Components.Molecules.StatusView(model: model))
    }

    static func examples() -> AnyView {
        let model = Components.Molecules.StatusView.Model(
            icon: Example.Images.maintenance.image,
            title: "Service unavailable",
            body: "You'll need to try again later."
        )

        let modelWithoutBody = Components.Molecules.StatusView.Model(
            icon: Example.Images.maintenance.image,
            title: "Your Help to Save account closed on 21 May 2018"
        )

        return AnyView(VStack(spacing: .spacer16) {
            Components.Molecules.StatusView(model: model)
                .cardView()
            Components.Molecules.StatusView(model: modelWithoutBody)
                .cardView()
        })
    }
}

extension Components.Molecules.TitleBodyView: Examplable {
    static var title: String {
        return "TitleBodyView"
    }

    static var exampleBackgroundColor: Color {
        Color.Semantic.pageBackground
    }

    static func withPlaceholders() -> AnyView {
        let model = Components.Molecules.TitleBodyView.Model(
            title: "Title",
            body: "Body",
            style: .H3
        )
        return AnyView(Components.Molecules.TitleBodyView(model: model))
    }

    static func examples() -> AnyView {
        let h4Model = Components.Molecules.TitleBodyView.Model(
            title: "Pay As You Earn",
            body: "6 April 2018 to 5 April 2019",
            style: .H4
        )
        let h5Model = Components.Molecules.TitleBodyView.Model(
            title: "You don't have any money in this account.",
            body: "Your closing balance of £240 was transferred to your UK bank account on 28 February 2020.",
            style: .H5
        )
        let boldModel = Components.Molecules.TitleBodyView.Model(
            title: "Date and time",
            body: "7 February 2019 at 17:12:45 GMT",
            style: .bold
        )
        return AnyView(VStack(spacing: .spacer16) {
            Components.Molecules.TitleBodyView(model: h4Model).cardView()
            Components.Molecules.TitleBodyView(model: h5Model).cardView()
            Components.Molecules.TitleBodyView(model: boldModel).cardView()
        })
    }
}

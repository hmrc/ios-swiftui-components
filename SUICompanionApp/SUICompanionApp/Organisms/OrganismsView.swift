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

struct OrganismsView: View {
    var body: some View {
        NavigationView {
            List {
                Group {
                    Example.navigationLink(type: Components.Organisms.HeadlineCardView<Text>.self)
                    Example.navigationLink(type: Components.Organisms.PrimaryCardView<Text>.self)
                    Example.navigationLink(type: Components.Organisms.StatusCardView<Text>.self)
                    Example.navigationLink(type: Components.Organisms.InformationMessageCard.self)
                    Example.navigationLink(type: Components.Organisms.SummaryRowView<Text>.self)
                    Example.navigationLink(type: Components.Organisms.IconButtonCardView.self)
                    Example.navigationLink(type: Components.Organisms.EditableListView.self)
                    Example.navigationLink(type: Components.Organisms.DonutChartView.self)
                    Example.navigationLink(type: Components.Organisms.DonutLegendView.self)
                    Example.navigationLink(type: Components.Organisms.MiniAdvertCardView.self)
                }
                Group {
                    Example.navigationLink(type: Components.Organisms.MenuPanelRowView.self)
                }
            }
            .navigationTitle("Organisms")
        }
    }
}

struct OrganismsView_Previews: PreviewProvider {
    static var previews: some View {
        OrganismsView()
    }
}

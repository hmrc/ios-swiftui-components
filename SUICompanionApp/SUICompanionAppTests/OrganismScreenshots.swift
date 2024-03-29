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
import XCTest
@testable import SUICompanionApp

class OrganismScreenshots: XCTestCase {
    override func setUp() {
        super.setUp()
    }

    func test_screenshot_HeadlineCardView() {
        ExampleView<Components.Organisms.HeadlineCardView<Text>>().snapshotAndSave("headlineCardView")
    }

    func test_screenshot_PrimaryCardView() {
        ExampleView<Components.Organisms.PrimaryCardView<Text>>().snapshotAndSave("primaryCardView")
    }

    func test_StatusCardView() {
        ExampleView<Components.Organisms.StatusCardView<Text>>().snapshotAndSave("statusCardView")
    }

    func test_InfomationMessageCardView() {
        ExampleView<Components.Organisms.InformationMessageCard>().snapshotAndSave("informationMessageCard")
    }

    func test_SummaryRowView() {
        ExampleView<Components.Organisms.SummaryRowView<Text>>().snapshotAndSave("summaryRowView")
    }

    func test_IconButtonCardView() {
        ExampleView<Components.Organisms.IconButtonCardView>().snapshotAndSave("iconButtonCardView")
    }

    func test_EditableListView() {
        ExampleView<Components.Organisms.EditableListView>().snapshotAndSave("editableListView")
    }

    func test_DonutChartView() throws {
        ExampleView<Components.Organisms.DonutChartView>().snapshotAndSave("donutChartView", delayBeforeCapture: 5)
    }

    func test_DonutLegendView() {
        ExampleView<Components.Organisms.DonutLegendView>().snapshotAndSave("donutLegendView")
    }

    func test_MiniAdvertCardView() {
        ExampleView<Components.Organisms.MiniAdvertCardView>().snapshotAndSave("miniAdvertCardView")
    }
    
    func test_MenuPanelRowView() {
        ExampleView<Components.Organisms.MenuPanelRowView>().snapshotAndSave("menuPanelRowView")
    }
}

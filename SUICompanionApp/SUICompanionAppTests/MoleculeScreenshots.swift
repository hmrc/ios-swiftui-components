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

class MoleculeScreenshots: XCTestCase {
    override func setUp() {
        super.setUp()
    }

    func test_screenshot_TextInputView() {
        ExampleView<Components.Molecules.TextInputView>().snapshotAndSave("textInputView")
    }

    func test_screenshot_CurrencyInputView() {
        ExampleView<Components.Molecules.CurrencyInputView>().snapshotAndSave("currencyInputView")
    }

    func test_screenshot_TitleBodyView() {
        ExampleView<Components.Molecules.TitleBodyView>().snapshotAndSave("titleBodyView")
    }

    func test_screenshot_SwitchRowView() {
        ExampleView<Components.Molecules.SwitchRowView>().snapshotAndSave("switchRowView")
    }

    func test_screenshot_StatusView() {
        ExampleView<Components.Molecules.StatusView>().snapshotAndSave("statusView")
    }
    
    func test_screenshot_IconButtonView() {
        ExampleView<Components.Molecules.IconButtonView>().snapshotAndSave("iconButtonView")
    }
    func test_screenshot_insetView() {
        ExampleView<Components.Molecules.InsetView<Text>>().snapshotAndSave("insetView")
    }

}

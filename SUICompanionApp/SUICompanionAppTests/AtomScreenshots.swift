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

class AtomScreenshots: XCTestCase {
    override func setUp() {
        super.setUp()
    }
    
    func test_screenshot_text() {
        ExampleView<Text>().snapshotAndSave("text")
    }

    func test_screenshot_buttons() {
        ExampleView<Components.Atoms.ExampleButton>().snapshotAndSave("buttons")
    }

    func test_screenshot_switch() {
        ExampleView<Components.Atoms.Switch>().snapshotAndSave("switch")
    }

    func test_screenshot_textView() {
        ExampleView<Components.Atoms.TextView>().snapshotAndSave("textView")
    }

    func test_screenshot_imageAligningHStack() {
        ExampleView<Components.Atoms.ImageAligningHStack<Image, Text>>().snapshotAndSave("imageAligningHStack")
    }

    func test_screenshot_divider() {
        ExampleView<Components.Atoms.Divider>().snapshotAndSave("divider")
    }

    func test_screenshot_attributedText() {
        ExampleView<Components.Atoms.AttributedText>().snapshotAndSave("attributedText")
    }
}

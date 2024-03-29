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

extension Example {
    enum Images: String {
        case coins
        case poundSign = "pound_sign"
        case maintenance
        case info
        case help
        case previewBackground = "preview_background"
        case warning
        case atom
        case molecule
        case organism
        case colours
        case edit
        case tick
        case chevronRight = "ChevronRight"
        case calendar
        case keyboard

        var image: Image {
            return Image(self.rawValue)
        }
        
        func callAsFunction() -> String {
            return self.rawValue
        }
    }
}

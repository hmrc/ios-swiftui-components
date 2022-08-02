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

extension EdgeInsets {
    public init(padding: CGFloat) {
        self.init(top: padding, leading: padding, bottom: padding, trailing: padding)
    }
    public static let none = EdgeInsets(padding: 0)
    public static let standardCard = EdgeInsets(top: .spacer16, leading: .spacer16, bottom: .spacer16, trailing: .spacer16)
    public static let standardCardHorizontal = EdgeInsets(top: 0, leading: .spacer16, bottom: 0, trailing: .spacer16)
    public static let standardCardVertical = EdgeInsets(top: .spacer16, leading: 0, bottom: .spacer16, trailing: 0)
}

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

public struct CardView: ViewModifier {
    private let insets: EdgeInsets
    private let backgroundColor: Color

    public init(
        insets: EdgeInsets = EdgeInsets(padding: .spacer16),
        backgroundColor: Color = Color.Semantic.cardBackground
    ) {
        self.insets = insets
        self.backgroundColor = backgroundColor
    }

    public func body(content: Content) -> some View {
        content
            .padding(insets)
            .frame(
                maxWidth: .infinity,
                alignment: .leading
            )
            .background(backgroundColor)
    }
}
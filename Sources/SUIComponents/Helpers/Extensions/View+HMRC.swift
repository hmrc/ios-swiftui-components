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

extension View {
    public func cardView(
        insets: EdgeInsets = EdgeInsets(padding: .spacer16),
        backgroundColor: Color = Color.Semantic.cardBackground,
        disclosureAction: VoidHandler? = nil
    ) -> some View {
        self.modifier(CardView(insets: insets, backgroundColor: backgroundColor, disclosureAction: disclosureAction))
    }

    /// Passes-through the view with customizable side effects
    public func passthrough(applying closure: (_ instance: Self) -> ()) -> Self {
        closure(self)
        return self
    }

    /// Removes all of the Modified Content types from a view, whilst keeping their effects.
    /// https://ericasadun.com/2019/06/23/swiftui-modified-content-type-erasure-and-type-debugging/
    public var typeErased: AnyView { AnyView(self) }
}

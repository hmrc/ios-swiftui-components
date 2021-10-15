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

struct Example { }

protocol Examplable {
    static var title: String { get }
    static var exampleBackgroundColor: Color { get }
    static func withPlaceholders() -> AnyView
    static func examples() -> AnyView
}

extension Example {
    static func navigationLink<Component: Examplable>(type: Component.Type) -> some View {
        return NavigationLink(
            destination: ExampleView<Component>(),
            label: {
                SwiftUI.Text(Component.title)
            }
        )
    }
}

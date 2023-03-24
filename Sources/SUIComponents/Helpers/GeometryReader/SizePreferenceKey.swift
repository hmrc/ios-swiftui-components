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

public protocol Resizable {
    var updateSize: (() -> Void)? { get set }
}

public extension View {
    func readSize(into size: Binding<CGSize>) -> some View {
        self.modifier(SizeReader(size: size))
    }

    func readSize(changed: @escaping ((CGSize) -> Void)) -> some View {
        self.modifier(SizeReader(size: .init(get: { .zero }, set: changed)))
    }
}

public struct SizeReader: ViewModifier {
    @Binding var size: CGSize

    public func body(content: Content) -> some View {
        content
            .background(
                GeometryReader { proxy in
                    Color.clear.preference(
                        key: SizePreferenceKey.self,
                        value: proxy.size
                    )
                }
            )
            .onPreferenceChange(SizePreferenceKey.self) { size = $0 }
    }
}

private struct SizePreferenceKey: PreferenceKey {
    static var defaultValue: CGSize = .zero
    static func reduce(value currentValue: inout CGSize, nextValue: () -> CGSize) {
        _ = nextValue()
    }
}

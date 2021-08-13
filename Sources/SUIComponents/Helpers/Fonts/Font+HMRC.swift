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

public extension Font {
    // swiftlint:disable identifier_name
    private struct BaseFonts {
        static let h3: UIFont = UIFont.systemFont(ofSize: 48, weight: .bold)
        static let h4: UIFont = UIFont.systemFont(ofSize: 30, weight: .bold)
        static let h5: UIFont = UIFont.systemFont(ofSize: 20, weight: .bold)
        static let bold: UIFont = UIFont.systemFont(ofSize: 16, weight: .bold)
        static let body: UIFont = UIFont.systemFont(ofSize: 16)
        static let debug: UIFont = UIFont.systemFont(ofSize: 12)
    }

    static func H3() -> Font {
        return FontMetrics.scaledFont(for: BaseFonts.h3)
    }

    static func H4() -> Font {
        return FontMetrics.scaledFont(for: BaseFonts.h4)
    }

    static func H5() -> Font {
        return FontMetrics.scaledFont(for: BaseFonts.h5)
    }

    static func bold() -> Font {
        return FontMetrics.scaledFont(for: BaseFonts.bold)
    }

    static func body() -> Font {
        return FontMetrics.scaledFont(for: BaseFonts.body)
    }

    static func debug() -> Font {
        return FontMetrics.scaledFont(for: BaseFonts.debug)
    }
    // swiftlint:enable identifier_name
}

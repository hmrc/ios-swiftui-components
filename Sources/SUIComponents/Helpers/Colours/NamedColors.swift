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

public protocol NamedColors {
    var black: Color { get set }
    var white: Color { get set }
    var green1: Color { get set }
    var green2: Color { get set }
    var blue: Color { get set }
    var teal: Color { get set }
    var red: Color { get set }
    var grey1: Color { get set }
    var grey2: Color { get set }
    var grey3: Color { get set }
    var pink: Color { get set }
    var yellow: Color { get set }
}

extension Color {
    open class DarkColors: NamedColors {
        
        public init() {}
        
        open var black = Color(hexString: "#FFFFFF")
        open var white = Color(hexString: "#262626")
        open var green1 = Color(hexString: "#69B134")
        open var green2 = Color(hexString: "#85994B")
        open var blue = Color(hexString: "#5BC0C6")
        open var teal = Color(hexString: "#28A197")
        open var red = Color(hexString: "#EB66CA")
        open var grey1 = Color(hexString: "#B1B4B6")
        open var grey2 = Color(hexString: "#B1B4B6")
        open var grey3 = Color(hexString: "#0B0C0C")
        open var pink = Color(hexString: "#BB94FF")
        open var yellow = Color(hexString: "#FEFF4F")
    }
    
    open class LightColors: NamedColors {
        
        public init() {}
        
        open var black = Color(hexString: "#0B0C0C")
        open var white = Color(hexString: "#FFFFFF")
        open var green1 = Color(hexString: "#00703C")
        open var green2 = Color(hexString: "#85994B")
        open var blue = Color(hexString: "#1D70B8")
        open var teal = Color(hexString: "#28A197")
        open var red = Color(hexString: "#D4351C")
        open var grey1 = Color(hexString: "#505A5F")
        open var grey2 = Color(hexString: "#B1B4B6")
        open var grey3 = Color(hexString: "#F3F2F1")
        open var pink = Color(hexString: "#D53880")
        open var yellow = Color(hexString: "#FFBF47")
    }
}

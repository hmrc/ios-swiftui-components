//
//  File.swift
//  
//
//  Created by Ashlee Muscroft on 06/07/2023.
//

import SwiftUI

open class ObservableBooleanStateObject: ObservableObject {
    @Published public var booleanState: Bool = false
    public init(booleanState: Bool = false) {
        self.booleanState = booleanState
    }
}

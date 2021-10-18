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

public struct Switch: UIViewRepresentable {
    @Binding public var isOn: Bool
    private var onTintColor: Color
    private var borderColor: UIColor
    private var borderWidth: CGFloat = 0.0
    private var cornerRadius: CGFloat = 0.0

    public init(isOn: Binding<Bool>, onTintColor: Color?=nil, borderColor: Color?=nil, borderWidth: CGFloat?=nil, cornerRadius: CGFloat?=nil) {
        self._isOn = isOn
        self.onTintColor = onTintColor ?? .green
        self.borderColor = borderColor?.uiColor() ?? .lightGray
        self.borderWidth = borderWidth ?? 0.0
        self.cornerRadius = cornerRadius ?? 0.0
    }

    public func makeCoordinator() -> Coordinator {
        Coordinator(isOn: $isOn)
    }

    public func makeUIView(context: Context) -> UISwitch {
        let view = UISwitch()
        view.addTarget(context.coordinator, action: #selector(Coordinator.valueChanged(_:)), for: .valueChanged)
        return view
    }

    public func updateUIView(_ uiView: UISwitch, context: Context) {
        uiView.isOn = isOn
        uiView.onTintColor = onTintColor.uiColor()

        uiView.layer.borderWidth = borderWidth
        uiView.layer.cornerRadius = cornerRadius
        uiView.layer.borderColor = borderColor.cgColor
    }

    public func border(_ color: Color, width: CGFloat) -> Switch {
        var view = self
        view.borderColor = color.uiColor()
        view.borderWidth = width
        return view
    }

    public func cornerRadius(_ cornerRadius: CGFloat) -> Switch {
        var view = self
        view.cornerRadius = cornerRadius
        return view
    }

    public class Coordinator: NSObject {
        @Binding private var isOn: Bool

        init(isOn: Binding<Bool>) {
          _isOn = isOn
        }

        @objc func valueChanged(_ sender: UISwitch) {
          _isOn.wrappedValue = sender.isOn
        }
    }
}   

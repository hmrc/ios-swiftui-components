/*
 * Copyright 2023 HM Revenue & Customs
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

import Foundation
import SwiftUI

extension Components.Molecules {
    
    public struct NotificationBubbleView: View {
        @State private var cornerRadius: CGFloat = 0.0
        @State private var visible: Bool = true
        @State private var frameWidth: CGFloat = FontMetrics.scaledValue(for: Consts.defaultSize.width)
        @State private var frameHeight: CGFloat = FontMetrics.scaledValue(for: Consts.defaultSize.height)
        
        private var viewModel: NotificationBubbleView.Model
        
        
        public init(model: NotificationBubbleView.Model) {
            self.viewModel = model
        }
        
        @ViewBuilder
        public func renderView(viewState: NotificationMode) -> any View {
                switch viewState {
                case .circle:
                    Spacer()
                        .accessibility(label: Text("New Item"))
                case .number(let count, let max, let hideWhenZero):
                    let suffix = count > max ? "+" : ""
                    Text(verbatim: "\(min(count, max))\(suffix)")
                        .onAppear{
                            if hideWhenZero && count == 0 {
                                frameWidth = 0
                            }
                        }
                        .opacity(hideWhenZero && count == 0 ? 0 : 1)
                case .hidden:
                    EmptyView()
                        .accessibility(hidden: true)
                case .text(let text):
                    Text(verbatim: "\(text)")
                }
        }
        
        public var body: some View {
            VStack {
                AnyView(
                    renderView(viewState: viewModel.notificationMode)
                        .onAppear{
                            if viewModel.notificationMode == .circle {
                                frameWidth = frameHeight
                            }
                        }
                )
                .font(Font.Body.font())
                .foregroundColor(Color.Semantic.lightText)
                .padding(.spacer8)
                
            }
            .background(
                RoundedRectangle(
                    cornerRadius: cornerRadius,
                    style: .circular
                )
                .foregroundColor(Color.Semantic.errorText)
                .frame(width: frameWidth,
                       height: frameHeight,
                       alignment: .center)
            )
            .onAppear{
                cornerRadius = FontMetrics.scaledValue(for: Consts.defaultSize.height / 2)
                visible = !(viewModel.notificationMode == .hidden)
            }
            .accessibility(hidden: !visible)
            .opacity(visible ? 1 : 0)
            .frame(minWidth: visible ? frameWidth : 0,
                   minHeight: visible ? frameHeight : 0,
                   alignment: .center)
        }
        
        private struct Consts {
            static let defaultSize: CGSize = .init(width: 48, height: 24)
        }
        
        public enum NotificationMode: Equatable {
            public static func ==(lhs: NotificationMode, rhs: NotificationMode) -> Bool {
                switch lhs {
                case .hidden:
                    switch rhs {
                    case .hidden:
                        return true
                    case .number(count: _, max: _, hideWhenZero: _):
                        return false
                    case .circle:
                        return false
                    case .text(_):
                        return false
                    }
                case .number(count: let countA, max: let maxA, hideWhenZero: let hideWhenZeroA):
                    switch rhs {
                    case .hidden:
                        return false
                    case .number(count: let countB, max: let maxB, hideWhenZero: let hideWhenZeroB):
                        return (
                            countA == countB &&
                            maxA == maxB &&
                            hideWhenZeroA == hideWhenZeroB
                        )
                    case .circle:
                        return false
                    case .text(_):
                        return false
                    }
                case .circle:
                    switch rhs {
                    case .hidden:
                        return false
                    case .number(count: _, max: _, hideWhenZero: _):
                        return false
                    case .circle:
                        return true
                    case .text(_):
                        return false
                    }
                case .text(let textA):
                    switch rhs {
                    case .hidden:
                        return false
                    case .number(count: _, max: _, hideWhenZero: _):
                        return false
                    case .circle:
                        return false
                    case .text( let textB ):
                        return textA == textB
                    }
                }
            }
            /// Specifies that the notification will display a number in the notification bubble.
            case number(count: Int, max: Int = 99, hideWhenZero: Bool = true)
            
            /// Specifies that the notification will display the notification bubble alone
            case circle
            
            /// Specifies that the notification will display the notification bubble with the text provided
            case text(_ text: String)
            
            /// Specifies that the notification bubble will be hidden
            case hidden
        }
        
        public struct Model {
            public let notificationMode: NotificationMode
            
            public init(notificationMode: NotificationMode) {
                self.notificationMode = notificationMode
            }
        }
    }
}

struct NotificationBubbleView_Previews: PreviewProvider {
    static var previews: some View {
        VStack {
            Components.Molecules.NotificationBubbleView(
                model: .init(notificationMode:
                        .number(count: 1000,
                                max: 99)
                ))
        }
    }
}

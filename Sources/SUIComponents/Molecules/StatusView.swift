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

extension Components.Molecules {
    public struct StatusView: View {
        let model: Model
        
        public init(model: Model) {
            self.model = model
        }

        @State var bodyTextAlignment: TextAlignment = .center
        @State var bodyTextFrameAlignment: Alignment = .center
        
        public var body: some View {
            VStack(
                alignment: .center,
                spacing: .spacer24,
                content: {
                    model.icon
                        .resizable()
                        .frame(
                            width: Constants.imageSize,
                            height: Constants.imageSize,
                            alignment: .center
                        )
                        .aspectRatio(contentMode: .fill)
                        .foregroundColor(model.iconTintColor ?? Color.Semantic.statusCardIconDefaultTint)

                    Text(model.title)
                        .style(.H5)
                        .multilineTextAlignment(.center)

                    if let body = model.body {
                        Text(body, style: .body)
                            .frame(maxWidth: .infinity, alignment: bodyTextFrameAlignment)
                            .background(GeometryReader { actualGeometry in
                                Text(body, style: .body)
                                    .frame(maxWidth: .infinity)
                                    .lineLimit(2)
                                    .background(GeometryReader { twoLineGeometry in
                                        Color.clear.onAppear {
                                            if actualGeometry.size.height > twoLineGeometry.size.height {
                                                bodyTextAlignment = .leading
                                                bodyTextFrameAlignment = .leading
                                            } else {
                                                bodyTextAlignment = .center
                                                bodyTextFrameAlignment = .center
                                            }
                                        }
                                    })
                                    .hidden()
                            })
                    }

                    if let buttonModel = model.buttonModel {
                        Button(action: buttonModel.handler) {
                            Text(buttonModel.title)
                        }
                        .styled(buttonModel.style)
                        .padding(
                            buttonModel.inset ?? EdgeInsets(padding: .zero)
                        )
                        .padding(.bottom, .spacer12)
                    }
                }
            )
            .frame(maxWidth: .infinity, alignment: .center)
            .multilineTextAlignment(model.defaultTextAligment ?? .center)
        }

        private struct Constants {
            static let imageSize: CGFloat = 100
        }
    }
}

extension Components.Molecules.StatusView {
    open class Model {
        public let icon: Image
        public let title: String
        public let body: String?
        public let buttonModel: ButtonModel?
        public let iconTintColor: Color?
        public let defaultTextAligment: TextAlignment?
        

        public init(icon: Image,
                    title: String,
                    body: String? = nil,
                    buttonModel: ButtonModel? = nil,
                    iconTintColor: Color? = nil,
                    textAlignment: TextAlignment? = nil
        ) {
            self.icon = icon
            self.title = title
            self.body = body
            self.buttonModel = buttonModel
            self.iconTintColor = iconTintColor
            self.defaultTextAligment = textAlignment
        }
        
        public struct ButtonModel {
            public let title: String
            public let style: HMRCButtonStyle
            public let accessibilityIdentifier: String?
            public let inset: EdgeInsets?
            public var handler: VoidHandler
            
            public init(title: String,
                        style: HMRCButtonStyle,
                        accessibilityIdentifier: String? = nil,
                        inset: EdgeInsets? = nil,
                        handler: @escaping VoidHandler
            ) {
                self.title = title
                self.style = style
                self.accessibilityIdentifier = accessibilityIdentifier
                self.inset = inset
                self.handler = handler
            }
        }
    }
}

struct StatusView_Previews: PreviewProvider {
    static var previews: some View {
        HStack(
            alignment: .top,
            spacing: .spacer16,
            content: {
                ScrollView {
                    VStack(
                        alignment: .leading,
                        spacing: .spacer16,
                        content: {
                            Components.Molecules.StatusView(
                                model: .init(
                                    icon: Image(systemName: "moon.stars.fill"),
                                    title: "A title"
                                )
                            )
                            
                            Components.Molecules.StatusView(
                                model: .init(
                                    icon: Image(systemName: "square.and.pencil"),
                                    title: "A title",
                                    body: "A body"
                                )
                            ).background(Color.Semantic.whiteBackground)
                            
                            Components.Molecules.StatusView(
                                model: .init(
                                    icon: Image(systemName: "folder.circle"),
                                    title: "A very very very very very very very very very loooooooong title",
                                    body: "A very very very very very very very very very very very very very very very very very very very loooooooong body",
                                    iconTintColor: Color.Named.green1.colour
                                )
                            ).background(Color.Semantic.whiteBackground)
                            
                            Components.Molecules.StatusView(
                                model: .init(
                                    icon: Image(systemName: "square.and.pencil"),
                                    title: "A title",
                                    body: "A body",
                                    buttonModel: .init(
                                        title: "A button title",
                                        style: .secondary(padding: .spacer12, fullWidth: false, alignment: .center),
                                        accessibilityIdentifier: "identifier",
                                        inset: EdgeInsets(top: 0, leading: .zero, bottom: .spacer12, trailing: 0),
                                        handler: {
                                            print("Status view tapped")
                                        }
                                    )
                                )
                            ).background(Color.Semantic.whiteBackground)
                        }
                    ).frame(
                        maxWidth: .infinity,
                        maxHeight: .infinity,
                        alignment: .leading
                    ).background(
                        Color.Semantic.pageBackground
                    ).padding()
                }
            }
        ).background(Color.Semantic.pageBackground)
    }
}

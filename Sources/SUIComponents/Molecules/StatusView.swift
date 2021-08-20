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
        
        public var body: some View {
            VStack(
                alignment: .center,
                spacing: .spacer16,
                content: {
                    Image(model.icon)
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
                        .fixedSize(horizontal: false, vertical: true)
                    if let body = model.body {
                        Text(body.string)
                            .fixedSize(horizontal: false, vertical: true)
                    }
                    if let buttonModel = model.buttonModel {
                        Button(action: buttonModel.handler) {
                            Text(buttonModel.title)
                        }.styled(buttonModel.style)
                    }
                }
            )
                .frame(maxWidth: .infinity, alignment: .center)
                .padding(.spacer16)
        }

        private struct Constants {
            static let imageSize: CGFloat = 100
        }
    }
}

extension Components.Molecules.StatusView {
    open class Model {
        public let icon: String
        public let title: String
        public let body: NSAttributedString?
        public let buttonModel: ButtonModel?
        public let iconTintColor: Color?
        
        public init(icon: String,
                    title: String,
                    body: NSAttributedString? = nil,
                    buttonModel: ButtonModel? = nil,
                    iconTintColor: Color? = nil
        ) {
            self.icon = icon
            self.title = title
            self.body = body
            self.buttonModel = buttonModel
            self.iconTintColor = iconTintColor
        }
        
        public init(icon: String,
                    title: String,
                    body: String?,
                    buttonModel: ButtonModel? = nil,
                    iconTintColor: Color? = nil
        ) {
            self.icon = icon
            self.title = title
            if let body = body {
                self.body = NSMutableAttributedString.styled_sui(
                    style: .body,
                    string: body
                )
            } else {
                self.body = nil
            }
            self.buttonModel = buttonModel
            self.iconTintColor = iconTintColor
        }
        
        public struct ButtonModel {
            public let title: String
            public let style: HMRCButtonStyle
            public let accessibilityIdentifier: String?
            public var handler: VoidHandler
            
            public init(title: String,
                        style: HMRCButtonStyle,
                        accessibilityIdentifier: String? = nil,
                        handler: @escaping VoidHandler
            ) {
                self.title = title
                self.style = style
                self.accessibilityIdentifier = accessibilityIdentifier
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
                VStack(
                    alignment: .leading,
                    spacing: .spacer16,
                    content: {
                        Components.Molecules.StatusView(
                            model: .init(
                                icon: "moon.stars.fill",
                                title: "A title"
                            )
                        )
                        
                        Components.Molecules.StatusView(
                            model: .init(
                                icon: "square.and.pencil",
                                title: "A title",
                                body: "A body"
                            )
                        ).background(Color.Semantic.whiteBackground)
                        
                        Components.Molecules.StatusView(
                            model: .init(
                                icon: "folder.circle",
                                title: "A very very very very very very very very very loooooooong title",
                                body: "A very very very very very very very very very very very very very very very very very very very loooooooong body",
                                iconTintColor: Color.Named.green1.raw
                            )
                        ).background(Color.Semantic.whiteBackground)

                        Components.Molecules.StatusView(
                            model: .init(
                                icon: "square.and.pencil",
                                title: "A title",
                                body: "A body",
                                buttonModel: .init(
                                    title: "A button title",
                                    style: .primary,
                                    accessibilityIdentifier: "identifier",
                                    handler: {
                                        print("kdsjbf")
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
        ).background(Color.Semantic.pageBackground)
    }
}

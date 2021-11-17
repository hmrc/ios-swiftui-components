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

extension Components.Organisms {
    public struct ExpandingRowView<Content: View>: View {
        let title: String
        let subtitle: String?
        let icon: Image
        let expandedContent: Content
        @State var expanded: Bool = false
        let accessibilityHint: String?
        let shouldAnimateExpansion: Bool
        let accessibilityExpandHint: String?
        let accessibilityCollapseHint: String?
        
        public init(title: String,
                    subtitle: String? = nil,
                    icon: Image,
                    expanded: Bool = false,
                    accessibilityHint: String? = nil,
                    shouldAnimateExpansion: Bool = true,
                    accessibilityExpandHint: String? = nil,
                    accessibilityCollapseHint: String? = nil,
                    @ViewBuilder content: () -> Content) {
            self.title = title
            self.subtitle = subtitle
            self.icon = icon
            self.accessibilityHint = accessibilityHint
            self.shouldAnimateExpansion = shouldAnimateExpansion
            self.accessibilityExpandHint = accessibilityExpandHint
            self.accessibilityCollapseHint = accessibilityCollapseHint
            self.expandedContent = content()
            self.expanded = expanded
        }

        public var body: some View {
            VStack {
                HStack(alignment: .center) {
                    Components.Molecules.IconButtonView(
                        model:
                            .init(
                                icon: icon,
                                title: title,
                                iconTintColor: Color.Semantic.linkText,
                                accessibilityHint: accessibilityHint,
                                accessibilityIdentifier: "IconButtonId",
                                handler: {
                                   tapped()
                                }))
                    Spacer()
                    if let subtitle = subtitle {
                        Text(subtitle).onTapGesture { tapped() }
                    }
                    Image("chevron_down")
                        .rotationEffect(.degrees(expanded ? 0 : -180))
                        .animation(.easeOut)
                        .onTapGesture { tapped() }
                }
                
                if expanded {
                    expandedContent
                        .padding(.spacer16)
                        .animation(.easeIn)
                }
            }
                .onTapGesture { tapped() }
                .accessibility(hint: Text(expansionHint))
        }
        
        //MARK - Helpers
        
        private func tapped() {
            withAnimation {
                expanded.toggle()
            }
        }
        
        private var expansionHint: String {
            expanded ? accessibilityExpandHint ?? "" : accessibilityCollapseHint ?? ""
        }
    }
}

struct ExpandingRowView_Previews: PreviewProvider {
    static var previews: some View {
        HStack(
            alignment: .top,
            spacing: .spacer16,
            content: {
                VStack(
                    alignment: .leading,
                    spacing: .spacer16) {
                    Components.Organisms.ExpandingRowView(
                        title: "Expanding Row",
                        subtitle: "Subtitle",
                        icon: Image(systemName: "moon.stars.fill"),
                        expanded: false,
                        shouldAnimateExpansion: true) {
                        Text("Expanded Content")
                    }
                }
            }
        ).frame(
            maxWidth: .infinity,
            maxHeight: .infinity,
            alignment: .top
        ).background(Color.Semantic.pageBackground)
    }
}

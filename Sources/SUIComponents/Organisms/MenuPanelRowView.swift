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

import SwiftUI

extension Components.Organisms {

    public struct MenuPanelRowView: View, Hashable {
        public let insets: EdgeInsets = EdgeInsets(padding: .spacer16)
        public let model: Model
        
        public static func == (lhs: MenuPanelRowView, rhs: MenuPanelRowView) -> Bool {
            lhs.model.id == rhs.model.id
        }
        
        public func hash(into hasher: inout Hasher) {
            hasher.combine(model.id)
        }
        
        public init(model: Model) {
            self.model = model
        }
        
        public var body: some View {
            VStack(alignment: .leading, spacing: .spacer24) {
                HStack(spacing: .spacer8) {
                    Text(model.title)
                        .foregroundColor(
                            TextStyle.link.textColor
                        )
                        .style(.H5)
                        .allowsTightening(false)
                        .multilineTextAlignment(.leading)
                    Components.Molecules.NotificationBubbleView(model: .init(notificationMode: model.notificationMode))
                }
                .accessibility(hidden: true)
                
                if let body = model.body, !body.isEmpty {
                    Text(body, style: .body)
                        .multilineTextAlignment(.leading)
                        .fixedSize(horizontal: false, vertical: true)
                        .accessibility(hidden: true)
                }
            }
            .cardView(
                insets: insets,
                backgroundColor: Color.Semantic.menuCardBackground,
                disclosureModel: model.disclosureModel
            )
            .accessibility(sortPriority: 1)
            .accessibilityElement(children: .combine) 
            .accessibilityAddTraits(.isButton)
            .optionalAccessibilityIdentifier(model.accessibilityIdentifier)
        }
    }
}
extension Components.Organisms.MenuPanelRowView {
    // MARK: - Model
    public struct Model: Identifiable {
        public var id = UUID()
        public let title: String
        public let body: String?
        public let notificationMode: Components.Molecules
            .NotificationBubbleView.NotificationMode
        public var action: VoidHandler
        public let accessibilityIdentifier: String?
        public let accessibilityHint: String?
        public let disclosureModel: DisclosureView.Model?
        
        public init(title: String,
                    body: String? = nil,
                    notificationMode: Components.Molecules.NotificationBubbleView.NotificationMode,
                    accessibilityIdentifier: String? = nil,
                    accessibilityHint: String? = nil,
                    disclosureModel: DisclosureView.Model? = nil,
                    handler: @escaping VoidHandler
        ) {
            self.title = title
            self.body = body
            self.notificationMode = notificationMode
            self.accessibilityIdentifier = accessibilityIdentifier
            self.accessibilityHint = accessibilityHint
            self.disclosureModel = disclosureModel
            self.action = handler
        }
    }
    
}
struct MenuPanelRowView_Previews: PreviewProvider {
    static var previews: some View {
        VStack(alignment: .leading,spacing: .spacer16)
        {
        
        let disclosureModel: DisclosureView.Model = .init({
            print("disclosure tapped")
        })
        
        Components.Organisms.MenuPanelRowView(
            model: .init(
                title: "Messages",
                body: "Messages and tax letters from HMRC.",
                notificationMode: .number(count: 1, hideWhenZero: false),
                disclosureModel: disclosureModel,
                handler: {
                    print("Panel Row tapped")
                }))
        .padding(0)
        .frame(
            idealWidth: .infinity,
            maxHeight: 100,
            alignment: .leading
        )
        Spacer()
        }
        .padding(.horizontal,.spacer16)
        .background(Color.Semantic.cardBackground)
    }
}


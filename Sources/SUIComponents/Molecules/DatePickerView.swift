//
//  SwiftUIView.swift
//  
//
//  Created by Ashlee Muscroft on 08/11/2023.
//

import SwiftUI

extension Components.Molecules {
    
    public enum datePickerViewStyle: Identifiable, View {
        case graphicalDateView(Binding<Date>)
        case fieldDateView(Binding<Date>, Binding<String>)
        
        public var id: String {
            switch self {
            case .graphicalDateView:
                return "graphicalDateView"
            case .fieldDateView:
                return "feildDateView"
            }
        }
        
        public var body: some View {
            switch self {
            case .graphicalDateView(let date):
                DatePicker("Select a date",
                           selection: date,
                           in: Date()...,
                           displayedComponents: .date)
//                .scaleEffect(x: 1.8,
//                             y: 1.8,
//                             anchor: .topLeading)
                .labelsHidden()
                .datePickerStyle(.graphical)
                .compositingGroup()
                .clipped()
            case .fieldDateView(let date, let input):
                VStack(alignment: .leading, spacing: .spacer16) {
                    Text("Date")
                    TextField("mm/dd/yyyy", text: input)
                        .accessibilityLabel(Text("enter a date, in the format m,m,d,d,y,y,y,y,"))
                        .textFieldStyle(.roundedBorder)
                        .keyboardType(.numberPad)
                        
                    DatePicker("Select a date",
                               selection: date,
                               in: Date()...,
                               displayedComponents: .date)
                    .labelsHidden()
                    .datePickerStyle(.compact)
                }
            }
        }
        
        public var icon: Image {
            switch self {
            case .graphicalDateView:
                return Image("calendar", bundle: .module)
            case .fieldDateView:
                return Image("keyboard", bundle: .module)
            }
        }
    }
    
    public struct GraphicalDateView: View {
        @Binding var date: Date
        public var body: some View {
            DatePicker("Select a date",
                       selection: $date,
                       in: Date()...,
                       displayedComponents: .date)
            .labelsHidden()
            .datePickerStyle(.graphical)
        }
    }
    
    public struct FieldDateView: View {
        @Binding var date: Date
        public var body: some View {
            DatePicker("Select a date",
                       selection: $date,
                       in: Date()...,
                       displayedComponents: .date)
            .labelsHidden()
            .datePickerStyle(.compact)
        }
    }
    
    
    
    public struct DatePickerView: View {
        @State public var date = Date()
        @State public var input: String = ""
        @State var graphicalPickerType: datePickerViewStyle? = nil
        @State var compactPickerType: datePickerViewStyle? = nil
        @State var showGraphicalDateView: Bool = true
        let formatter = Foundation.DateFormatter()
        
        public init() {
            formatter.locale = Locale(identifier: "en_GB")
            formatter.dateFormat = "dd/MM/yyyy"
        }
        
        public var body: some View {
            ScrollView([.horizontal,.vertical],
                       showsIndicators: false) {
                VStack( alignment: .leading) {
                        HStack() {
                            VStack(alignment: .leading) {
                                Text("PaymentDate")
                                    .font(.headline)
                                
                                Text("Today")
                            }.layoutPriority(1)
                            VStack(alignment: .trailing) {
                                Components.Molecules.IconButtonView(model: .init(
                                    icon: showGraphicalDateView
                                    ? Image("keyboard", bundle: .module)
                                    : Image("calendar", bundle: .module),
                                    title: "",
                                    insets: .none,
                                    alignment: .trailing,
                                    handler: {
                                        showGraphicalDateView.toggle()
                                    }
                                ))
                            }
                        }
                        // Toggle the different datepicker view in the associate value enum
                        AnyView(showGraphicalDateView ? graphicalPickerType?.body : compactPickerType?.body )
                }.frame(width:400)
                .onAppear {
                    compactPickerType = .fieldDateView($date, $input)
                    graphicalPickerType = .graphicalDateView($date)
                }.onChange(of: $input.wrappedValue) { _ in
                    //some state needed to monitor if use done editing
                    //@focusState in iOS 16+
                    Task {
                        await dateToText()
                    }
                }
                .onChange(of: $date.wrappedValue ){ _ in
                    input = formatter.string(from: date)
                }
            }
        }
        
        private func dateToText() async {
            try? await Task.sleep(nanoseconds: 1_500_000_000) //0.5 sec
            date = formatter.date(from: input) ?? date
        }
    }
}

struct SwiftUIView_Previews: PreviewProvider {
    static var previews: some View {
        Components.Molecules.DatePickerView()
    }
}


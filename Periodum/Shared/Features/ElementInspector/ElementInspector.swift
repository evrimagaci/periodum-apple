//
//  ElementInspector.swift
//  Periodum (iOS)
//
//  Created by Umur Gedik on 17.01.2022.
//

import SwiftUI
import Introspect

import PeriodumCore

struct ElementInspector: View {
    let element: Element
    @Binding var isShown: Bool
    var body: some View {
        
        VStack(alignment: .leading, spacing: 0) {
            HStack(alignment: .top) {
                PeriodicTableElementView(
                    element: PeriodicTableElementViewModel(from: element),
                    inverse: true
                )
                    .aspectRatio(1, contentMode: .fit)
                    .frame(maxWidth: 85)
                    .shadow(color: element.style.color.opacity(0.3), radius: 8, x: 0, y: 2)
                
                Spacer()
                
                Button(action: dismiss) {
                    Image(systemName: "sidebar.leading")
                        .foregroundColor(.secondary)
                }
            }
            .padding()
            
            Divider()
            List {
                EmptyView()
                Group {
                    ElementInspectorRow("Turkce Isim:", value: element.nameTr)
                    ElementInspectorRow("Ingilizce Isim:", value: element.nameEn)
                    ElementInspectorRow("Sembol:", value: element.symbol)
                    ElementInspectorRow("Atom Numarasi:", value: String(element.number))
                    ElementInspectorRow("Gaz Fazi:", value: String(element.gasPhase))
                    ElementInspectorRow("Allotrop İsimleri:", value: element.allotropeNames)
                    ElementInspectorRow("Görünüm:", value: element.appearance)
                    ElementInspectorRow("Kırılma İndisi:", value: element.refractiveIndex)
                }
                .listRowBackground(Color.clear)
            }
            .introspectTableView { tableView in
                tableView.separatorInset = .init(top: 0, left: 0, bottom: 0, right: 0)
            }
            .listStyle(.plain)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topLeading)
        .background(VisualEffect(effect: UIBlurEffect(style: .systemThinMaterialDark)))
        .colorScheme(.dark)
    }
    
    func dismiss() {
        withAnimation {
            isShown.toggle()
        }
    }
}

struct ElementInspector_Previews: PreviewProvider {
    static var previews: some View {
        ElementInspector(
            element: previewElements[0],
            isShown: .constant(true)
        ).previewLayout(.fixed(width: 300, height: 500))
    }
}

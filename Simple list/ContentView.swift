//
//  ContentView.swift
//  Simple list
//
//  Created by Kaaveh Mohamedi on 12/2/22.
//

import SwiftUI

struct ContentView: View {
    
    @ObservedObject var listViewModel: ListViewModel
    
    var body: some View {
        NavigationView {
            ZStack {
                List {
                    ForEach(listViewModel.items) { item in
                        NavigationLink(
                            destination: {
                                Text("Destination \(item.name)")
                            },
                            label: {
                                Text(item.name)
                            })
                    }
                    .onDelete(perform: { indexSet in
                        listViewModel.delete(at: indexSet)
                    })
                    .onMove(perform: { indices, newOffset in
                        listViewModel.move(indices: indices, newOffset: newOffset)
                    })
                }
                
                if listViewModel.items.isEmpty {
                    Text("There is no item, add one!")
                        .foregroundColor(.gray)
                }
            }
            
            .navigationBarTitle(Text("My List"))
            .toolbar(content: {
                ToolbarItemGroup(placement: .navigationBarTrailing) {
                    EditButton()
                    Button(action: {
                        listViewModel.addItem()
                    }, label: {
                        Image(systemName: "plus")
                    })
                }
            })
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ContentView(listViewModel: ListViewModel.emptyState())
                .previewDisplayName("Empty State")
            ContentView(listViewModel: ListViewModel.withSampleState())
                .previewDisplayName("With Sample State")
        }
    }
}

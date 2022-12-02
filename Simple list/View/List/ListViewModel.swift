//
//  ListViewModel.swift
//  Simple list
//
//  Created by Kaaveh Mohamedi on 12/2/22.
//

import Foundation

class ListViewModel: ObservableObject {
    @Published var items : [Item] = []
    
    init(isForTest: Bool = false) {
        if !isForTest {
            // get items from api
        }
    }
    
    func move(indices: IndexSet, newOffset: Int) {
        items.move(fromOffsets: indices, toOffset: newOffset)
    }
    
    func addItem() {
        items.append(Item(id: UUID(), name: "New Item"))
    }
    
    func delete(at indexSet: IndexSet){
        for index in indexSet {
            items.remove(at: index)
        }
    }
    
    static func emptyState() -> ListViewModel {
        let viewModel = ListViewModel(isForTest: true)
        return viewModel
    }
    
    static func withSampleState() -> ListViewModel {
        let viewModel = ListViewModel(isForTest: true)
        viewModel.items = [
            Item(id: UUID(), name: "First"),
            Item(id: UUID(), name: "Second"),
            Item(id: UUID(), name: "Third"),
        ]
        return viewModel
    }
    
}

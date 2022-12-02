//
//  Simple_listApp.swift
//  Simple list
//
//  Created by Kaaveh Mohamedi on 12/2/22.
//

import SwiftUI

@main
struct Simple_listApp: App {
    
    @StateObject var listViewModel = ListViewModel()
    
    var body: some Scene {
        WindowGroup {
            ContentView(listViewModel: listViewModel)
        }
    }
}

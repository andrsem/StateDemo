//
//  RootView.swift
//  StateDemo
//
//  Created by Andrii Sem on 30.11.2022.
//

import SwiftUI

struct RootView: View {
    var body: some View {
        NavigationStack {
            List {
                Section("Local State") {
                    NavigationLink("Read only", destination: LocalStateReadOnly())
                    NavigationLink("Read and write", destination: LocalStateReadAndWrite())
                    NavigationLink("Read and write with navigation", destination: LocalStateReadAndWriteWithNavigation())
                }

                Section("Global State narrow scope") {
                    NavigationLink("Bad approach", destination: GlobalStateBadApproach())
                        .listRowBackground(Color.red.opacity(0.2))
                    NavigationLink("Not great approach", destination: GlobalStateNotGreatApproach())
                        .listRowBackground(Color.orange.opacity(0.2))
                    NavigationLink("Good approach", destination: GlobalStateGoodApproach())
                        .listRowBackground(Color.green.opacity(0.2))
                    NavigationLink("StateObject vs ObservedObject", destination: StateObjVsObservedObj())
                }

                Section("Application-wide global state") {
                    NavigationLink(
                        "**Not efficient** state with environment object",
                        destination: NotEfficientStateWithEnvironmentObject()
                    )
                    .listRowBackground(Color.red.opacity(0.2))

                    NavigationLink(
                        "**Efficient** state with environment object",
                        destination: EfficientStateWithEnvironmentObject()
                    )
                    .listRowBackground(Color.green.opacity(0.2))

                    NavigationLink(
                        "State through environment value and singleton",
                        destination: StateThroughSingleton()
                    )
                }
            }
            .navigationTitle("State demo")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

struct RootView_Previews: PreviewProvider {
    static var previews: some View {
        RootView()
    }
}

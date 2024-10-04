//
//  FeatureView.swift
//  MyApp
//
//  Created by Radha Devi H on 03/10/24.
//

import SwiftUI
import ComposableArchitecture

	struct FeatureView: View {
		let store: StoreOf<Feature>
		
		var body: some View {
			Form {
				Section {
					Text("\(store.count)")
						.accessibilityIdentifier("countLabel")
					Button("Decrement") { store.send(.decrementButtonTapped) }
					Button("Increment") { store.send(.incrementButtonTapped) }
				}
				
				Section {
					Button("Number fact") { store.send(.numberFactButtonTapped) }
				}
				
				if let fact = store.numberFact {
					Text(fact)
						.accessibilityIdentifier("numberFactLabel")
				}
			}
		}
	}
	
	#Preview {
		FeatureView(
			store: Store(initialState: Feature.State()) {
				Feature()
			}
		)
	}


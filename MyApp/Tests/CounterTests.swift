//
//  CounterTests.swift
//  MyAppTests
//
//  Created by Radha Devi H on 03/10/24.
//

import Testing
import ComposableArchitecture
@testable import MyApp

@MainActor
struct CounterTests {

    @Test
	func basics() async throws {
		let store = TestStore(initialState: Feature.State(count :0)) {
			Feature()
		}
		
        // Write your test here and use APIs like `#expect(...)` to check expected conditions.
		await store.send(.incrementButtonTapped) {
			$0.count = 1
		}
		await store.send(.incrementButtonTapped) {
			$0.count = 2
		}
		await store.send(.decrementButtonTapped) {
			$0.count = 1
		}
    }

}

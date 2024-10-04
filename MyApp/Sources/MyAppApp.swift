import SwiftUI
import ComposableArchitecture

@main
struct MyAppApp: App {
    var body: some Scene {
		WindowGroup {
			FeatureView(
				store: Store(initialState: Feature.State()) {
					Feature()
				}
			)
		}
    }
}

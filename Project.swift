import ProjectDescription

let project = Project(
    name: "MyApp",
    targets: [
        .target(
            name: "MyApp",
            destinations: .iOS,
            product: .app,
            bundleId: "io.tuist.MyApp",
            infoPlist: .extendingDefault(
                with: [
                    "UILaunchScreen": [
                        "UIColorName": "",
                        "UIImageName": "",
                    ],
                ]
            ),
            sources: ["MyApp/Sources/**"],
            resources: ["MyApp/Resources/**"],
			dependencies: [.external(name: "Alamofire", condition: .none), .external(name: "ComposableArchitecture") ]
        ),
        .target(
            name: "MyAppTests",
            destinations: .iOS,
            product: .unitTests,
            bundleId: "io.tuist.MyAppTests",
            infoPlist: .default,
            sources: ["MyApp/Tests/**"],
            resources: [],
            dependencies: [.target(name: "MyApp")]
        ),
		.target(
			name: "MyAppUITests",
			destinations: .iOS,
			product: .uiTests,
			bundleId: "io.tuist.MyAppUITests",
			infoPlist: .default,
			sources: ["MyApp/Tests/MyAppUITests/**"],
			resources: [],
			dependencies: [.target(name: "MyApp")]
		),
		]
)

//
//  FeatureViewTests.swift
//  MyApp
//
//  Created by Radha Devi H on 04/10/24.
//

import XCTest

final class FeatureViewTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.

        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

	func testIncrementButton() throws {
		
		let app = XCUIApplication()
		app.launch()
		let incrementButton = app.buttons["Increment"]
		incrementButton.tap()

		let countText = app.staticTexts["countLabel"]
		XCTAssertEqual(countText.label, "1")
		
	}
	
	func testDecrementButton() throws {
		let app = XCUIApplication()
		app.launch()
		let decrementButton = app.buttons["Decrement"]
		decrementButton.tap()
		
		let countText = app.staticTexts["countLabel"]
		XCTAssertEqual(countText.label, "-1")
		
	}
	
	func testNumberFactButton() throws {
		let app = XCUIApplication()
		app.launch()
		let numberFactButton = app.buttons["Number fact"]
		let numberFactText = app.staticTexts["numberFactLabel"]
		
		//asserting for empty text before tapping
		XCTAssertFalse(numberFactText.exists, "Number fact label should be empty after tapping the button.")
		
		numberFactButton.tap()
		
		//asserting for for non empty text after tapping
		
		XCTAssertFalse(numberFactText.label.isEmpty, "Number fact label should NOT be empty after tapping the button.")
		
	}
	
	func testNumberFactButtonOnchange() throws {
		let app = XCUIApplication()
		app.launch()
		let numberFactButton = app.buttons["Number fact"]
		let numberFactText = app.staticTexts["numberFactLabel"]
		numberFactButton.tap()
		let initialText = numberFactText.label
		
		let incrementButton = app.buttons["Increment"]
		incrementButton.tap() // changing the count value
		
		numberFactButton.tap() //changing the label by button click
		
		XCTAssertNotEqual(numberFactText.label, initialText, "Number fact label should update with a new fact.")
		
		
	}
	
    func testLaunchPerformance() throws {
        if #available(macOS 10.15, iOS 13.0, tvOS 13.0, watchOS 7.0, *) {
            // This measures how long it takes to launch your application.
            measure(metrics: [XCTApplicationLaunchMetric()]) {
                XCUIApplication().launch()
            }
        }
    }
}

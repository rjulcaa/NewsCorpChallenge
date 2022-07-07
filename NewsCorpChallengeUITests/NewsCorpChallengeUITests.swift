//
//  NewsCorpChallengeUITests.swift
//  NewsCorpChallengeUITests
//
//  Created by Richard Julca Amaro on 5/07/22.
//

import XCTest

class NewsCorpChallengeUITests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.

        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func testListLoadedAfterInitialization() throws {
        let app = XCUIApplication()
        app.launch()
        let predicate = NSPredicate(format: "exists == 1")
        let cells = app.tables.firstMatch.cells.firstMatch
        expectation(for: predicate, evaluatedWith: cells)
        waitForExpectations(timeout: 1)
        XCTAssert(app.tables.firstMatch.cells.firstMatch.exists)
    }
    
    func testPhotoDetailDisplayIfCellIsSelected() throws {
        let app = XCUIApplication()
        app.launch()
        let predicate = NSPredicate(format: "exists == 1")
        let cells = app.tables.firstMatch.cells.firstMatch
        expectation(for: predicate, evaluatedWith: cells)
        waitForExpectations(timeout: 1)
        cells.tap()
        XCTAssert(app.images["PhotoDetailId"].exists)
    
    }
    
    func testPullToRefreshIsWorkingCorrectly() {
        let app = XCUIApplication()
        app.launch()
        let firstCell = app.tables.firstMatch.cells.firstMatch
        let start = firstCell.coordinate(withNormalizedOffset: CGVector(dx: 0, dy: 0))
        let finish = firstCell.coordinate(withNormalizedOffset: CGVector(dx: 0, dy: 6))
        start.press(forDuration: 0, thenDragTo: finish)
        sleep(3)
        XCTAssert(app.tables.firstMatch.cells.firstMatch.exists)
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

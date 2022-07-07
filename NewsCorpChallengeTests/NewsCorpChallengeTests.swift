//
//  NewsCorpChallengeTests.swift
//  NewsCorpChallengeTests
//
//  Created by Richard Julca Amaro on 5/07/22.
//

import XCTest
@testable import NewsCorpChallenge

class NewsCorpChallengeTests: XCTestCase {
    
    
    override func setUpWithError() throws {
        
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testDisplayedPhotosInViewCalledByPresenter() {
        let view = PhotoListViewControllerStub()
        let presenter = PhotoListPresenterStub(interactorMock: SuccessFetchPhotosInteractorStub())
        presenter.attachView(view)
        presenter.fetchPhotos()
        XCTAssert(view.photosLoadedFromServer)
    }
    
    func testAlertIsShownIfErrorHappensWhileFetchingData() {
        let view = PhotoListViewControllerStub()
        let presenter = PhotoListPresenterStub(interactorMock: ErrorFetchPhotosInteractorStub())
        presenter.attachView(view)
        presenter.fetchPhotos()
        XCTAssert(view.errorAtLoadingFromServer)
    }
    
    
    func testHTTPRequestIntegration() {
        let datasource = PhotosServiceImp()
        let mainExpectation = expectation(description: "Fetch photos request")
        datasource.fetchPhotos { result in
            switch result {
            case .success(let photos):
                XCTAssert(photos.count > 0)
            case .failure:
                XCTAssert(false)
            }
            mainExpectation.fulfill()
        }
        waitForExpectations(timeout: 5.0)
    }
    
}

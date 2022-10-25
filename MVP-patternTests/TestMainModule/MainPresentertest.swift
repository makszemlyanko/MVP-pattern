//
//  MainPresentertest.swift
//  MVP-patternTests
//
//  Created by Maks Kokos on 25.10.2022.
//

import XCTest
@testable import MVP_pattern

class MockView: MainViewProtocol {
    func succes() {
        <#code#>
    }
    
    func failure(error: Error) {
        <#code#>
    }
    
    var testLabel: String?
    func setGreeting(greeting: String) {
        self.testLabel = greeting
    }
}

class MainPresentertest: XCTestCase {
    
    var view: MockView!
    var comment: Comment!
    var presenter: MainPresenter!
    var network = NetworkService()

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        view = MockView()
        comment = Comment(postId: 1, id: 1, name: "Baz", email: "Bar", body: "Foo")
        presenter = MainPresenter(view: view, network: network)
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        view = nil
        comment = nil
        presenter = nil
    }

    func test_ModuleIsNotNil() {
        XCTAssertNotNil(view)
    }


}

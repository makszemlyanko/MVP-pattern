//
//  RouterTest.swift
//  MVP-patternTests
//
//  Created by Maks Kokos on 25.10.2022.
//

import XCTest
@testable import MVP_pattern

class MockNavController: UINavigationController {
    var presentedVC: UIViewController!
    
    override func pushViewController(_ viewController: UIViewController, animated: Bool) {
        self.presentedVC = viewController
        super.pushViewController(presentedVC, animated: animated)
    }
}

class RouterTest: XCTestCase {
    
    var router: RouterProtocol!
    var navController = MockNavController()
    let builder = ModuleBuilder()

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        router = Router(navController: navController, builder: builder)
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        router = nil
    }

    func test_Router() {
        router.showDetail(comment: nil)
        let detailVC = navController.presentedVC
        XCTAssertTrue(detailVC is DetailViewController)
    }


}

//
//  MainPresentertest.swift
//  MVP-patternTests
//
//  Created by Maks Kokos on 25.10.2022.
//

import XCTest
@testable import MVP_pattern

class MockView: MainViewProtocol {
    func success() {
    }
    
    func failure(error: Error) {
    }
}

class MockNetworkService: NetworkServiceProtocol {
    
    var comments: [Comment]!
    
    init() {}
    
    convenience init(comments: [Comment]?) {
        self.init()
        self.comments = comments
    }
    
    func getComments(completion: @escaping (Result<[Comment]?, Error>) -> ()) {
        if let comments = comments {
            completion(.success(comments))
        } else {
            let error = NSError(domain: "", code: 0, userInfo: nil)
            completion(.failure(error))
        }
    }
}

class MainPresentertest: XCTestCase {
    
    var view: MockView!
    var presenter: MainViewPresenterProtocol!
    var network: NetworkServiceProtocol!
    var router: RouterProtocol!
    var comments = [Comment]()

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        let navController = UINavigationController()
        let builder = ModuleBuilder()
        router = Router(navController: navController, builder: builder)
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        view = nil
        network = nil
        presenter = nil
    }

    func test_GetSuccessComment() {
        let comment = Comment(postId: 1, id: 2, name:  "Bar", email: "Baz", body: "Foo")
        comments.append(comment)
        
        view = MockView()
        network = MockNetworkService(comments: comments)
        presenter = MainPresenter(view: view, network: network, router: router)
        
        var catchComment: [Comment]?
        
        network.getComments { result in
            switch result {
            case .success(let comments):
                catchComment = comments
            case .failure(let error):
                print(error)
            }
        }
        
        XCTAssertNotEqual(catchComment?.count, 0)
    }

}

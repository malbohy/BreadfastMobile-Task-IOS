//
//  postDetailsCoordinatorTestCases.swift
//  BreadfastMobile Task IOSTests
//
//  Created by mohamed albohy on 10/04/2023.
//

import XCTest
@testable import BreadfastMobile_Task_IOS

final class postDetailsCoordinatorTestCases: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() throws {
        let postDetailsCoordinator = PostDetailsCoordinator(post: PostEntity(id: 0, userId: 0, userAvatar: "", userName: "", title: "", body: ""))
        
        let viewObject = postDetailsCoordinator.build()
        XCTAssert(type(of: viewObject) == PostDetailsView.self)
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}

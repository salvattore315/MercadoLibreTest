//
//  MercadoLibreTests.swift
//  MercadoLibreChallengeTests
//
//  Created by Salvador Martinez on 21/12/20.
//

import XCTest
@testable import MercadoLibreChallenge

class MercadoLibreChallengeTests: XCTestCase {

    public let service: ShellWebService = ShellWebService()

    func testItemsSearchService() {
        let expectation1 = expectation(description: "test service asynchronous")
        service.callServiceObject(parameters: ["q": "vaso" as AnyObject],
                                  service: GlobalConstants.NameServices.searchItems,
                                  queryLink: nil) { (data, error) in
            if error != nil {
                XCTAssertNotNil(error, "error was a error")
                expectation1.fulfill()
                return
            }
            
            XCTAssertNil(error, "error was nil")
            XCTAssertNotNil(data, "data was a answer")
            let responseParsed = jsonResponse<[ItemSearched]>.decode(data: data)
            if(responseParsed?.results != nil) {
                XCTAssertNotNil(responseParsed, "data was parce")
            } else {
                XCTAssertNil(responseParsed, "data was nil")
            }
            expectation1.fulfill()
        }
        
        waitForExpectations(timeout: 100, handler: { (error) in
            if let error = error {
                print("Failed : \(error.localizedDescription)")
            }
        })
    }
    
    func testItemDetailService() {
        let expectation1 = expectation(description: "test service asynchronous")
        service.callServiceObject(parameters: nil,
                                  service: GlobalConstants.NameServices.itemDetail,
                                  queryLink: "") {  (data, error) in
            if error != nil {
                XCTAssertNotNil(error, "error was a error")
                expectation1.fulfill()
                return
            }
            
            XCTAssertNil(error, "error was nil")
            XCTAssertNotNil(data, "data was a answer")
            let responseParsed = ItemSelected.decode(data: data)
            if(responseParsed != nil) {
                XCTAssertNotNil(responseParsed, "data was parce")
            } else {
                XCTAssertNil(responseParsed, "data was nil")
            }
            expectation1.fulfill()
        }
        
        waitForExpectations(timeout: 100, handler: { (error) in
            if let error = error {
                print("Failed : \(error.localizedDescription)")
            }
        })
    }
    
    func testItemDetailDescriptionService() {
        let expectation1 = expectation(description: "test service asynchronous")
        service.callServiceObject(parameters: nil,
                                  service: GlobalConstants.NameServices.itemDetailDescription,
                                  queryLink: "") { (data, error) in
            if error != nil {
                XCTAssertNotNil(error, "error was a error")
                expectation1.fulfill()
                return
            }
            
            XCTAssertNil(error, "error was nil")
            XCTAssertNotNil(data, "data was a answer")
            let responseParsed = ItemDescription.decode(data: data)
            if(responseParsed != nil) {
                XCTAssertNotNil(responseParsed, "data was parce")
            } else {
                XCTAssertNil(responseParsed, "data was nil")
            }
            expectation1.fulfill()
        }
        
        waitForExpectations(timeout: 100, handler: { (error) in
            if let error = error {
                print("Failed : \(error.localizedDescription)")
            }
        })
    }
}

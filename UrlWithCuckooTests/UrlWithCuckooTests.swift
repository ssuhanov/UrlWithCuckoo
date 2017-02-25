//
//  UrlWithCuckooTests.swift
//  UrlWithCuckooTests
//
//  Created by Serge Sukhanov on 2/24/17.
//  Copyright © 2017 Serge Sukhanov. All rights reserved.
//

import XCTest
import Cuckoo
@testable import UrlWithCuckoo

class UrlWithCuckooTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testGetSourceUrl() {
        let mock = MockUrlSession()
        let urlStr  = "http://riis.com"
        let url  = URL(string:urlStr)!
        
        // Arrange
        stub(mock) { (mock) in
            mock.getSourceUrl(apiUrl: urlStr).thenReturn(url)
        }
        
        // Act and Assert
        XCTAssertEqual(mock.getSourceUrl(apiUrl: urlStr), url)
        XCTAssertNotEqual(mock.getSourceUrl(apiUrl: urlStr), URL(string:"http://google.com"))
        verify(mock, times(2)).getSourceUrl(apiUrl: urlStr)
    }
    
    func testCallApi() {
        let mock = MockUrlSession()
        let urlStr  = "http://riis.com"
        let url  = URL(string:urlStr)!
        var callApiCount = 0
        
        // Arrange
        stub(mock) { mock in
            mock.callApi(url: equal(to: url, equalWhen: { $0 == $1 })).then { (_) -> String in
                callApiCount += 1
                return "{'firstName': 'John','lastName': 'Smith'}"
            }
        }
        
        // Act and Assert
        XCTAssertEqual(mock.callApi(url: url),"{'firstName': 'John','lastName': 'Smith'}")
        XCTAssertNotEqual(mock.callApi(url: url), "Something else")
        verify(mock, times(2)).callApi(url: equal(to: url, equalWhen: { $0 == $1 }))
        XCTAssertEqual(callApiCount, 2)
    }
    
    func testVariables() {
        let mock = MockUrlSession()
        let urlStr  = "http://riis.com"
        let url  = URL(string:urlStr)!
        
        // Arrange
        stub(mock) { (mock) in
            when(mock.url).get.thenReturn(url)
        }
        
        stub(mock) { (mock) in
            when(mock.session).get.thenReturn(URLSession())
        }
        
        stub(mock) { (mock) in
            when(mock.apiUrl).get.thenReturn(urlStr)
        }
        
        // Act and Assert
        XCTAssertEqual(mock.url?.absoluteString, urlStr)
        XCTAssertNotNil(mock.session)
        XCTAssertEqual(mock.apiUrl, urlStr)
        
        XCTAssertNotNil(verify(mock).url)
        XCTAssertNotNil(verify(mock).session)
        XCTAssertNotNil(verify(mock).apiUrl)
    }
    
}

//
//  PaginationInfoTests.swift
//  edX
//
//  Created by Akiva Leffert on 12/14/15.
//  Copyright © 2015 edX. All rights reserved.
//

import XCTest

import edXCore
@testable import edX

class PaginationInfoTests: XCTestCase {
    
    func testParseSuccess() {
        let json = JSON([
            "count" : 25,
            "num_pages" : 3,
            "previous" : "http://example.com/previous",
            "next" : "http://example.com/next",
            ])
        let info = PaginationInfo(json: json)
        XCTAssertEqual(info!.pageCount, 3)
        XCTAssertEqual(info!.totalCount, 25)
        XCTAssertEqual(info!.next, NSURL(string: "http://example.com/next")!)
        XCTAssertEqual(info!.previous, NSURL(string: "http://example.com/previous")!)
    }
    
    func testParseFailure() {
        let json = JSON([
            "count" : 25,
            "previous" : "http://example.com/previous",
            "next" : "http://example.com/next",
            ])
        let info = PaginationInfo(json: json)
        XCTAssertNil(info)
    }
    
    func testPaginationRequest() {
        let request = NetworkRequest(
            method: .POST,
            path: "fake-path",
            requiresAuth: true,
            body: RequestBody.JSONBody(JSON("test")),
            query: ["A": "B"],
            headers: ["header": "value"],
            deserializer: ResponseDeserializer.JSONResponse { (_, json) in
                return (json.array?.flatMap{ $0.number }).toResult()
            }
        )
        let paginated = request.paginated(page: 3)
        
        // Check that all the parts match up
        XCTAssertEqual(paginated.method, request.method)
        XCTAssertEqual(paginated.path, request.path)
        XCTAssertEqual(paginated.requiresAuth, request.requiresAuth)

        switch paginated.body {
        case let .JSONBody(json):
            XCTAssertEqual(json, JSON("test"))
        default:
            XCTFail()
        }

        XCTAssertEqual(paginated.additionalHeaders!, request.additionalHeaders!)
        XCTAssertEqual(paginated.query[PaginationDefaults.pageParam], JSON(3))
        XCTAssertEqual(paginated.query[PaginationDefaults.pageSizeParam], JSON(PaginationDefaults.pageSize))
        XCTAssertEqual(paginated.query["A"], JSON("B"))
        
        let response = NSHTTPURLResponse(URL: NSURL(string: "http://example.com/")!, statusCode: 200, HTTPVersion: nil, headerFields: nil)!
        switch paginated.deserializer {
        case let .JSONResponse(parser):
            let parse = parser(response, JSON([
                "pagination" : [
                    "count": 50,
                    "num_pages" : 4
                ],
                "results" : [1, 2, 3, 4]
                ]))
            XCTAssertEqual(parse.value!.value, [1, 2, 3, 4])
            XCTAssertEqual(parse.value!.pagination.pageCount, 4)
            XCTAssertEqual(parse.value!.pagination.totalCount, 50)
        default:
            XCTFail()
        }
    }

}



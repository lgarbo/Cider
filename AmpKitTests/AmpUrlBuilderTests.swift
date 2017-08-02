//
//  AmpUrlBuilderTests.swift
//  AmpKitTests
//
//  Created by Scott Hoyt on 8/1/17.
//  Copyright © 2017 Scott Hoyt. All rights reserved.
//

import XCTest
@testable import AmpKit

class AmpUrlBuilderTests: XCTestCase {
    let term = "search term"
    let limit = 10
    let types = [MediaType.albums, MediaType.songs]
    let devToken = "devToken"
    let storefront = Storefront.unitedStates

    var builder: AmpUrlBuilder {
        return AmpUrlBuilder(storefront: storefront, developerToken: devToken)
    }

    var searchRequest: URLRequest {
        return builder.searchRequest(term: term, limit: limit, types: types)
    }
    
    func testSearchRequestUrl() {
        XCTAssertEqual(searchRequest.url?.absoluteString, "https://api.music.apple.com/v1/catalog/us/search?term=search+term&limit=10&types=albums,songs")
    }

    func testSearchRequestHeaders() {
        XCTAssertEqual(searchRequest.allHTTPHeaderFields!, ["Authorization": "bearer devToken"])
    }

    func testSearchRequestMethod() {
        XCTAssertEqual(searchRequest.httpMethod, "GET")
    }
}

//
//  File.swift
//  Canada
//
//  Created by Isac Joseph on 20/03/20.
//  Copyright © 2020 Isac Joseph. All rights reserved.
//

import Foundation

struct FactsResponse: Codable
{
    var title: String
    var rows: [Fact]
}

struct Fact: Codable
{
    var title: String
    var description: String?
    var imageHref: String?
}

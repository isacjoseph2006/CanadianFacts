//
//  AppExtensions.swift
//  Canada
//
//  Created by Isac Joseph on 20/03/20.
//  Copyright © 2020 Isac Joseph. All rights reserved.
//

import UIKit

extension String
{
    var url: URL?
    {
        return URL(string: self)
    }
}

extension NSObject
{
    var screenSize: CGSize
    {
        return UIScreen.main.bounds.size
    }
}

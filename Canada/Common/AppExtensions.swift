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
    
    var isLandscape: Bool
    {
        return UIApplication.shared.statusBarOrientation.isLandscape
    }
    
    var safeArea: UIEdgeInsets
    {
        let window = UIApplication.shared.keyWindow
        return window?.safeAreaInsets ?? UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
    }
    
    var isIpad: Bool
    {
        return UIDevice.current.userInterfaceIdiom == .pad
    }
}

extension UIViewController
{
    func displayAlert(title: String = "", msg: String)
    {
        let alert = UIAlertController(title: title, message: msg, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { action in
        }))
        self.present(alert, animated: true, completion: nil)
    }
}

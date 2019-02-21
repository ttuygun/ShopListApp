//
//  HelperFunctions.swift
//  ShopList
//
//  Created by Abraao on 21/02/19.
//  Copyright © 2019 Abraao Levi. All rights reserved.
//

import Foundation

func printLog(_ message: String, file: String = #file, function: String = #function, line: Int = #line) {
    #if DEVELOPMENT
    let className = file.components(separatedBy: "/").last
    print(" ❌ Error ----> File: \(className ?? ""), Function: \(function), Line: \(line), Message: \(message)")
    #endif
}

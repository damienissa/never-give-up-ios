//
//  Logger.swift
//  
//
//  Created by Dima Virych on 10.08.2020.
//

import Foundation

func logh(_ message: String, file: StaticString = #file, line: Int = #line) {

    #if DEBUG
        print("File: %@, Line: %d, Message: %@", file, line, message)
    #endif
}

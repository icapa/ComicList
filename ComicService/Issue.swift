//
//  Issue.swift
//  ComicList
//
//  Created by Iván Cayón Palacio on 10/10/16.
//  Copyright © 2016 Guillermo Gonzalez. All rights reserved.
//

import Foundation

public struct Issue{
    public let title: String?
    public let coverURL: URL?
}

extension Issue: JSONDecodable{
    public init?(dictionary: JSONDictionary) {
        /*
        guard let title = dictionary["name"] as? String else {
            return nil
        }
        
        self.title = title
         */
        guard let title = dictionary["name"] as? String else{
            return nil
        }
        self.title = title
        self.coverURL = ((dictionary as NSDictionary)
            .value(forKeyPath: "image.small_url") as? String)
            .flatMap { URL(string: $0) }
        
    }
}

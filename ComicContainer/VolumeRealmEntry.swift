//
//  VolumeRealmContainer.swift
//  ComicList
//
//  Created by Iván Cayón Palacio on 12/10/16.
//  Copyright © 2016 Guillermo Gonzalez. All rights reserved.
//


import RealmSwift


class VolumeRealmEntry: Object {
    dynamic var identifier : Int = 0
    dynamic var title : String = ""
    dynamic var publisher : String? = nil
    dynamic var imageURL : String? = nil
    dynamic var insertionDate : Date = Date()

    /*
    var coverURL: URL? {

        get {
            return imageURL.flatMap { URL(string: $0) }
        }
 
        set {
            imageURL = newValue?.absoluteString
        }
    
    }
    */
    
    convenience init (_ volume: Volume){
        self.init()
        self.identifier = volume.identifier
        self.title = volume.title
        self.publisher = volume.publisherName
        self.imageURL = volume.coverURL?.absoluteString
        self.insertionDate = Date()
    }
}

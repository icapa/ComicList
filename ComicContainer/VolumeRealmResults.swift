//
//  VolumeRealmResults.swift
//  ComicList
//
//  Created by Iván Cayón Palacio on 12/10/16.
//  Copyright © 2016 Guillermo Gonzalez. All rights reserved.
//

import UIKit
import RealmSwift

internal final class VolumeRealmResults: NSObject, VolumeResultsType {
    // MARK: - VolumeResultsType
    
    var didUpdate: () -> Void = {}
    
    var numberOfVolumes: Int {
        return (self.results?.count)!
        
    }
    
    func volume(at index: Int) -> Volume {
        //let entry = resultsController.object(at: indexPath)
        let entry = self.results?[index]
        return Volume(entry: entry!)
    }
    
    // MARK : Private
    fileprivate let realm = try! Realm()
    var results : Results<VolumeRealmEntry>?
    
    // MARK : Init
    init(_ realmObjects: Results<VolumeRealmEntry>){
        self.results = realmObjects
        
    }

}

extension VolumeRealmResults{
    
}



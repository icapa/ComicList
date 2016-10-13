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
    
    var token : NotificationToken?
    
    var didUpdate: () -> Void = {}
    
    var numberOfVolumes: Int {
        guard let r = self.results else {
            return 0
        }
        return r.count
        
    }
    
    func volume(at index: Int) -> Volume {
        let entry = self.results?[index]
        return Volume(entry: entry!)
    }
    
        
    var results : Results<VolumeRealmEntry>?
    
    // MARK : Init
    init(_ realmObjects: Results<VolumeRealmEntry>?){
        
        super.init()
        
        guard let r = realmObjects else{
            self.results = nil
            return
        }
        self.results = r
        
        
        let realm = try! Realm()
        token = realm.addNotificationBlock{ (notification, realm)  in
            print("Hubo un cambio.... Eoeoeoeoeoeoeoe")
            self.didUpdate()
        }
    }
    deinit {
        token?.stop()
    }
}

extension VolumeRealmResults{
}



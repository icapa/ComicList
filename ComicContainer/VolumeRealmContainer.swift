//
//  VolumeRealContainer.swift
//  ComicList
//
//  Created by Iván Cayón Palacio on 12/10/16.
//  Copyright © 2016 Guillermo Gonzalez. All rights reserved.
//

import UIKit
import RealmSwift
import RxSwift

final class VolumeRealmContainer {
    
    // Private access
    fileprivate var realm : Realm?
    
}


extension VolumeRealmContainer: VolumeContainerType {
    /// Loads the corresponding store for the container
    func load() -> Observable<Void>{
        return Observable.create { observer in
            do{
                self.realm = try Realm()
                observer.onCompleted()
            }catch{
                observer.onError(error)
            }
            
            return Disposables.create()
        }

    }
    
    /// Saves an array of volumes in the container
    func save(volumes: [Volume]) -> Observable<Void>{
        return Observable.create { observer in
            self.realm?.beginWrite()
            let _ = volumes.map {
                self.realm?.add(VolumeRealmEntry($0))}
            try! self.realm?.commitWrite()
            observer.onCompleted()
            return Disposables.create()
        }
    }
    
    /// Deletes the volume with a given identifier
    func delete(volumeWithIdentifier: Int) -> Observable<Void>{
        return Observable.create { observer in
            observer.onCompleted()
            return Disposables.create()
        }
    }
    
    /// Determines if the container contains a volume with a given identifier
    func contains(volumeWithIdentifier: Int) -> Bool{
        return false
    }
    
    /// Returns all the volumes in the container
    func all() -> VolumeResultsType{
        
    }


}



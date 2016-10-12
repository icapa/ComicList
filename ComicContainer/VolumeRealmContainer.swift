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

final public class VolumeRealmContainer {
    
    // Private access
    fileprivate var realm : Realm?
    
    public init(){
        print("Init Volume Realm Container")
    }
}


extension VolumeRealmContainer: VolumeContainerType {
    /// Loads the corresponding store for the container
    public func load() -> Observable<Void>{
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
    public func save(volumes: [Volume]) -> Observable<Void>{
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
    public func delete(volumeWithIdentifier: Int) -> Observable<Void>{
        return Observable.create { observer in
            let vol = self.realm?.objects(VolumeRealmEntry.self)
                .filter("identifier == %@",volumeWithIdentifier)
            do{
                try self.realm?.write {
                    self.realm?.delete((vol?.last)!)
                }
            }
            catch{
                observer.onError(error)
            }
            observer.onCompleted()
            return Disposables.create()
        }
    }
    
    /// Determines if the container contains a volume with a given identifier
    public func contains(volumeWithIdentifier: Int) -> Bool{
        let vol = self.realm?.objects(VolumeRealmEntry.self)
        .filter("identifier == %@", volumeWithIdentifier)
        if vol == nil{
            return false
        }else{
            if (vol?.count)!>0{
                return true
            }
            else{
                return false
            }
        }
    }
    
    /// Returns all the volumes in the container
    public func all() -> VolumeResultsType{
        let allVols = realm?.objects(VolumeRealmEntry.self)
        let resuls = VolumeRealmResults(allVols!)
        return resuls
        
    }

}



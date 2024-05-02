    //
    //  ListingDataManager.swift
    //  ViperTaskDemo
    //
    //  Created by Asad Amodi on 01/05/2024.
    //

import Foundation
import CoreData

class ListingDataManager: ListingDataManagerProtocol {
    
    func retrieveUniversityList() throws -> [UniversityTable]  {
        
        guard let managedOC = CoreDataStore.managedObjectContext else {
            throw PersistenceError.managedObjectContextNotFound
        }
        
        let request: NSFetchRequest<UniversityTable> = NSFetchRequest(entityName: String(describing: UniversityTable.self))
        
        return try managedOC.fetch(request)
    }
    
    func saveUniversityListing(_ listing: [ListingModel])throws  {
        guard let managedOC = CoreDataStore.managedObjectContext else {
            throw PersistenceError.managedObjectContextNotFound
        }
        if(listing.count>0){
            CoreDataStore.deleteAllRecords(entityName: UniversityTable.self.description())
        }
        for university in listing {
            let newUniversity = UniversityTable(context: managedOC)
            newUniversity.alphaTwoCode = university.alphaTwoCode
            newUniversity.country = university.country
            newUniversity.domains = university.domains
            newUniversity.name = university.name
            newUniversity.stateProvince = university.stateProvince
            newUniversity.webPages = university.webPages
        }
        try managedOC.save()
    }
    
}

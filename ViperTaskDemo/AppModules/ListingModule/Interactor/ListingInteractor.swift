    //
    //  ListingInteractor.swift
    //  ViperTaskDemo
    //
    //  Created by Asad Amodi on 01/05/2024.
    //

import Foundation
class ListingInteractor:NSObject,PresenterToInteractorListingProtocol{
    
    var presenter: InteractorToPresenterListingProtocol?
    var dataManager: ListingDataManagerProtocol?
    
    func fetchListing() {
        
        WebserviceManager.sharedInstance.executeGetRequest(url: getUniversityList) {[unowned self] data, response, error, status in
            if let data = data{
                let model = convertDataToModel(data, type: [ListingModel].self) ?? []
                
                DispatchQueue.main.async { [self] in
                    do{
                        try dataManager?.saveUniversityListing(model)
                        notifyPresenter()
                        
                    }catch{
                        notifyPresenter()
                    }
                }
                
                
            }
            else {
                notifyPresenter()
            }
        }
          
        
    }
    
    
    private func notifyPresenter(){
        do{
            if let fetchedList = try dataManager?.retrieveUniversityList(),fetchedList.count > 0{
                self.presenter?.listingFetchSuccess(listingArray: fetchedList)

            }
            else{
                self.presenter?.listingFetchFailed()
            }
                
        }catch{
            self.presenter?.listingFetchFailed()

        }
       
        
    }
    
}

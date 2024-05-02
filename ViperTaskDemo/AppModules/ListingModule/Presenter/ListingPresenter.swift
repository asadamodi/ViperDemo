//
//  ListingPresenter.swift
//  ViperTaskDemo
//
//  Created by Asad Amodi on 01/05/2024.
//

import Foundation
import UIKit
class ListingPresenter:ViewToPresenterListingProtocol{
    func showDetailsViewController(viewController: DataBackwardDelegate, university: UniversityTable) {
        router?.navigateToDetails(with: viewController, university: university)

    }
    
   
    
    var view: PresenterToViewListingProtocol?
    
    var interactor: PresenterToInteractorListingProtocol?
    
    var router: PresenterToRouterListingProtocol?
    
    func startFetchingListing() {
        interactor?.fetchListing()
    }
   

}

extension ListingPresenter:InteractorToPresenterListingProtocol{

    func listingFetchSuccess(listingArray: Array<UniversityTable>) {
        view?.onListingResponseSuccess(listingModelArrayList: listingArray)
    }
    
    func listingFetchFailed() {
        view?.onListingResponseFailed(error: "Some Error from api response")
    }
    
    
}

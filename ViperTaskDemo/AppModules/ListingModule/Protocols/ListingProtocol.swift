//
//  ListingProtocol.swift
//  ViperTaskDemo
//
//  Created by Asad Amodi on 01/05/2024.
//

import Foundation
import UIKit

protocol ViewToPresenterListingProtocol:AnyObject{
    
    var view: PresenterToViewListingProtocol? {get set}
    var interactor: PresenterToInteractorListingProtocol? {get set}
    var router: PresenterToRouterListingProtocol? {get set}
    func startFetchingListing()
    func showDetailsViewController(viewController: DataBackwardDelegate,university:UniversityTable)

}

protocol PresenterToViewListingProtocol:AnyObject {
    
    func onListingResponseSuccess(listingModelArrayList:Array<UniversityTable>)
    func onListingResponseFailed(error:String)
    func onRefresh()

}

protocol PresenterToRouterListingProtocol:AnyObject {
    
    static func createListingModule()->ListingViewController
    func navigateToDetails(with viewController: DataBackwardDelegate,university:UniversityTable)

}

protocol PresenterToInteractorListingProtocol:AnyObject {
    
    var presenter:InteractorToPresenterListingProtocol? {get set}
    var dataManager:ListingDataManagerProtocol? {get set}

    func fetchListing()
    
}

protocol InteractorToPresenterListingProtocol:AnyObject {
    
    func listingFetchSuccess(listingArray:Array<UniversityTable>)
    func listingFetchFailed()
    
}
protocol ListingDataManagerProtocol:AnyObject {
    func saveUniversityListing(_ listing: [ListingModel])throws
    func retrieveUniversityList() throws -> [UniversityTable]
}
protocol DataBackwardDelegate: UIViewController {
    func onRefresh()
}

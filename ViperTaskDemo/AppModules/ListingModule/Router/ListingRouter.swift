//
//  ListingRouter.swift
//  ViperTaskDemo
//
//  Created by Asad Amodi on 01/05/2024.
//

import Foundation
import UIKit

class ListingRouter:PresenterToRouterListingProtocol{
    func navigateToDetails(with viewController: DataBackwardDelegate, university: UniversityTable) {
   
  
        let detailsVC = DetailsRouter.createDetailsModule(univeristy: university, delegate: viewController)
        
        let viewControllerToPresent = UINavigationController(rootViewController:detailsVC )

        if let sheet = viewControllerToPresent.sheetPresentationController {
            sheet.detents = [ .large()]
            sheet.largestUndimmedDetentIdentifier = .medium
            sheet.prefersScrollingExpandsWhenScrolledToEdge = false
            sheet.prefersEdgeAttachedInCompactHeight = true
            sheet.widthFollowsPreferredContentSizeWhenEdgeAttached = true
            sheet.prefersGrabberVisible = true
        }
        viewController.navigationController?.present(viewControllerToPresent, animated: true, completion:nil)
    }
    
    
    static func createListingModule() -> ListingViewController {
        
        let view = ListingViewController()
        
        let presenter: ViewToPresenterListingProtocol & InteractorToPresenterListingProtocol = ListingPresenter()
        let interactor: PresenterToInteractorListingProtocol = ListingInteractor()
        let dataManager = ListingDataManager()
        let router:PresenterToRouterListingProtocol = ListingRouter()
        
        view.listingPresenter = presenter
        presenter.view = view
        presenter.router = router
        presenter.interactor = interactor
        interactor.presenter = presenter
        interactor.dataManager = dataManager

        return view
        
    }
    
    
    
}

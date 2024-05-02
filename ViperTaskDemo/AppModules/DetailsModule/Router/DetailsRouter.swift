//
//  DetailsRouter.swift
//  ViperTaskDemo
//
//  Created by Asad Amodi on 02/05/2024.
//

import Foundation
import UIKit

class DetailsRouter:PresenterToRouterDetailsProtocol{
    static func createDetailsModule(univeristy: UniversityTable, delegate: DataBackwardDelegate?) -> DetailsViewController {
   
        
        let view = DetailsViewController(universityObj: univeristy )
        view.delegate = delegate
        let presenter: ViewToPresenterDetailsProtocol & InteractorToPresenterDetailsProtocol = DetailsPresenter()
        let interactor: PresenterToInteractorDetailsProtocol = DetailsInteractor()
        let router:PresenterToRouterDetailsProtocol = DetailsRouter()
        
        view.detailsPresenter = presenter
        presenter.view = view
        presenter.router = router
        presenter.interactor = interactor
        interactor.presenter = presenter

        return view
        
    }
    
    
    
}

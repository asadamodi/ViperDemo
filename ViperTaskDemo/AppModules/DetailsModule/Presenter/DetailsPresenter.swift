//
//  DetailsPresenter.swift
//  ViperTaskDemo
//
//  Created by Asad Amodi on 02/05/2024.
//

import Foundation
class DetailsPresenter:ViewToPresenterDetailsProtocol{
    
    var view: PresenterToViewDetailsProtocol?
    
    var interactor: PresenterToInteractorDetailsProtocol?
    
    var router: PresenterToRouterDetailsProtocol?
    

}

extension DetailsPresenter:InteractorToPresenterDetailsProtocol{

    
}

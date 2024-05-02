//
//  DetailsProtocol.swift
//  ViperTaskDemo
//
//  Created by Asad Amodi on 02/05/2024.
//

import Foundation
protocol ViewToPresenterDetailsProtocol:AnyObject{
    
    var view: PresenterToViewDetailsProtocol? {get set}
    var interactor: PresenterToInteractorDetailsProtocol? {get set}
    var router: PresenterToRouterDetailsProtocol? {get set}

}

protocol PresenterToViewDetailsProtocol:AnyObject {

    
}

protocol PresenterToRouterDetailsProtocol:AnyObject {
    
    static func createDetailsModule(univeristy:UniversityTable,delegate:DataBackwardDelegate?)->DetailsViewController

}

protocol PresenterToInteractorDetailsProtocol:AnyObject {
    
    var presenter:InteractorToPresenterDetailsProtocol? {get set}

    
}

protocol InteractorToPresenterDetailsProtocol:AnyObject {
    
    
}

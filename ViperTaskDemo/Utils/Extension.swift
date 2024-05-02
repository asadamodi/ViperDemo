//
//  Extension.swift
//  ViperTaskDemo
//
//  Created by Asad Amodi on 01/05/2024.
//

import Foundation
import UIKit

extension NSObject
{
    func convertModelToData<T:Codable>(_ model:T)->Data?
    {
        do
        {
            let reqData = try JSONEncoder().encode(model)
            return reqData
        }
        catch let error
        {
            print(error)
            return nil
        }
    }
    func convertDataToModel<E:Codable>(_ data:Data , type:E.Type)->E?
    {
        do
        {
            let response = try JSONDecoder().decode(type, from: data)
            return response
        }
        catch let error
        {
            print(error)
            return nil
        }
    }
    
    func isConnectedToInternet(errorMessage:String = "Not connected to internet")->Bool
       {
           let status = Reach().connectionStatus()
           
           switch status
           {
           case .unknown, .offline:
               return false
           case .online(.wwan):
               return true
           case .online(.wiFi):
               return true
           }
           
       }
}


public extension UIViewController
{
    static func topMostViewController() -> UIViewController? {
          
           
        return UIApplication.shared.mainKeyWindow?.rootViewController?.topMostViewController()
       }
       
       func topMostViewController() -> UIViewController? {
           if let navigationController = self as? UINavigationController {
               return navigationController.topViewController?.topMostViewController()
           }
           else if let tabBarController = self as? UITabBarController {
               if let selectedViewController = tabBarController.selectedViewController {
                   return selectedViewController.topMostViewController()
               }
               return tabBarController.topMostViewController()
           }
               
           else if let presentedViewController = self.presentedViewController {
               return presentedViewController.topMostViewController()
           }
           
           else {
               return self
           }
       }
    func hideNavigationBar(flag:Bool)
       {
           self.navigationController?.setNavigationBarHidden(flag, animated: true)
       }
    func showHUD(message:String)
    {
        DispatchQueue.main.async {
            ALLoadingView.manager.resetToDefaults()
            ALLoadingView.manager.showLoadingView(ofType: .messageWithIndicator, windowMode: .fullscreen)
            ALLoadingView.manager.messageText = message
        }
        
    }
    func hideHUD()
    {
        DispatchQueue.main.async {
            ALLoadingView.manager.hideLoadingView(withDelay: 0.0)
        }
    }
    func displayCustomAlert(title:String)
    {
//        let alert = AlertViewController()
//        alert.m_message = title
//        alert.modalPresentationStyle = UIModalPresentationStyle.overCurrentContext
//        alert.modalTransitionStyle = UIModalTransitionStyle.crossDissolve
//        self.present(alert, animated: true, completion: nil)
    }
    
    func displayActivityAlert(title: String)
    {
        DispatchQueue.main.async
            {
                let pending = UIAlertController(title: title, message: nil, preferredStyle: .alert)
                
                self.present(pending, animated: true, completion: nil)
                let deadlineTime = DispatchTime.now() + .seconds(2)
                DispatchQueue.main.asyncAfter(deadline: deadlineTime)
                {
                    pending.dismiss(animated: true, completion: nil)
                    
                }
        }
        
    }
   
     func setNavigationTitleBar(addRightBarButton: Bool = true)
        {
    //        return
            let logo = UIImage(named: "appLogo")
            let imageView = UIImageView(image:logo)
            let y:CGFloat = 8.0
//            imageView.frame = CGRect(x: (self.navigationController?.navigationBar.center.x)!-150, y: y, width: 30, height: 30)
            imageView.frame = CGRect(x: 0, y: y, width: 40, height: 40)

            let label = UILabel(frame: CGRect(x: imageView.frame.origin.x+imageView.frame.size.width+20, y: y, width: 150, height: 30))
            label.text = "Good Night"
            label.textColor = .white //UIColor(red: 156/255, green: 46/255, blue: 62/255, alpha: 1.0)
            label.font = UIFont.boldSystemFont(ofSize: 16.0)

            let titleView = UIView(frame: (self.navigationController?.navigationBar.frame)!)
            titleView.addSubview(imageView)
            titleView.addSubview(label)
            titleView.backgroundColor = .clear
            self.navigationItem.titleView = titleView
            
            if(addRightBarButton)
            {
                let searchImage = UIImage(systemName: "magnifyingglass")
                let searchButton = UIBarButtonItem(image:searchImage, style: .plain, target: self, action: #selector(searchButtonClicked(sender:)))
                self.navigationItem.rightBarButtonItem=searchButton
            }
            
        }
    
        @objc func searchButtonClicked(sender:UIBarButtonItem)
        {
            
        }
    
}
extension UIApplication {
    var mainKeyWindow: UIWindow? {
        get {
            if #available(iOS 13, *) {
                return connectedScenes
                    .flatMap { ($0 as? UIWindowScene)?.windows ?? [] }
                    .first { $0.isKeyWindow }
            } else {
                return keyWindow
            }
        }
    }
}

//
//  ListingViewController.swift
//  ViperTaskDemo
//
//  Created by Asad Amodi on 01/05/2024.
//

import UIKit

class ListingViewController: UIViewController {

    var listingPresenter:ViewToPresenterListingProtocol?

    
    @IBOutlet weak var m_tableView: UITableView!
    let m_reuseIdentifier = "ListingTableViewCell"
    var m_universityList:Array<UniversityTable> = Array()


    override func viewDidLoad() {
        super.viewDidLoad()
        m_tableView.register(UINib(nibName: m_reuseIdentifier, bundle: nil), forCellReuseIdentifier: m_reuseIdentifier)
        m_tableView.tableFooterView = UIView()
        startFetchListing()
        // Do any additional setup after loading the view.
        title = "Universities"
        
    }
    private func startFetchListing(){
        showHUD(message: "pleaseWait".localized())
        listingPresenter?.startFetchingListing()

    }
}
extension ListingViewController:PresenterToViewListingProtocol{
    func onRefresh() {
        startFetchListing()
    }
    
   
    
    
    func onListingResponseSuccess(listingModelArrayList: Array<UniversityTable>) {
        
        self.m_universityList = listingModelArrayList
        self.m_tableView.reloadData()
        hideHUD()
        
    }
    
    func onListingResponseFailed(error: String) {
    
        hideHUD()
        displayActivityAlert(title: "Problem in fetching")
        
    }
    
   
    
    
}

extension ListingViewController: UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return m_universityList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: m_reuseIdentifier, for: indexPath) as! ListingTableViewCell
        cell.m_universityNameLabel.text = m_universityList[indexPath.row].name
        cell.m_universityStateLabel.text = m_universityList[indexPath.row].country
       
        return cell
    }
    
    
}
extension ListingViewController:UITableViewDelegate{
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        listingPresenter?.showDetailsViewController(viewController: self, university: m_universityList[indexPath.row])
    }
}

extension ListingViewController: DataBackwardDelegate{
    
}

    //
    //  DetailsViewController.swift
    //  ViperTaskDemo
    //
    //  Created by Asad Amodi on 01/05/2024.
    //

import UIKit

class DetailsViewController: UIViewController {
    
    var detailsPresenter:ViewToPresenterDetailsProtocol?
    var m_universityObj : UniversityTable?
    weak var delegate: DataBackwardDelegate?

    init(universityObj: UniversityTable?) {
        self.m_universityObj = universityObj
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @IBOutlet weak var m_tableView: UITableView!
    let m_reuseIdentifier = "DetailsTableViewCell"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        m_tableView.register(UINib(nibName: m_reuseIdentifier, bundle: nil), forCellReuseIdentifier: m_reuseIdentifier)
        m_tableView.tableFooterView = UIView()
        
            // Do any additional setup after loading the view.
        let refreshButton = UIBarButtonItem(barButtonSystemItem: .refresh, target: self, action: #selector(refresh))
        self.navigationItem.rightBarButtonItem = refreshButton
        
    }
    
    @objc func refresh() {
        dismiss(animated: true)
        delegate?.onRefresh()
    }
    
    
}
extension DetailsViewController: UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if m_universityObj != nil{
            return 1
        }
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: m_reuseIdentifier, for: indexPath) as! DetailsTableViewCell
        if let universityObj = m_universityObj{
            cell.m_nameLabel.text = universityObj.name
            cell.m_stateLabel.text = universityObj.stateProvince
            cell.m_countryLabel.text = universityObj.country
            cell.m_countryCodeLabel.text = universityObj.alphaTwoCode
            
        }
        
        return cell
    }
    
    
}

extension DetailsViewController: PresenterToViewDetailsProtocol{
    
}

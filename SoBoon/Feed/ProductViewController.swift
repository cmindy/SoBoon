//
//  ProductViewController.swift
//  SoBoon
//
//  Created by CHOMINJI on 25/10/2019.
//  Copyright © 2019 cmindy. All rights reserved.
//

import UIKit

class ProductViewController: UIViewController {
    
    // MARK: - Vars
    
    @IBOutlet weak var productTableView: UITableView!
    
    private let titleList = ["", "댓글"]
    private let dummyList = ["", "", "", ""]
    
    // MARK: - LifeCycle
    
    private func initBackgroundView() {
        self.view.backgroundColor = kWHITE
    }
    
    private func initTableView() {
        let imageCell = UINib(nibName: kProductImageCellID, bundle: nil)
        productTableView.register(imageCell, forCellReuseIdentifier: kProductImageCellID)
        
        let descriptionCell = UINib(nibName: kProductDescriptionCellID, bundle: nil)
        productTableView.register(descriptionCell, forCellReuseIdentifier: kProductDescriptionCellID)
        
        let commentCell = UINib(nibName: kCommentCellID, bundle: nil)
        productTableView.register(commentCell, forCellReuseIdentifier: kCommentCellID)
        
        productTableView.delegate = self
        productTableView.dataSource = self
        
        productTableView.backgroundColor = kWHITE
        productTableView.rowHeight = UITableView.automaticDimension
        productTableView.estimatedRowHeight = 200.0
        productTableView.showsVerticalScrollIndicator = false
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        initBackgroundView()
        initTableView()
    }
    
}

// MARK: - UITableView

extension ProductViewController: UITableViewDataSource {
    
    enum ProductSectionType: Int {
        case image
        case description
        case comment
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return titleList.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == ProductSectionType.image.rawValue {
            return 1
        } else if section == ProductSectionType.description.rawValue {
            return 1
        }
        return dummyList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell: UITableViewCell? = nil
        if indexPath.section ==  ProductSectionType.image.rawValue {
            let cell_ = tableView.dequeueReusableCell(withIdentifier: kProductImageCellID, for: indexPath) as! ProductImageCell
                       cell = cell_
        } else if indexPath.section == ProductSectionType.description.rawValue {
            let cell_ = tableView.dequeueReusableCell(withIdentifier: kProductDescriptionCellID, for: indexPath) as! ProductDescriptionCell
            cell = cell_
        } else {
            let cell_ = tableView.dequeueReusableCell(withIdentifier: kCommentCellID, for: indexPath) as! CommentCell
            
            //                cell_.divider(true)
            //                if indexPath.row == dummyList.count - 1 {
            //                    cell_.divider(false)
            //                }
            
            cell = cell_
        }
        
        return cell!
    }
}

extension ProductViewController: UITableViewDelegate {
    
}


//protocol ProductViewModelItem {
//    var type: ProductSectionType { get }
//    var sectionTitle: String { get }
//    var rowCount: Int { get }
//}
//
//class ProductViewModel {
//    var items: [ProductViewModelItem] = []
//    var reloadSections: ((_ section: Int) -> Void)?
//
//    init() {
//
//    }
//}

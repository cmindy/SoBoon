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
    
    private let titleList = ["", "", "댓글"]
    private let dummyList = [DummyComment(name: "황희희", comment: "혹시 후문에서 쿨거래는 안될까요? ㅎㅎ"),
                        DummyComment(name: "명써니", comment: "당근 빠따 가능한 부분 ^_^"),
                        DummyComment(name: "흔지", comment: "옴마마! 대박 저 이거 진짜 좋아하는데 참여각!"),
                        DummyComment(name: "명써니", comment: "와 흔지님 진짜 배우신분! ")]
    
    
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
            let comment = dummyList[indexPath.row]
            cell_.nameLabel.text = comment.name
            cell_.commentLabel.text = comment.comment
            cell_.dateLabel.text = comment.date
            
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

struct DummyComment {
    let name: String
    let comment: String
    let date: String = "19/10/19 5:00"
}

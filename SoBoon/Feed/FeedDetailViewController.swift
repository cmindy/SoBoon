//
//  FeedDetailViewController.swift
//  SoBoon
//
//  Created by CHOMINJI on 25/10/2019.
//  Copyright © 2019 cmindy. All rights reserved.
//

import UIKit

class FeedDetailViewController: BaseViewController {
    
    // MARK: - Vars
    
    @IBOutlet weak var navigationView: GeneralNavigationView!
    @IBOutlet weak var productTableView: UITableView!
    
    private let titleList = ["", "", "댓글"]
    private let dummyList = [DummyComment(name: "황희희", comment: "혹시 후문에서 쿨거래는 안될까요? ㅎㅎ"),
                        DummyComment(name: "명써니", comment: "당근 빠따 가능한 부분 ^_^"),
                        DummyComment(name: "흔지", comment: "옴마마! 대박 저 이거 진짜 좋아하는데 참여각!"),
                        DummyComment(name: "명써니", comment: "와 흔지님 진짜 배우신분! ")]
    
    
    // MARK: - LifeCycle
    
    private func initVars() {
        self.isShowBigTitle = false
    }
    
    private func initBackgroundView() {
        self.view.backgroundColor = kWHITE
    }
    
    private func initNavigationView() {
        navigationView.showBigTitle(bigTitle: isShowBigTitle)
        navigationView.backgroundColor = kWHITE
        navigationView.divider(false)
        navigationView.naviButtonColor(color: kGRAY_700)
        navigationView.showBackButton()
    }
    
    private func initTableView() {
        let imageCell = UINib(nibName: FeedDetailImageCell.reuseID, bundle: nil)
        productTableView.register(imageCell, forCellReuseIdentifier: FeedDetailImageCell.reuseID)
        
        let descriptionCell = UINib(nibName: ProductDescriptionCell.reuseID, bundle: nil)
        productTableView.register(descriptionCell, forCellReuseIdentifier: ProductDescriptionCell.reuseID)
        
        let commentCell = UINib(nibName: CommentCell.reuseID, bundle: nil)
        productTableView.register(commentCell, forCellReuseIdentifier: CommentCell.reuseID)
        
        productTableView.delegate = self
        productTableView.dataSource = self
        
        productTableView.backgroundColor = kWHITE
        productTableView.rowHeight = UITableView.automaticDimension
        productTableView.estimatedRowHeight = 200.0
        productTableView.showsVerticalScrollIndicator = false
        productTableView.separatorStyle = .none
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        initVars()
        initBackgroundView()
        initNavigationView()
        initTableView()
    }
    
}

// MARK: - UITableView

extension FeedDetailViewController: UITableViewDataSource {
    
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
            let cell_ = tableView.dequeueReusableCell(withIdentifier: FeedDetailImageCell.reuseID, for: indexPath) as! FeedDetailImageCell
            cell = cell_
        } else if indexPath.section == ProductSectionType.description.rawValue {
            let cell_ = tableView.dequeueReusableCell(withIdentifier: ProductDescriptionCell.reuseID, for: indexPath) as! ProductDescriptionCell
            cell = cell_
        } else {
            let cell_ = tableView.dequeueReusableCell(withIdentifier: CommentCell.reuseID, for: indexPath) as! CommentCell
            cell_.entity(item: dummyList[indexPath.row])
            
            //                cell_.divider(true)
            //                if indexPath.row == dummyList.count - 1 {
            //                    cell_.divider(false)
            //                }
            
            cell = cell_
        }
        
        return cell!
    }
}

extension FeedDetailViewController: UITableViewDelegate {
    
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

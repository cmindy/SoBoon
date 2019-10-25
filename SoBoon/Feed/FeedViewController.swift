//
//  FeedViewController.swift
//  SoBoon
//
//  Created by CHOMINJI on 17/10/2019.
//  Copyright © 2019 cmindy. All rights reserved.
//

import UIKit

class FeedViewController: BaseViewController {

    // MARK: - Vars
    
    @IBOutlet weak var mainTableViewTopConstraint: NSLayoutConstraint!
    @IBOutlet weak var navigationViewTopConstraint: NSLayoutConstraint!
    @IBOutlet weak var searchViewTopConstraint: NSLayoutConstraint!
    @IBOutlet weak var searchViewHeightConstraint: NSLayoutConstraint!
    
    @IBOutlet weak var mainTableView: UITableView!
    @IBOutlet weak var navigationView: FeedNavigationView!
    @IBOutlet weak var navigationViewHeightConstraint: NSLayoutConstraint!
    @IBOutlet weak var searchView: FeedSearchView!
    
    private let titleList = ["어떤 물건을 소분할까요?", "실시간 소분"]
    private let dummyList = ["", "", "", "", "", ""]
    private var previousOffset: CGFloat = 0.0
    
    // MARK: - Life Cycle
    
    private func initBackgroundView() {
        self.view.backgroundColor = kPINK_500
    }
    
    private func initTableView() {
        let titleHeaderView = UINib(nibName: kFeedTitleHeaderViewID, bundle: nil)
        mainTableView.register(titleHeaderView, forHeaderFooterViewReuseIdentifier: kFeedTitleHeaderViewID)
        
        let footerView = UINib(nibName: kGeneralEmptyFooterViewID, bundle: nil)
        mainTableView.register(footerView, forHeaderFooterViewReuseIdentifier: kGeneralEmptyFooterViewID)
        
        let categoryCell = UINib(nibName: kFeedCategoryCellID, bundle: nil)
        mainTableView.register(categoryCell, forCellReuseIdentifier: kFeedCategoryCellID)
        
        let listCell = UINib(nibName: kFeedListCellID, bundle: nil)
        mainTableView.register(listCell, forCellReuseIdentifier: kFeedListCellID)
        
        mainTableView.delegate = self
        mainTableView.dataSource = self
        
        mainTableView.separatorStyle = .none
        mainTableView.backgroundColor = kWHITE
        mainTableView.sectionFooterHeight = UITableView.automaticDimension
        mainTableView.estimatedSectionFooterHeight = 10.0
        mainTableView.sectionHeaderHeight = UITableView.automaticDimension
        mainTableView.estimatedSectionHeaderHeight = 44.0
        mainTableView.rowHeight = UITableView.automaticDimension
        mainTableView.estimatedRowHeight = 200.0
        mainTableView.showsVerticalScrollIndicator = false
       // mainTableView.contentInset = UIEdgeInsets(top: navigationViewHeightConstraint.constant + 32.0, left: 0.0, bottom: 0.0, right: 0.0)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        initBackgroundView()
        initTableView()
        setInteractiveRecognizer()
    }

}

// MARK: - UITableView

extension FeedViewController: UITableViewDataSource {

    enum FeedSectionType: Int {
        case categories
        case list
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return titleList.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == FeedSectionType.categories.rawValue {
            return 1
        }
        return dummyList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell: UITableViewCell? = nil
        
        if indexPath.section == FeedSectionType.categories.rawValue {
            guard let cell_ = tableView.dequeueReusableCell(withIdentifier: kFeedCategoryCellID, for: indexPath) as? FeedCategoryCell else {
                return .init()
            }
            cell_.entity()
            cell = cell_
        } else {
            guard let cell_ = tableView.dequeueReusableCell(withIdentifier: kFeedListCellID, for: indexPath) as? FeedListCell else {
                return .init()
            }
            
            cell_.divider(true)
            if indexPath.row == dummyList.count - 1 {
                cell_.divider(false)
            }
            
            cell = cell_
        }
        
        return cell!
    }
    
}

extension FeedViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = tableView.dequeueReusableHeaderFooterView(withIdentifier: kFeedTitleHeaderViewID) as! FeedTitleHeaderView
        let title = titleList[section]
        headerView.title(title)
        
        return headerView
    }
    
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        if section == FeedSectionType.categories.rawValue {
            guard let footerView = tableView.dequeueReusableHeaderFooterView(withIdentifier: kGeneralEmptyFooterViewID) as? GeneralEmptyFooterView else {
                return .init()
            }
            return footerView
        }
        return nil
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        let sb = UIStoryboard.init(name: "Feed", bundle: nil)
        let vc = sb.instantiateViewController(withIdentifier: "ProductViewController") as! ProductViewController
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    
    
}

extension FeedViewController: UIScrollViewDelegate {
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        
        let offset = scrollView.contentOffset.y
        let delta = previousOffset - offset
        print("contentOffset y =  \(scrollView.contentOffset.y)")
        print("previousOffset y =  \(previousOffset)")
        print("delta =  \(delta)")
        
        let absoluteTop: CGFloat = 0
        let absoluteBottom: CGFloat = scrollView.contentSize.height - scrollView.frame.size.height
        
        let isScrollingDown = delta > 0 && scrollView.contentOffset.y > absoluteTop
        let isScrollingUp = delta < 0 && scrollView.contentOffset.y < absoluteBottom
        print("\(isScrollingDown) : \(isScrollingUp)")
        
        // 검색창 높이: 50
        // 카테고리높이: 80
        // 헤더 높이: 44
        let height: CGFloat = 124.0
        if isScrollingUp, offset > height / 2.0 {
            UIView.animate(withDuration: 0.5, animations: {
                self.navigationView.titleLabel.isHidden = true
                self.navigationView.addressLabel.isHidden = true
                self.navigationView.iconImageview.isHidden = true
                
                self.mainTableViewTopConstraint.constant = self.navigationViewHeightConstraint.constant * -1.0
                self.searchView.frame.origin.y = self.view.safeAreaInsets.top
            
                if let header = self.mainTableView.headerView(forSection: FeedSectionType.categories.rawValue) {
                    header.isHidden = true
                }

                if let cell = self.mainTableView.cellForRow(at: IndexPath(row: 0, section: FeedSectionType.categories.rawValue)) as? FeedCategoryCell {
                    self.navigationView.insertSubview(cell, aboveSubview: self.navigationView.baseView)
                    cell.frame.origin.y = self.searchViewHeightConstraint.constant
                }
                
                self.view.layoutIfNeeded()
            })
        } else if isScrollingDown, offset < height / 2.0 {
            UIView.animate(withDuration: 0.5) {
                self.navigationView.titleLabel.isHidden = false
                self.navigationView.addressLabel.isHidden = false
                self.navigationView.iconImageview.isHidden = false
                
                self.mainTableViewTopConstraint.constant = 0
                
                self.searchView.frame.origin.y = self.navigationViewHeightConstraint.constant
                
                if let header = self.mainTableView.headerView(forSection: FeedSectionType.categories.rawValue) {
                    header.isHidden = false
                }
                
                if let cell = self.mainTableView.cellForRow(at: IndexPath(row: 0, section: FeedSectionType.categories.rawValue)) as? FeedCategoryCell {
                    self.navigationView.willRemoveSubview(cell)
                    self.mainTableView.reloadRows(at: [IndexPath(row: 0, section: FeedSectionType.categories.rawValue)], with: .none)
                }
                
                self.view.layoutIfNeeded()
                
            }
        }
        previousOffset = offset
    }
}

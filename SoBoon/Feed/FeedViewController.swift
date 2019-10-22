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
        mainTableView.contentInset = UIEdgeInsets(top: navigationViewHeightConstraint.constant + 32.0, left: 0.0, bottom: 0.0, right: 0.0)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        initBackgroundView()
        initTableView()
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
    }
    
    
    
}

extension FeedViewController: UIScrollViewDelegate {
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        
        let offset = scrollView.contentOffset.y
        
        let temp = navigationViewHeightConstraint.constant + 32.0 //172
        
        let delta = previousOffset - offset
        print("contentOffset y =  \(scrollView.contentOffset.y)")
        print("previousOffset y =  \(previousOffset)")
        print("delta =  \(delta)")
        
        if offset > -144 {
            
            UIView.animate(withDuration: 1.0, animations: {
                self.navigationView.titleLabel.isHidden = true
                self.navigationView.addressLabel.isHidden = true
                self.navigationView.iconImageview.isHidden = true
                
                self.mainTableViewTopConstraint.constant = -172.0 + 40
                self.searchView.frame.origin.y = self.view.safeAreaInsets.top
                
                
                if let header = self.mainTableView.headerView(forSection: FeedSectionType.categories.rawValue) {
                    header.isHidden = true
                }
                
                self.view.layoutIfNeeded()
            }) { finished in
                if finished {
                    if let cell = self.mainTableView.cellForRow(at: IndexPath(row: 0, section: FeedSectionType.categories.rawValue)) as? FeedCategoryCell {
                        self.navigationView.insertSubview(cell, aboveSubview: self.navigationView.baseView)
                        cell.frame.origin.y = self.searchViewHeightConstraint.constant
                        self.mainTableView.contentInset.top = self.navigationViewHeightConstraint.constant - self.searchViewHeightConstraint.constant
                    }
                }
            }
            //        }
//            if offset < -172.0 {
//                if let cell = self.mainTableView.cellForRow(at: IndexPath(row: 0, section: FeedSectionType.categories.rawValue)) {
//                    cell.frame.origin.y = self.mainTableViewTopConstraint.constant + 100 + 25 + 44
//                }
//            }
//
            
        }
        
        
        previousOffset = offset
//
//        let headerCell = mainTableView.cellForRow(at: IndexPath(row: 0, section: FeedSectionType.categories.rawValue))
//        if headerCell == nil || (headerCell!.frame.origin.y < self.mainTableView.contentOffset.y + headerCell!.frame.height/2) {
//            if let hdr = header {
//                hdr.isHidden = false
//                hdr.frame = CGRect(x: 0, y: self.mainTableViewTopConstraint.constant, width: hdr.frame.size.width, height: hdr.frame.size.height)
//                if !self.mainTableView.subviews.contains(hdr) {
//                    self.mainTableView.addSubview(hdr)
//                }
//                self.mainTableView.bringSubviewToFront(hdr)
//            }
//        }
        
        
        
//        guard headerCell == nil || (headerCell!.frame.origin.y < self.mainTableView.contentOffset.y + headerCell!.frame.height/2) else {
//            header?.isHidden = true
//            return
//        }
//        guard let hdr = header else { return }
//        hdr.isHidden = false
//        hdr.frame = CGRect(x: 0, y: 0, width: hdr.frame.size.width, height: hdr.frame.size.height)
//        if !mainTableView.subviews.contains(hdr) {
//            mainTableView.addSubview(hdr)
//        }
//        mainTableView.bringSubviewToFront(hdr)
       

//        if (offset > -temp && offset < 0) {
//            print(temp)
//            self.navigationViewTopConstraint.constant = -(temp + offset)
//            self.mainTableViewTopConstraint.constant = -(temp + offset)
//        }
//        if (offset > -temp && delta < 0) {
////            mainTableView.contentInset = UIEdgeInsets(top: -offset , left: 0.0, bottom: 0.0, right: 0.0)
////            UIView.animate(withDuration: 1.0) {
//                self.mainTableView.contentInset.top = 100.0
//                self.navigationViewTopConstraint.constant = -172.0 + 32.0
//                self.mainTableViewTopConstraint.constant = -172.0 + 40
//
//
//
////                self.view.layoutIfNeeded()
////            }
//        }
    }
    
}

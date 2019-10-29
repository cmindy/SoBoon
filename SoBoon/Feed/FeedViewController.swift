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

    private let maxNavigationViewHeight: CGFloat = 140.0
    let minNavigationViewHeight: CGFloat = 70.0
    
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
        let titleHeaderView = UINib(nibName: FeedTitleHeaderView.reuseID, bundle: nil)
        mainTableView.register(titleHeaderView, forHeaderFooterViewReuseIdentifier: FeedTitleHeaderView.reuseID)
        
        let footerView = UINib(nibName: GeneralEmptyFooterView.reuseID, bundle: nil)
        mainTableView.register(footerView, forHeaderFooterViewReuseIdentifier: GeneralEmptyFooterView.reuseID)
        
        let categoryCell = UINib(nibName: FeedCategoryCell.reuseID, bundle: nil)
        mainTableView.register(categoryCell, forCellReuseIdentifier: FeedCategoryCell.reuseID)
        
        let listCell = UINib(nibName: FeedListCell.reuseID, bundle: nil)
        mainTableView.register(listCell, forCellReuseIdentifier: FeedListCell.reuseID)
        
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
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        navigationViewHeightConstraint.constant = maxNavigationViewHeight
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
//            guard let cell_ = tableView.dequeueReusableCell(withIdentifier: kFeedCategoryCellID, for: indexPath) as? FeedCategoryCell else {
//                return .init()
//            }
//            cell_.entity()
//            cell = cell_
            cell = UITableViewCell()
        } else {
            guard let cell_ = tableView.dequeueReusableCell(withIdentifier: FeedListCell.reuseID, for: indexPath) as? FeedListCell else {
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
        var headerView: UIView? = nil
        if section == FeedSectionType.categories.rawValue {
            let headerView_ = tableView.dequeueReusableCell(withIdentifier: FeedCategoryCell.reuseID) as! FeedCategoryCell
            headerView = headerView_
        } else {
            let headerView_ = tableView.dequeueReusableHeaderFooterView(withIdentifier: FeedTitleHeaderView.reuseID) as! FeedTitleHeaderView
            let title = titleList[section]
            headerView_.title(title)
            
            headerView = headerView_
        }
        return headerView
    }
    
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        if section == FeedSectionType.categories.rawValue {
            guard let footerView = tableView.dequeueReusableHeaderFooterView(withIdentifier: GeneralEmptyFooterView.reuseID) as? GeneralEmptyFooterView else {
                return .init()
            }
            return footerView
        }
        return nil
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        let sb = UIStoryboard.init(name: "Feed", bundle: nil)
        let vc = sb.instantiateViewController(withIdentifier: "FeedDetailViewController") as! FeedDetailViewController
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
        
        // 검색창 높이: 50
        // 카테고리높이: 80
        // 헤더 높이: 44
        let height: CGFloat = 124.0
        
        if canAnimateHeader(scrollView) {
            var newHeight = navigationViewHeightConstraint.constant
            if isScrollingDown {
                newHeight = max(self.minNavigationViewHeight, self.navigationViewHeightConstraint.constant - abs(delta))
            } else if isScrollingUp {
                newHeight = min(self.maxNavigationViewHeight, self.navigationViewHeightConstraint.constant + abs(delta))
            }
            
            if newHeight != self.navigationViewHeightConstraint.constant {
                self.navigationViewHeightConstraint.constant = newHeight
                self.updateHeader()
                setScrollPosition(position: self.previousOffset)
            }
        }
        
        //        if isScrollingUp, offset > height / 2.0 {
//            UIView.animate(withDuration: 0.5, animations: {
//                self.navigationView.titleLabel.isHidden = true
//                self.navigationView.addressLabel.isHidden = true
//                self.navigationView.iconImageview.isHidden = true
//
////                self.mainTableViewTopConstraint.constant = self.navigationViewHeightConstraint.constant * -1.0
//
//                self.searchView.frame.origin.y = self.view.safeAreaInsets.top
//
//                if let header = self.mainTableView.headerView(forSection: FeedSectionType.categories.rawValue) {
//                    header.isHidden = true
//                }
//                self.view.layoutIfNeeded()
//            })
//        } else if isScrollingDown, offset < height / 2.0 {
//            UIView.animate(withDuration: 0.5) {
//                self.navigationView.titleLabel.isHidden = false
//                self.navigationView.addressLabel.isHidden = false
//                self.navigationView.iconImageview.isHidden = false
//
//                self.mainTableViewTopConstraint.constant = 0
//
//                self.searchView.frame.origin.y = self.navigationViewHeightConstraint.constant
//
//                if let header = self.mainTableView.headerView(forSection: FeedSectionType.categories.rawValue) {
//                    header.isHidden = false
//                }
//
//                if let cell = self.mainTableView.cellForRow(at: IndexPath(row: 0, section: FeedSectionType.categories.rawValue)) as? FeedCategoryCell {
//                    self.navigationView.willRemoveSubview(cell)
//                    self.mainTableView.reloadRows(at: [IndexPath(row: 0, section: FeedSectionType.categories.rawValue)], with: .none)
//                }
//
//                self.view.layoutIfNeeded()
//
//            }
//        }
        previousOffset = offset
    }
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        self.scrollViewDidStopScrolling()
    }

    func scrollViewDidEndDragging(_ scrollView: UIScrollView, willDecelerate decelerate: Bool) {
        if !decelerate {
            self.scrollViewDidStopScrolling()
        }
    }

    func scrollViewDidStopScrolling() {
        let range = self.maxNavigationViewHeight - self.minNavigationViewHeight
        let midPoint = self.minNavigationViewHeight + (range / 2)

        if self.navigationViewHeightConstraint.constant > midPoint {
            self.expandHeader()
        } else {
            self.collapseHeader()
        }
    }
    
    func canAnimateHeader(_ scrollView: UIScrollView) -> Bool {
     // Calculate the size of the scrollView when header is collapsed
     let scrollViewMaxHeight = scrollView.frame.height + self.navigationViewHeightConstraint.constant - minNavigationViewHeight

     // Make sure that when header is collapsed, there is still room to scroll
     return scrollView.contentSize.height > scrollViewMaxHeight
    }
    
    func setScrollPosition(position: CGFloat) {
        self.mainTableView.contentOffset = CGPoint(x: self.mainTableView.contentOffset.x, y: position)
    }
    
    func collapseHeader() {
        self.view.layoutIfNeeded()
        UIView.animate(withDuration: 0.2, animations: {
            self.navigationViewHeightConstraint.constant = self.minNavigationViewHeight
            self.updateHeader()
            self.view.layoutIfNeeded()
        })
    }
    
    func expandHeader() {
     self.view.layoutIfNeeded()
        UIView.animate(withDuration: 0.2, animations: {
     self.navigationViewHeightConstraint.constant = self.maxNavigationViewHeight
     // Manipulate UI elements within the header here
     self.view.layoutIfNeeded()
     })
    }

    func updateHeader() {
        let range = self.maxNavigationViewHeight - self.minNavigationViewHeight
        let openAmount = self.navigationViewHeightConstraint.constant - self.minNavigationViewHeight
        let percentage = openAmount / range

//        self.constraint.constant = -openAmount + 10
//        self.logoImageView.alpha = percentage
        self.navigationView.alpha = percentage
    }

}

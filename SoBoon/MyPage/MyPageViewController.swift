//
//  MyPageViewController.swift
//  SoBoon
//
//  Created by CHOMINJI on 15/10/2019.
//  Copyright © 2019 cmindy. All rights reserved.
//

import UIKit

class MyPageViewController: BaseViewController {

    // MARK: - Vars
    
    @IBOutlet weak var navigationView: GeneralNavigationView!
    @IBOutlet weak var myPageTableView: UITableView!
    
    private let preferencesTitles = ["연결된 애플 아이디",
                                     "등록지역",
                                     "공지사항",
                                     "설정"]
    private let contents = ["abcd@gmail.com",
                            "서울시 성북구 보문로 34", nil, nil]
    
    // MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()

        initAttributes()
    }
}

// MARK: - Attributes

extension MyPageViewController {
    private func initAttributes() {
        initVars()
        initBackgroundView()
        initNavigationView()
        initTableView()
    }
    
    private func initVars() {
        self.isShowBigTitle = false
    }
    
    private func initBackgroundView() {
        self.view.backgroundColor = kWHITE
    }
    
    private func initNavigationView() {
        self.navigationView.showBigTitle(bigTitle: self.isShowBigTitle)
        self.navigationView.bgColor(kWHITE)
        self.navigationView.titleColor(kGRAY_800)
        self.navigationView.title("마이페이지")
        self.navigationView.divider(false)
        self.navigationView.naviButtonColor(color: kGRAY_700)
        self.navigationView.showBackButton()
        self.setInteractiveRecognizer()
    }
    
    private func initTableView() {
        let profileHeaderView = UINib(nibName: MyPageProfileHeaderView.reuseID, bundle: nil)
        myPageTableView.register(profileHeaderView, forHeaderFooterViewReuseIdentifier: MyPageProfileHeaderView.reuseID)
        
        let preferencesCell = UINib(nibName: MyPagePreferencesCell.reuseID, bundle: nil)
        myPageTableView.register(preferencesCell, forCellReuseIdentifier: MyPagePreferencesCell.reuseID)
        
        myPageTableView.dataSource = self
        myPageTableView.delegate = self
        
        myPageTableView.backgroundColor = kWHITE
        myPageTableView.sectionHeaderHeight = UITableView.automaticDimension
        myPageTableView.estimatedSectionHeaderHeight = 200.0
        myPageTableView.rowHeight = UITableView.automaticDimension
        myPageTableView.estimatedRowHeight = 100.0
        myPageTableView.showsVerticalScrollIndicator = false
        myPageTableView.separatorStyle = .none
    }
}

// MARK: - UITableView

extension MyPageViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return preferencesTitles.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: MyPagePreferencesCell.reuseID, for: indexPath) as! MyPagePreferencesCell
        
        let title = preferencesTitles[indexPath.row]
        let content = contents[indexPath.row]
        cell.configure(title: title, content: content)
        return cell
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = tableView.dequeueReusableHeaderFooterView(withIdentifier: MyPageProfileHeaderView.reuseID) as! MyPageProfileHeaderView
        
        return headerView
    }
}

extension MyPageViewController: UITableViewDelegate {
    
}

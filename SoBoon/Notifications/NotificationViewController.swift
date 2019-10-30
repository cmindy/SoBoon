//
//  NotificationViewController.swift
//  SoBoon
//
//  Created by CHOMINJI on 07/10/2019.
//  Copyright © 2019 cmindy. All rights reserved.
//

import UIKit


class NotificationViewController: BaseViewController {

    // MARK: - Vars
    
    @IBOutlet weak var navigationView: GeneralNavigationView!
    @IBOutlet weak var notificationTableView: UITableView!
    
    private let dummyList: [DummyNotification] = ["사과즙 같이 삽시다", "귤 한박스 반으로 나누실 분~", "귤 한박스 반으로 나누실 분 구합니다!", "달콤한 갈비만두 나누실 분", "사과즙 같이 삽시다."]
        .map { DummyNotification(title: $0) }

    // MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()

        initAttributes()
    }

}

// MARK: - Attributes

extension NotificationViewController {
    
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
        self.navigationView.title("알림")
        self.navigationView.divider(false)
         navigationView.naviButtonColor(color: kGRAY_700)
        self.navigationView.showBackButton()
        self.setInteractiveRecognizer()
    }
    
    private func initTableView() {
        let notificationCell = UINib(nibName: NotificationCell.reuseID, bundle: nil)
        notificationTableView.register(notificationCell, forCellReuseIdentifier: NotificationCell.reuseID)
        
        notificationTableView.delegate = self
        notificationTableView.dataSource = self
        
        notificationTableView.separatorStyle = .none
        notificationTableView.backgroundColor = kWHITE
        notificationTableView.rowHeight = UITableView.automaticDimension
        notificationTableView.estimatedRowHeight = 200.0
        notificationTableView.showsVerticalScrollIndicator = false
    }
}

// MARK: - UITableView

extension NotificationViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dummyList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: NotificationCell.reuseID, for: indexPath) as! NotificationCell
        cell.configure(dummyList[indexPath.row])
        return cell
    }
}

extension NotificationViewController: UITableViewDelegate {
    
}

// MARK: - Dummy

struct DummyNotification {
    let profileImage: UIImage? = UIImage(named: " ")
    let title: String
    let description: String = "해당 소분에 참여했습니다!"
    let thumbImage: UIImage? = UIImage(named: "salad")
}


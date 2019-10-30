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
    @IBOutlet weak var feedDetailTableView: UITableView!
    
    private let titleList = ["", "", "댓글"]
    private let dummyList = [DummyComment(name: "황희희", comment: "혹시 후문에서 쿨거래는 안될까요? ㅎㅎ"),
                        DummyComment(name: "명써니", comment: "당근 빠따 가능한 부분 ^_^"),
                        DummyComment(name: "흔지", comment: "옴마마! 대박 저 이거 진짜 좋아하는데 참여각!"),
                        DummyComment(name: "명써니", comment: "와 흔지님 진짜 배우신분! ")]
    private var cells: [ContentCellType] = [.image(FeedDetailImage(imageName: "image_0")),
             .title(FeedDetailTitle(title: "달콤한 갈비만두 나누실 분 구함!")),
             .description(FeedDetailDescription(description: "gg")),
             .info(FeedDetailInfo(remainingTime: "2", participant: "d", place: "dsa", previousPrice: "sad", currentPrice: "dsd"))]
    
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
        feedDetailTableView.register(imageCell, forCellReuseIdentifier: FeedDetailImageCell.reuseID)
        
        let titleCell = UINib(nibName: FeedDetailTitleCell.reuseID, bundle: nil)
        feedDetailTableView.register(titleCell, forCellReuseIdentifier: FeedDetailTitleCell.reuseID)
        
        let descriptionCell = UINib(nibName: FeedDetailDescriptionCell.reuseID, bundle: nil)
        feedDetailTableView.register(descriptionCell, forCellReuseIdentifier: FeedDetailDescriptionCell.reuseID)
        
        let infoCell = UINib(nibName: FeedDetailInfoCell.reuseID, bundle: nil)
        feedDetailTableView.register(infoCell, forCellReuseIdentifier: FeedDetailInfoCell.reuseID)
        
        let commentCell = UINib(nibName: CommentCell.reuseID, bundle: nil)
        feedDetailTableView.register(commentCell, forCellReuseIdentifier: CommentCell.reuseID)
        
        feedDetailTableView.delegate = self
        feedDetailTableView.dataSource = self
        
        feedDetailTableView.backgroundColor = kWHITE
        feedDetailTableView.rowHeight = UITableView.automaticDimension
        feedDetailTableView.estimatedRowHeight = 200.0
        feedDetailTableView.showsVerticalScrollIndicator = false
        feedDetailTableView.separatorStyle = .none
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
    
    enum FeedDetailSectionType: Int, CaseIterable {
        case content
        case comment
    }
    
    enum ContentCellType {
        case image(FeedDetailImage)
        case title(FeedDetailTitle)
        case description(FeedDetailDescription)
        case info(FeedDetailInfo)
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return FeedDetailSectionType.allCases.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == FeedDetailSectionType.content.rawValue {
            return cells.count
        }
        return dummyList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var dequeuedCell: UITableViewCell?
        if indexPath.section == FeedDetailSectionType.content.rawValue {
            let cellModel = cells[indexPath.row]
            switch cellModel {
            case .image(let image):
                let cell = tableView.dequeueReusableCell(withIdentifier: FeedDetailImageCell.reuseID, for: indexPath) as! FeedDetailImageCell
                cell.configure(image: image)
                dequeuedCell = cell
            case .title(let title):
                let cell = tableView.dequeueReusableCell(withIdentifier: FeedDetailTitleCell.reuseID, for: indexPath) as! FeedDetailTitleCell
                cell.configure(title: title)
                dequeuedCell = cell
            case .description(let description):
                let cell = tableView.dequeueReusableCell(withIdentifier: FeedDetailDescriptionCell.reuseID, for: indexPath) as! FeedDetailDescriptionCell
                // TODO: configure
                dequeuedCell = cell
            case .info(let info):
                let cell = tableView.dequeueReusableCell(withIdentifier: FeedDetailInfoCell.reuseID, for: indexPath) as! FeedDetailInfoCell
                // TODO: configure
                dequeuedCell = cell
            }
        } else {
            let cell = tableView.dequeueReusableCell(withIdentifier: CommentCell.reuseID, for: indexPath) as! CommentCell
            cell.entity(item: dummyList[indexPath.row])
            dequeuedCell = cell
        }
        
        return dequeuedCell ?? UITableViewCell()
    }
}

extension FeedDetailViewController: UITableViewDelegate {
    
}

struct DummyComment {
    let name: String
    let comment: String
    let date: String = "19/10/19 5:00"
}

// MARK: - FeedDetailItem Model

protocol FeedDetailItem { }

struct FeedDetailImage: FeedDetailItem {
    let imageName: String
}

struct FeedDetailTitle: FeedDetailItem {
    let title: String
}

struct FeedDetailDescription: FeedDetailItem {
    let description: String
}

struct FeedDetailInfo: FeedDetailItem {
    let remainingTime: String
    let participant: String
    let place: String
    let previousPrice: String
    let currentPrice: String
}

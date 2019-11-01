//
//  MyPageLikeViewController.swift
//  SoBoon
//
//  Created by CHOMINJI on 01/11/2019.
//  Copyright © 2019 cmindy. All rights reserved.
//

import UIKit

class MyPageLikeViewController: BaseViewController {
    
    // MARK: - Vars
    
    @IBOutlet weak var navigationView: GeneralNavigationView!
    @IBOutlet weak var likeCollectionView: UICollectionView!
    @IBOutlet weak var likeFlowLayout: UICollectionViewFlowLayout!
    
    private let dummyList: [DummyLike] = [
        DummyLike(name: "황히히", title: "아토소베드테이블 1+1 같이 사실 분 구합니다.", currentPrice: "소분가 19,800원 ", previousPrice: "39,600원 / 2명"),
        DummyLike(name: "명써니", title: "달콤한 갈비만누 나누실 분 구합니다.", currentPrice: "소분가 5,760원", previousPrice: "17,280원 / 3명"),
        DummyLike(name: "밍지", title: "시인과 농부 사과즙 30봉", currentPrice: "소분가 19,800원 ", previousPrice: "39,600원 / 2명"),
        DummyLike(name: "황히히", title: "아토소베드테이블 1+1 같이 사실 분 구합니다.", currentPrice: "소분가 19,800원 ", previousPrice: "39,600원 / 2명"),
        DummyLike(name: "명써니", title: "달콤한 갈비만누 나누실 분 구합니다.", currentPrice: "소분가 5,760원", previousPrice: "17,280원 / 3명"),
        DummyLike(name: "밍지", title: "시인과 농부 사과즙 30봉", currentPrice: "소분가 19,800원 ", previousPrice: "39,600원 / 2명")
    ]
    private let spacing: CGFloat = 20.0
    
    // MARK: - Life Cycle

    override func viewDidLoad() {
        super.viewDidLoad()

        initAttributes()
    }
}

// MARK: - Attributes

extension MyPageLikeViewController {
    private func initAttributes() {
        initVars()
        initBackgroundView()
        initNavigationView()
        initCollectionView()
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
        self.navigationView.title("찜한 소분")
        self.navigationView.divider(false)
        self.navigationView.naviButtonColor(color: kGRAY_700)
        self.navigationView.showBackButton()
        self.setInteractiveRecognizer()
    }
    
    private func initCollectionView() {
        let headerView = UINib(nibName: MyPageLikeHeaderView.reuseID, bundle: nil)
        likeCollectionView.register(headerView, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: MyPageLikeHeaderView.reuseID)
        
        let likeCell = UINib(nibName: MyPageLikeCell.reuseID, bundle: nil)
        likeCollectionView.register(likeCell, forCellWithReuseIdentifier: MyPageLikeCell.reuseID)
        
        likeCollectionView.dataSource = self
        likeCollectionView.delegate = self
        
        likeCollectionView.showsVerticalScrollIndicator = false
        likeFlowLayout.sectionInset = UIEdgeInsets(top: 0, left: spacing, bottom: 0, right: spacing)
        likeFlowLayout.estimatedItemSize = UICollectionViewFlowLayout.automaticSize
        likeFlowLayout.minimumInteritemSpacing = 15.0
    }
}

// MARK: - CollectionView

extension MyPageLikeViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return dummyList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MyPageLikeCell.reuseID, for: indexPath) as! MyPageLikeCell
        
        cell.configure(dummyList[indexPath.item])
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: MyPageLikeHeaderView.reuseID, for: indexPath) as! MyPageLikeHeaderView
        return header
    }
}

extension MyPageLikeViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        let indexPath = IndexPath(row: 0, section: section)
        let headerView = self.collectionView(collectionView, viewForSupplementaryElementOfKind: UICollectionView.elementKindSectionHeader, at: indexPath)
        return headerView.systemLayoutSizeFitting(CGSize(width: collectionView.frame.width,
                                                         height: UIView.layoutFittingExpandedSize.height))
    }
}

extension MyPageLikeViewController: UICollectionViewDelegateFlowLayout {
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
//        let numberOfItemsPerRow: CGFloat = 2
//        let spacingBetweenCells: CGFloat = 15.0
//        let totalSpacing = (2 * self.spacing) + ((numberOfItemsPerRow - 1) * spacingBetweenCells)
//
//        let width = (collectionView.bounds.width - totalSpacing) / numberOfItemsPerRow
//        return CGSize(width: width, height: width * 1.3)
//    }
}

struct DummyLike {
    let imageName: String = "salad"
    let name: String
    let title: String
    let currentPrice: String
    let previousPrice: String
}

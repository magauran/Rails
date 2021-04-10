//
//  TrainMapViewController.swift
//  Rails
//
//  Created by Alexey Salangin on 4/9/21.
//

import UIKit
import TinyConstraints

final class TrainMapViewController: UIViewController {
    private let collectionView: UICollectionView
    private let collectionViewFlowLayout: UICollectionViewFlowLayout

    private lazy var contextMenu: UIMenu = {
        var postActions: [UIMenuElement] = []

        let ident1 = UIAction.Identifier("upvote")
        let upvoteAction = UIAction(title: "Upvote", image: UIImage(systemName: "arrow.up"), identifier: ident1, handler: { _ in })
        postActions.append(upvoteAction)

        let ident2 = UIAction.Identifier("downvote")
        let downvoteAction = UIAction(title: "Downvote", image: UIImage(systemName: "arrow.down"), identifier: ident2, handler: { _ in })
        postActions.append(downvoteAction)

        let ident3 = UIAction.Identifier("save")
//        actionMappings[ident3] = save(action:)
        let saveAction = UIAction(title: "Save", image: UIImage(systemName: "bookmark"), identifier: ident3, handler: { _ in })
        postActions.append(saveAction)

        return UIMenu(title: "", image: nil, identifier: nil, options: [.displayInline], children: postActions)
    }()

    init() {
        let collectionViewFlowLayout = UICollectionViewFlowLayout()
        self.collectionViewFlowLayout = collectionViewFlowLayout
        self.collectionView = UICollectionView(frame: .zero, collectionViewLayout: collectionViewFlowLayout)
        super.init(nibName: nil, bundle: nil)
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        self.setup()
    }

    private func setup() {
        self.collectionView.dataSource = self
        self.collectionView.delegate = self
        self.collectionView.register(WagonCell.self)

        self.collectionView.backgroundColor = .white

        self.view.addSubview(self.collectionView)
        self.collectionView.edgesToSuperview()
    }
}

extension TrainMapViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        10
    }

    func collectionView(
        _ collectionView: UICollectionView,
        cellForItemAt indexPath: IndexPath
    ) -> UICollectionViewCell {
        let cell: WagonCell = collectionView.dequeueReusableCell(for: indexPath)
//        cell.actions.didTap = { [weak self, weak cell] point in
//            guard let self = self, let cell = cell else { return }
//            let pointInCollectionView = self.collectionView.convert(point, from: cell)
//            let pointInView = self.view.convert(pointInCollectionView, from: self.collectionView)
//            let chidoriMenu = ChidoriMenu(menu: self.contextMenu, summonPoint: pointInView)
//            self.present(chidoriMenu, animated: true, completion: nil)
//        }
        cell.gestureRecognizers?.forEach { cell.removeGestureRecognizer($0) }
        let longTapGestureRecognizer = UILongPressGestureRecognizer(target: self, action: #selector(self.onLongTap))
        longTapGestureRecognizer.minimumPressDuration = 0.5
        cell.addGestureRecognizer(longTapGestureRecognizer)

        // For test
        if indexPath.item == 0 {
            cell.userLocation = CGPoint(x: 210, y: 320)
        } else {
            cell.userLocation = nil
        }

        return cell
    }

    @objc
    private func onLongTap(recognizer: UILongPressGestureRecognizer) {
        guard recognizer.state == .began else { return }
        let point = recognizer.location(in: self.view)
        let chidoriMenu = ChidoriMenu(menu: self.contextMenu, summonPoint: point)
        self.present(chidoriMenu, animated: true, completion: nil)
    }
}

extension TrainMapViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(
        _ collectionView: UICollectionView,
        layout collectionViewLayout: UICollectionViewLayout,
        sizeForItemAt indexPath: IndexPath
    ) -> CGSize {
        let contentSideInsets = collectionView.contentInset.left - collectionView.contentInset.right
        let sectionInsets = self.collectionView(collectionView, layout: collectionViewLayout, insetForSectionAt: indexPath.section)
        let sectionSideInsets = sectionInsets.left + sectionInsets.right
        let width = self.collectionView.frame.width - contentSideInsets - sectionSideInsets
        return CGSize(
            width: width,
            height: width * 2.44
        )
    }

    func collectionView(
        _ collectionView: UICollectionView,
        layout collectionViewLayout: UICollectionViewLayout,
        insetForSectionAt section: Int
    ) -> UIEdgeInsets {
        UIEdgeInsets(top: 16, left: 32, bottom: 16, right: 32)
    }
}

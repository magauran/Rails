//
//  TrainMapViewController.swift
//  Rails
//
//  Created by Alexey Salangin on 4/9/21.
//

import UIKit
import TinyConstraints

protocol TrainPart {}
struct Wagon: TrainPart {}
struct Vestibule: TrainPart {}
struct Toilet: TrainPart {}

final class TrainMapViewController: UIViewController {
    private let collectionView: UICollectionView
    private let collectionViewFlowLayout: UICollectionViewFlowLayout
    private let trainParts: [TrainPart] = {
        var array: [TrainPart] = [Toilet()]
        array += [TrainPart](repeatingValues: [Wagon(), Vestibule()], count: 7)
        array.append(Wagon())
        return array
    }()

    private lazy var contextMenu: UIMenu = {
        var postActions: [UIMenuElement] = []

        let ident1 = UIAction.Identifier("report")
        let upvoteAction = UIAction(title: "Report the incident", image: nil, identifier: ident1, handler: { _ in })
        postActions.append(upvoteAction)

        let ident2 = UIAction.Identifier("downvote")
        let downvoteAction = UIAction(title: "Need help", image: nil, identifier: ident2, handler: { _ in })
        postActions.append(downvoteAction)

        let ident3 = UIAction.Identifier("save")
        let saveAction = UIAction(title: "Lost things", image: nil, identifier: ident3, handler: { _ in })
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
        self.title = "My train"

        self.collectionView.dataSource = self
        self.collectionView.delegate = self

        self.collectionView.register(WagonCell.self)
        self.collectionView.register(VestibuleCell.self)
        self.collectionView.register(ToiletCell.self)

        self.collectionView.backgroundColor = .white

        self.view.addSubview(self.collectionView)
        self.collectionView.edgesToSuperview()
        self.collectionView.contentInset = UIEdgeInsets(top: 32, left: 0, bottom: 100 + 16, right: 0)

        let ticketView = TicketView()
        ticketView.needsHideTimePeriod = true
        self.view.addSubview(ticketView)
        ticketView.edgesToSuperview(excluding: .top, insets: .init(top: .nan, left: 27, bottom: 27, right: 27), usingSafeArea: true)
    }
}

extension TrainMapViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        self.trainParts.count
    }

    func collectionView(
        _ collectionView: UICollectionView,
        cellForItemAt indexPath: IndexPath
    ) -> UICollectionViewCell {
        let trainPart = self.trainParts[indexPath.item]

        switch trainPart {
            case is Wagon:
                let cell: WagonCell = collectionView.dequeueReusableCell(for: indexPath)

                // TODO: Move to collection view
                cell.gestureRecognizers?.forEach { cell.removeGestureRecognizer($0) }
                let longTapGestureRecognizer = UILongPressGestureRecognizer(target: self, action: #selector(self.onLongTap))
                longTapGestureRecognizer.minimumPressDuration = 0.5
                cell.addGestureRecognizer(longTapGestureRecognizer)

                // For test
                if indexPath.item == 1 {
                    cell.userLocation = CGPoint(x: 190, y: 250)
                } else {
                    cell.userLocation = nil
                }

                return cell
            case is Vestibule:
                let cell: VestibuleCell = collectionView.dequeueReusableCell(for: indexPath)
                return cell
            case is Toilet:
                let cell: ToiletCell = collectionView.dequeueReusableCell(for: indexPath)
                return cell
            default:
                fatalError("Sorry.")
        }
    }

    @objc
    private func onLongTap(recognizer: UILongPressGestureRecognizer) {
        guard recognizer.state == .began else { return }
        let point = recognizer.location(in: self.view)
        guard let adjustedPoint = self.navigationController?.view.convert(point, from: self.view) else { return }

        let chidoriMenu = ChidoriMenu(menu: self.contextMenu, summonPoint: adjustedPoint)
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

        let trainPart = self.trainParts[indexPath.item]

        switch trainPart {
            case is Wagon:
                return CGSize(
                    width: width,
                    height: (width - 100) * 3.645
                )
            case is Vestibule:
                return CGSize(
                    width: width,
                    height: width * 0.41
                )
            case is Toilet:
                return CGSize(
                    width: width,
                    height: (width - 32) * 0.144
                )
            default:
                assertionFailure()
                return .zero
        }
    }

    func collectionView(
        _ collectionView: UICollectionView,
        layout collectionViewLayout: UICollectionViewLayout,
        insetForSectionAt section: Int
    ) -> UIEdgeInsets {
        UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
    }
}

extension Array {
    fileprivate init (repeatingValues arr: Array, count: Int) {
        precondition(!arr.isEmpty, "Initialization values cannot be empty")
        precondition(count > 0, "Count cannot be less than 1")
        var newArr = Array<Element>()
        for i in 0..<count {
            newArr.append(arr[i % arr.count])
        }
        self = newArr
    }
}

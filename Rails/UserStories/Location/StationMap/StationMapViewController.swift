//
//  StationMapViewController.swift
//  Rails
//
//  Created by Alexey Salangin on 4/10/21.
//

import UIKit
import MapKit

final class StationMapViewController: UIViewController {

    private lazy var mapView: MKMapView = {
        let map = MKMapView(frame: self.view.frame)
//            map.delegate = self
        map.isZoomEnabled = true
        map.isPitchEnabled = true
        map.translatesAutoresizingMaskIntoConstraints = false
        return map
    }()
    
//    private let headerView: MapHeaderView = {
//        let header = MapHeaderView(frame: CGRect.zero,
//                                   title: "Some train #---- with acquisition 34B",
//                                   description: "here comes some description along the way")
//        /*add customization here*/
//        header.translatesAutoresizingMaskIntoConstraints = false
//
//        return header
//    }()
    
//    public lazy var stackView: UIStackView = {
//        let stack = UIStackView(arrangedSubviews: [self.headerView, self.mapView])
//        stack.alignment = .fill
//        stack.axis = .vertical
//        stack.distribution = .fill
//        stack.spacing = 0
//        return stack
//    }()
    
    // эту хрень надо серьезно переделать, на тяп-ляп делал, уж сорян
    private let suggestionsViews: [UIView] = {
        var views = [UIView]()
        let titles: [String] = ["Report Incident", "Need help", "Lost things"]
        
        titles.forEach {
            let view = UIView(frame: CGRect.zero)
            view.backgroundColor = Palette.viewBGColor.color
            
            view.clipsToBounds = false
            view.layer.cornerRadius = 10
            view.layer.shadowColor = UIColor(rgb: 0x606470).withAlphaComponent(0.1).cgColor
            view.layer.shadowOffset = CGSize(width: 0, height: 5)
            
            let titleLabel = UILabel(frame: CGRect.zero)
            titleLabel.style = StringStyle {
                $0.font = Font.medium(12)
                $0.color = Palette.Text.primary
            }
            titleLabel.text = $0
            titleLabel.translatesAutoresizingMaskIntoConstraints = false
            
            view.addSubview(titleLabel)
            
            NSLayoutConstraint.activate([
                view.heightAnchor.constraint(equalToConstant: 20),
                view.widthAnchor.constraint(equalToConstant: 150),
                
                titleLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 3),
                titleLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 3),
                titleLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -3),
                titleLabel.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -3),
                
            ])
            
            view.alpha = 0
            views.append(view)
        }
        return views
    }()
    
    
    
    private lazy var searchView: SearchFloatingView = {
        let field = SearchFloatingView(frame: CGRect.zero, placeholder: "Where are you going?")
        field.translatesAutoresizingMaskIntoConstraints = false
        field.textField.delegate = self
        return field
    }()
    
    private let collectionView: StationSpotsCollectionView = {
        let cv = StationSpotsCollectionView(frame: CGRect.zero, collectionViewLayout: UICollectionViewLayout())
        cv.translatesAutoresizingMaskIntoConstraints = false
        // shitcooodeee
    
        
        return cv
    }()
    
    private let bellButton: UIButton = {
        let btn = UIButton(frame: CGRect.zero)
        btn.setImage(UIImage(named: "red_bell"), for: UIControl.State.normal)
        btn.addTarget(self, action: #selector(handleBellPressed), for: UIControl.Event.touchUpInside)
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.imageRect(forContentRect: btn.frame)
        btn.clipsToBounds = false
        btn.layer.cornerRadius = 10
        btn.layer.shadowColor = Palette.shadowColor.cgColor
        btn.layer.shadowOffset = CGSize(width: 0, height: 5)
        btn.contentMode = .scaleAspectFit
        return btn
    }()
    
    private var data: [Spot] = [
        Spot(title: "Blue Bird Coffee", distance: "10 m away", image: "room-1"),
        Spot(title: "Casa Blanca", distance: "10 m away", image: "room-2"),
        Spot(title: "Pizza Royal", distance: "12 m away", image: "room-3"),
        Spot(title: "Vegan factory", distance: "14 m away", image: "room-4"),
    ]
    
    private var showsSuggestions: Bool = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupViews()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        (self.navigationController as? NavigationViewController)?.setNavbarTransculent()
    }
    
    private func setupViews() {
        self.view.addSubview(self.mapView)
        
        NSLayoutConstraint.activate([
            self.mapView.topAnchor.constraint(equalTo: self.view.topAnchor),
            self.mapView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
            self.mapView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor),
            self.mapView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor),
        ])
        
        self.view.addSubview(self.searchView)
        
        NSLayoutConstraint.activate([
            self.searchView.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor),
            self.searchView.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor, constant: 20),
            self.searchView.trailingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.trailingAnchor, constant: -20),
            
            self.searchView.heightAnchor.constraint(equalToConstant: 50)
        ])
        
        self.view.addSubview(self.collectionView)
        
        NSLayoutConstraint.activate([
            self.collectionView.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor, constant: -10),
            
            self.collectionView.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor),
            self.collectionView.trailingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.trailingAnchor),
            
            self.collectionView.heightAnchor.constraint(equalToConstant: 100)
        ])
        
        self.view.addSubview(bellButton)
        
        NSLayoutConstraint.activate([
            self.bellButton.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: 0),
            self.bellButton.bottomAnchor.constraint(equalTo: self.collectionView.topAnchor, constant: 0),
            
            self.bellButton.heightAnchor.constraint(equalToConstant: 80),
            self.bellButton.widthAnchor.constraint(equalToConstant: 80),
        ])
        
//        let stackView = UIStackView(arrangedSubviews: self.suggestionsViews)
//        stackView.distribution = .fill
//        stackView.spacing = 3
//        stackView.alignment = .fill
//        stackView.axis = .vertical
//
//        self.view.addSubview(stackView)
//
//        NSLayoutConstraint.activate([
//            stackView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -10),
//            stackView.bottomAnchor.constraint(equalTo: self.bellButton.topAnchor, constant: 0),
//        ])
        
        self.collectionView.data = self.data
        self.collectionView.viewController = self
        self.collectionView.reloadData()
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        self.view.endEditing(true)
    }
    
    @objc private func handleBellPressed(_ sender: UIButton) {
        self.showsSuggestions.toggle()
        let imageName = self.showsSuggestions ? "brown_bell" : "red_bell"
        sender.setImage(UIImage(named: imageName), for: UIControl.State.normal)
        self.suggestionsViews.forEach { subview in
            UIView.animate(withDuration: 0.2) {
                subview.alpha = self.showsSuggestions ? 1 : 0
            }
        }
    }
}

extension StationMapViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if let text = textField.text, text.count > 0 {
            textField.resignFirstResponder()
            let viewController = SearchViewController()
            viewController.searchText = text
            self.navigationController?.pushViewController(viewController, animated: true)
        }
        return true
    }
}

extension StationMapViewController: SpotCVCDelegate {
    
    func didCloseButtonPress() {}
    func didSelectMainViewPressed(_ cell: SpotCollectionViewCell) {
        if let info = cell.data {
            let viewController = SpotDetailsViewController()
            viewController.spot = info
            self.presentPanModal(viewController)
        }
    }
}

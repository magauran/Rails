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
        return map
    }()
    
    private let headerView: MapHeaderView = {
        let header = MapHeaderView(frame: CGRect.zero,
                                   title: "Some train #---- with acquisition 34B",
                                   description: "here comes some description along the way")
        /*add customization here*/
        header.translatesAutoresizingMaskIntoConstraints = false
        
        return header
    }()
    
    public lazy var stackView: UIStackView = {
        let stack = UIStackView(arrangedSubviews: [self.headerView, self.mapView])
        stack.alignment = .fill
        stack.axis = .vertical
        stack.distribution = .fill
        stack.spacing = 0
        return stack
    }()
    
    override func loadView() {
        super.loadView()
        
        self.stackView.frame = self.view.frame
        self.view = self.stackView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

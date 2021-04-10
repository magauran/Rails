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
    
    override func loadView() {
        super.loadView()
        self.view = self.mapView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    private func setupViews() {
        
    }

}

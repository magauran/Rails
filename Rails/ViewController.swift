//
//  ViewController.swift
//  Rails
//
//  Created by Alexey Salangin on 4/9/21.
//

import UIKit
import Macaw

final class WagonView: MacawView {
    init() {
        super.init(frame: .zero)
        self.node = try! SVGParser.parse(resource: "wagon")
        self.contentMode = .scaleAspectFit
    }

    @available(*, unavailable)
    required convenience init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

final class ViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()

        self.view.backgroundColor = .systemBackground

        let wagon = WagonView()
        self.view.addSubview(wagon)

        wagon.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            wagon.topAnchor.constraint(equalTo: self.view.topAnchor),
            wagon.leftAnchor.constraint(equalTo: self.view.leftAnchor),
            wagon.rightAnchor.constraint(equalTo: self.view.rightAnchor),
            wagon.bottomAnchor.constraint(equalTo: self.view.bottomAnchor),
        ])

        wagon.node.nodeBy(tag: "tag1")?.onTouchPressed({ event in
            let shape = event.node as! Shape
            shape.fill = Color.yellow
        })

        wagon.node.nodeBy(tag: "tag1")?.onTouchReleased({ event in
            let shape = event.node as! Shape
            shape.fill = Color.gray
            print("tap node with tag1")
        })

        wagon.node.onLongTap { event in

        }
    }
}

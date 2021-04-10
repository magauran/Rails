//
//  VestibuleView.swift
//  Rails
//
//  Created by Alexey Salangin on 4/10/21.
//

import Macaw

final class VestibuleView: MacawView {
    init() {
        super.init(frame: .zero)
        self.node = try! SVGParser.parse(resource: "vestibule")
        self.contentMode = .scaleAspectFit
    }

    @available(*, unavailable)
    required convenience init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

//
//  WagonView.swift
//  Rails
//
//  Created by Alexey Salangin on 4/9/21.
//

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

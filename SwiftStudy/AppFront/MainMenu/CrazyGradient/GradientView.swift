//
//  PayWallViewController.swift
//  SwiftStudy
//
//  Created by Josicleison Elves on 29/12/22.
//

import SwiftUI

struct GradientView: View {
    static var asHostingController: UIHostingController<some View> {
        return UIHostingController(rootView: self.init())
    }
    static var asUIView: UIView {
        return UIHostingController(rootView: self.init()).view
    }
    var body: some View {
        LinearGradient(gradient: Gradient(colors: [.red, .blue]),
                       startPoint: .topTrailing,
                       endPoint: .bottomTrailing)
    }
}

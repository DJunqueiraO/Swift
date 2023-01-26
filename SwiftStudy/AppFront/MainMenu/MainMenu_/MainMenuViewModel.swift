//
//  MainMenuViewModel.swift
//  SwiftStudy
//
//  Created by Josicleison Elves on 26/12/22.
//

import UIKit

struct MainMenuViewModel {
    private let viewControllers = [AccessViewController(),
                                   DataSourceViewController(),
                                   ArrayViewController(),
                                   DigimonsViewController(),
                                   JokenpoViewController(),
                                   SpinnerViewController(),
                                   CallViewController(),
                                   RxSwiftViewController(),
                                   LoginViewController(),
                                   FullCourseViewController(),
                                   ReduceViewController(),
                                   CrazyGradientViewController(),
                                   AnimationViewController(),
                                   GradientView.asHostingController,
//                                   UserRouter.start().entry as Any,
                                   FakeBookViewController()]
    var numberOfViewControllers: Int {viewControllers.count}
    func viewController<T: UIViewController>(_ index: Int) -> T? {
        guard let viewController = viewControllers[index] as? T else {return nil}
        return viewController
    }
    func setup(_ cell: UITableViewCell, cellForRowAt indexPath: IndexPath) {
//        guard let viewController = viewControllers[indexPath.row] as? UIViewController else {return cell}
        let label: UILabel = {
            let label = Create.element.label("\(type(of: viewControllers[indexPath.row]))")
            label.textColor = .black
            label.backgroundColor = .yellow
            label.textAlignment = .center
            return label
        }()
        cell.contentView.addSubview(label)
        label.enableAutoLayout
            .constraint(attributes: [.top, .leading, .trailing, .bottom])
    }
}

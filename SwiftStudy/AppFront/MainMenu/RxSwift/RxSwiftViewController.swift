//
//  RxSwiftViewController.swift
//  SwiftStudy
//
//  Created by Josicleison Elves on 16/01/23.
//

import UIKit
import RxRelay
import RxSwift
import RxCocoa

final class RxSwiftViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }
    func testSubjects() {
        let publicSubject = PublishSubject<String>()
        publicSubject.onNext("Lero Lero")
        let _ = publicSubject.subscribe {element in
            print(element)
        }
        publicSubject.onNext("Lero Lero Lero")
        let behaviorSubject = BehaviorSubject<String>(value: "Lero Lero Lero Lero")
        let _ = behaviorSubject.subscribe {element in
            print(element)
        }
        let relaySubject = ReplaySubject<Int>.create(bufferSize: 3)
        relaySubject.onNext(1)
        relaySubject.onNext(2)
        relaySubject.onNext(3)
        let _ = relaySubject.subscribe {element in
            print(element)
        }
        let asyncSubject = AsyncSubject<String>()
        asyncSubject.onNext("Lero LeroLeroleror")
        asyncSubject.onNext("Lero LeroasdasdqLeroleror")
        asyncSubject.onCompleted()
        let _ = asyncSubject.subscribe {element in
            print(element)
        }
    }
}

extension RxSwiftViewController: Setup {
    func configure() {
        view.backgroundColor = .white
//        testSubjects()
        let publishRelay = PublishRelay<String>()
        publishRelay.accept("Lero Lero")
        let _ = publishRelay.subscribe {element in
            print(element)
        }
        publishRelay.accept("Lero asdqwLero")
        let behaviorRelay = BehaviorRelay<String>(value: "behaviorRelayLero Lero")
        let _ = behaviorRelay.subscribe {element in
            print(element)
        }
        behaviorRelay.accept("asdanjisdqjiwraponga")
    }
}

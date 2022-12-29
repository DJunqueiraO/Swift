//
//  CallManager.swift
//  SwiftStudy
//
//  Created by Josicleison Elves on 29/12/22.
//

import CallKit

final class CallManager: NSObject {
    let provider = CXProvider(configuration: CXProviderConfiguration())
    let callController = CXCallController()
    override init() {
        super.init()
        provider.setDelegate(self, queue: nil)
    }
    func reportIncommingCall(id: UUID, handleValue: String) async {
        let update = CXCallUpdate()
        update.remoteHandle = CXHandle(type: .generic, value: handleValue)
        do {
            try await provider.reportNewIncomingCall(with: id, update: update)
        } catch {
            print("ERROR:", error)
        }
    }
    func startCall(id: UUID, handleValue: String) async {
        let handle = CXHandle(type: .generic, value: handleValue)
        let action = CXStartCallAction(call: id, handle: handle)
        let transation = CXTransaction(action: action)
        do {
            try await callController.request(transation)
        } catch {
            print("ERROR:", error)
        }
    }
}

extension CallManager: CXProviderDelegate {
    func providerDidReset(_ provider: CXProvider) {}
}

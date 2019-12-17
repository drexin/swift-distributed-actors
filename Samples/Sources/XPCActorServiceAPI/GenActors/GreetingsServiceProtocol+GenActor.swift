// ==== ------------------------------------------------------------------ ====
// === DO NOT EDIT: Generated by GenActors                     
// ==== ------------------------------------------------------------------ ====

//===----------------------------------------------------------------------===//
//
// This source file is part of the Swift Distributed Actors open source project
//
// Copyright (c) 2019 Apple Inc. and the Swift Distributed Actors project authors
// Licensed under Apache License v2.0
//
// See LICENSE.txt for license information
// See CONTRIBUTORS.md for the list of Swift Distributed Actors project authors
//
// SPDX-License-Identifier: Apache-2.0
//
//===----------------------------------------------------------------------===//

import DistributedActors
import XPCActorable

// ==== ----------------------------------------------------------------------------------------------------------------
// MARK: DO NOT EDIT: Generated GreetingsServiceProtocol messages 

extension GeneratedActor.Messages {
    public enum GreetingsServiceProtocol { 
        case logGreeting(name: String) 
        case greet(name: String, _replyTo: ActorRef<Result<String, Error>>) 
        case fatalCrash  
    }
}
// ==== ----------------------------------------------------------------------------------------------------------------
// MARK: DO NOT EDIT: Boxing GreetingsServiceProtocol for any inheriting actorable `A` 

extension Actor where A: GreetingsServiceProtocol {

    public func logGreeting(name: String) {
        self.ref.tell(A._boxGreetingsServiceProtocol(.logGreeting(name: name)))
    }
 

    public func greet(name: String) -> Reply<String> {
        // TODO: FIXME perhaps timeout should be taken from context
        Reply(nioFuture:
            self.ref.ask(for: Result<String, Error>.self, timeout: .effectivelyInfinite) { _replyTo in
                A._boxGreetingsServiceProtocol(.greet(name: name, _replyTo: _replyTo))
            }.nioFuture.flatMapThrowing { result in
                switch result {
                case .success(let res): return res
                case .failure(let err): throw err
                }
            }
        )
    }
 

    public func fatalCrash() {
        self.ref.tell(A._boxGreetingsServiceProtocol(.fatalCrash))
    }
 

}

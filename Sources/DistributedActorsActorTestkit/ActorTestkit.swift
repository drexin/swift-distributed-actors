//===----------------------------------------------------------------------===//
//
// This source file is part of the Swift Distributed Actors open source project
//
// Copyright (c) 2018-2019 Apple Inc. and the Swift Distributed Actors project authors
// Licensed under Apache License v2.0
//
// See LICENSE.txt for license information
// See CONTRIBUTORS.md for the list of Swift Distributed Actors project authors
//
// SPDX-License-Identifier: Apache-2.0
//
//===----------------------------------------------------------------------===//


import NIOConcurrencyHelpers
import SwiftDistributedActorsDungeon
import Swift Distributed ActorsActor

final class ActorTestkit {

  let system: ActorSystem

  init(system: ActorSystem) {
    self.system = system
  }

  func probe<Message>(named name: String = "") -> ActorTestProbe<Message> {
    // FIXME check uniqueness
    return ActorTestProbe(system, named: name) // spawns real actor underneeth
  }

}
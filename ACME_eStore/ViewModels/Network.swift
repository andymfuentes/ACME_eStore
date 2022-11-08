//
//  Network.swift
//  Acme-eStore
//
//  Created by Andy Fuentes on 2022-11-05.
//

import Foundation
import Network

//  Use Network framework and implement NWPathMonitor.
class Network: ObservableObject {
  let monitor = NWPathMonitor()
  let queue = DispatchQueue(label: "Monitor")

  @Published private(set) var connected: Bool = false
  
  @MainActor  // ensures the property connected can be updated only on main thread
  func startNetworkMonitor(){
    monitor.pathUpdateHandler = { path in
      if path.status == .satisfied {
        self.connected = true
      } else {
        self.connected = false
      }
    }
    monitor.start(queue: queue)
  }
}

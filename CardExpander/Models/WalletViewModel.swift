//
//  WalletViewModel.swift
//  CardExpander
//
//  Created by Wayne Dahlberg on 9/23/24.
//

import SwiftUI

class WalletViewModel: ObservableObject {
  @Published var wallets: [Wallet]
  @Published var expandedWalletId: String?
  
  init() {
    self.wallets = [
      Wallet(id: "1", name: "Wayne", balance: "0.8", color: Color(hex: "fb4f14"), icon: "sparkles"),
      Wallet(id: "2", name: "Savings", balance: ".75", color: Color(hex: "104a65"), icon: "building.columns"),
      Wallet(id: "3", name: "Rainy Day", balance: "0.04", color: Color(hex: "a5a88f"), icon: "cloud"),
      Wallet(id: "4", name: "Spending", balance: "0.01", color: Color(hex: "8fcdc7"), icon: "banknote")
    ]
  }
  
  func toggleExpanded(for id: String) {
    withAnimation(.spring(response: 0.4, dampingFraction: 0.8)) {
      expandedWalletId = expandedWalletId == id ? nil : id
    }
  }
}


//
//  FamilyWalletView.swift
//  CardExpander
//
//  Created by Wayne Dahlberg on 9/23/24.
//

import SwiftUI

struct FamilyWalletView: View {
  @StateObject private var viewModel = WalletViewModel()
  @Namespace private var animation
  
  var body: some View {
    VStack {
      ZStack {
        GeometryReader { geo in
          VStack {
            if let expandedId = viewModel.expandedWalletId {
              expandedLayout(for: expandedId, in: geo)
            } else {
              defaultLayout(in: geo)
            }
          }
          .frame(maxWidth: .infinity, maxHeight: .infinity)
        }
        .padding()
      }
      .frame(width: .infinity, height:280)
      Spacer()
    }
  }
  
  private func defaultLayout(in geo: GeometryProxy) -> some View {
    VStack(spacing: 16) {
      HStack(spacing: 16) {
        ForEach(viewModel.wallets[0...1]) { wallet in
          WalletCardView(wallet: wallet, isExpanded: false)
            .matchedGeometryEffect(id: wallet.id, in: animation)
            .frame(width: (geo.size.width - 48) / 2, height: 120)
            .onTapGesture {
              viewModel.toggleExpanded(for: wallet.id)
            }
        }
      }
      HStack(spacing: 16) {
        ForEach(viewModel.wallets[2...3]) { wallet in
          WalletCardView(wallet: wallet, isExpanded: false)
            .matchedGeometryEffect(id: wallet.id, in: animation)
            .frame(width: (geo.size.width - 48) / 2, height: 120)
            .onTapGesture {
              viewModel.toggleExpanded(for: wallet.id)
            }
        }
      }
    }
  }
  
  private func expandedLayout(for id: String, in geometry: GeometryProxy) -> some View {
    VStack(spacing: 16) {
      if let expandedWallet = viewModel.wallets.first(where: { $0.id == id }) {
        WalletCardView(wallet: expandedWallet, isExpanded: true)
          .matchedGeometryEffect(id: expandedWallet.id, in: animation)
          .frame(width: geometry.size.width - 32, height: 200)
          .onTapGesture {
            viewModel.toggleExpanded(for: expandedWallet.id)
          }
      }
      
      HStack(spacing: 8) {
        ForEach(viewModel.wallets.filter { $0.id != id }) { wallet in
          WalletCardView(wallet: wallet, isExpanded: false)
            .matchedGeometryEffect(id: wallet.id, in: animation)
            .frame(width: (geometry.size.width - 56) / 3, height: 96)
            .onTapGesture {
              viewModel.toggleExpanded(for: wallet.id)
            }
        }
      }
    }
  }
}

#Preview {
  FamilyWalletView()
}

//
//  WalletCardView.swift
//  CardExpander
//
//  Created by Wayne Dahlberg on 9/23/24.
//

import SwiftUI

struct WalletCardView: View {
  
  let wallet: Wallet
  let isExpanded: Bool
  
  var body: some View {
      ZStack {
        RoundedRectangle(cornerRadius: isExpanded ? 24 : 20, style: .continuous)
          .fill(wallet.color)
        
        VStack {
          HStack {
            Image(systemName: wallet.icon)
              .font(.system(size: isExpanded ? 28 : 20))
              .foregroundStyle(.white)
            Spacer()
            
            if isExpanded {
              Button(action: {
                // copy address action
              }) {
                HStack {
                  Text("Copy Address")
                  Image(systemName: "doc.on.doc")
                }
                .font(.caption)
                .foregroundStyle(.white.opacity(0.8))
              }
            } else {
              Image(systemName: "ellipsis")
                .font(.system(size: 16))
                .foregroundStyle(.white.opacity(0.8))
            }
          }
          
          Spacer()
          
          HStack {
            VStack(alignment: .leading) {
              VStack(alignment: .leading, spacing: 0) {
                if isExpanded {
                  Text("BTC")
                    .font(.caption)
                    .fontWeight(.semibold)
                    .foregroundStyle(wallet.color)
                    .padding(1)
                    .padding(.horizontal, 3)
                    .background(Material.thinMaterial)
                    .clipShape(RoundedRectangle(cornerRadius: 4, style: .continuous))
                } else {
                  EmptyView()
                }
                Text("\(wallet.balance)" + (isExpanded ? "" : " BTC"))
                  .font(.system(size: isExpanded ? 64 : 16 ))
                  .foregroundStyle(.white.opacity(0.5))
              }
              .frame(width: .infinity)
              Text(wallet.name)
                .font(.subheadline)
                .fontWeight(.semibold)
                .foregroundStyle(.white)
            }
            
            Spacer()
            
            if isExpanded {
              Button("Customize") {
                // Customize action
              }
              .font(.caption)
              .padding(.horizontal, 12)
              .padding(.vertical, 6)
              .background(Color.white.opacity(0.2))
              .clipShape(Capsule())
              .foregroundStyle(.white)
            }
          }
        }
        .padding()
      }
  }
}

#Preview {
  WalletCardView(wallet: Wallet.init(id: "5", name: "Checking", balance: "24 ETH", color: Color(hex: "#007AFF"), icon: "poweroutlet.type.house"), isExpanded: true)
}

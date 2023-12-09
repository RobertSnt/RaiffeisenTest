//
//  UserRow.swift
//  RaiffesisenProject
//
//  Created by Robert Saniuta on 09.12.2023.
//

import SwiftUI

struct UserRow: View {
    var user: UserModel
    let documentDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first
    
    var body: some View {
        HStack {
            if let uiImage = UIImage(contentsOfFile: documentDirectory!.appendingPathComponent("\(user.firstName)_image.jpg.txt").path) {
                Image(uiImage: uiImage)
                    .resizable()
                    .frame(width: 50, height: 50)
                    .clipShape(Circle())
            } else {
                Image(systemName: "person.circle")
                    .resizable()
                    .frame(width: 50, height: 50)
                    .clipShape(Circle())
            }
            
            VStack(alignment: .leading) {
                Text(user.firstName + " " + user.secondName)
                    .font(.headline)
                
                Spacer()
                
                Text(user.email)
                    .font(.subheadline)
            }
            .padding(.leading,5)
            .padding(.vertical,5)
            
            Spacer()
            
            VStack(alignment: .trailing) {
                Text("12:30")
                    .font(.caption)
                    .foregroundColor(.gray)
                
                Spacer()
                
                if user.isFavorite {
                    Image(systemName: "star.fill")
                        .foregroundColor(.yellow)
                } else {
                    Image(systemName: "star")
                        .foregroundColor(.yellow)
                }
            }
            .padding(.vertical,5)
            .padding(.trailing,5)
        }.frame(height: 50)
    }
}

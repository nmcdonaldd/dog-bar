//
//  PopoverView.swift
//  dog-bar
//
//  Created by Nicholas McDonald on 11/4/21.
//

import SwiftUI

struct PopoverView: View {
    @StateObject var viewModel = PopoverViewModel()
    
    var body: some View {
        AsyncImage(
            url: viewModel.photoLocation,
            content: { image in
                return image
            },
            placeholder: {
                ProgressView()
                    .frame(width: 150, height: 150)
            })
            .task { await viewModel.fetchPhotoLocation() }
    }
}

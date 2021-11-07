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
        if viewModel.photoLocation == nil {
            ProgressView()
                .task { await viewModel.fetchPhotoLocation() }
        } else {
            AsyncImage(url: viewModel.photoLocation)

        }
    }
}

struct PopoverView_Previews: PreviewProvider {
    static var previews: some View {
        PopoverView()
    }
}

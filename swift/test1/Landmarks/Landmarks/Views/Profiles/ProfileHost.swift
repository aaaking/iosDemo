//
//  ProfileHost.swift
//  Landmarks
//
//  Created by aaaking on 2024/12/5.
//

import SwiftUI

struct ProfileHost: View {
    @Environment(\.editMode) var editMode
    @State private var modelData = ModelData.sharedInstance()
    @State private var draftProfile = Profile.default

    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            HStack {
                if editMode?.wrappedValue == .active {
                    Button("Cancel"/*, role: .cancel*/) {
                        print("testdraft cancel")
                        draftProfile = modelData.profile
                        editMode?.animation().wrappedValue = .inactive
                    }
                }
                Spacer()
                EditButton()
            }
            if editMode?.wrappedValue == .inactive {
                ProfileSummary(profile: modelData.profile)
            } else {
                ProfileEditor(profile: $draftProfile)
                    .onAppear {
                        print("testdraft appear")
                        draftProfile = modelData.profile
                    }
                    .onDisappear {
                        print("testdraft disappear")
                        modelData.profile = draftProfile
                    }
            }
        }
        .padding()
    }
}


#Preview {
    ProfileHost()
}


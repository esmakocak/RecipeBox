//
//  SettingsView.swift
//  RecipeSaver
//
//  Created by Esma Koçak on 20.07.2024.
//

import SwiftUI

struct SettingsView: View {
    @State var toggleIsOn: Bool = false
    
    var body: some View {
        NavigationView {
            VStack {
                Toggle(
                    isOn: $toggleIsOn,
                    label: {
                        HStack {
                            Image(systemName: toggleIsOn ? "bell" : "bell.slash")
                                .font(.title3)
                                .bold()
                                .foregroundColor(Color("AccentColor"))
                            Text("Allow Notifications")
                                .font(.headline)
                                .foregroundColor(.black)
                        }
                    }
                    
                )
                .padding()
                .toggleStyle(SwitchToggleStyle(tint: Color("AccentColor")))
                .onChange(of: toggleIsOn) { value in
                    if value {
                        NotificationManager.instance.requestAuthorization()
                    }
                }
                .navigationTitle("Settings")
                
                Button("Schedule notification") {
                    NotificationManager.instance.scheduleNotification()
                }
                
                Spacer()
            }
            .onAppear {
                UIApplication.shared.applicationIconBadgeNumber = 0
            }
            
            
        }
        .navigationViewStyle(.stack)
    }
}

#Preview {
    SettingsView()
}

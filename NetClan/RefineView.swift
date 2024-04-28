//
//  RefineView.swift
//  NetClan
//
//  Created by Satvik Viriyala on 18/04/24.
//

import Foundation
import SwiftUI

struct RefineView: View {
    @State private var selectedAvailability = "Available | Hey Lets Connect"
    @State private var statusText = "Hi community! I am open to new connections 😊"
    @State private var distanceValue: Double = 50 // Default distance
    @State private var selectedPurposes: [String] = []

    var body: some View {
        ScrollView {
            VStack {
                Text("Refine")
                    .font(.title)
                    .bold()
                    .padding()
                
                // Availability Picker
                Picker("Select Your Availability", selection: $selectedAvailability) {
                                Text("Available | Hey Lets Connect").tag("Available | Hey Lets Connect")
                                Text("Away | Stay Discreet And Watch").tag("Away | Stay Discreet And Watch")
                                Text("Busy | Do Not Disturb | Will Catch Up Later").tag("Busy | Do Not Disturb | Will Catch Up Later")
                                Text("SOS | Emergency! Need Assistance! HELP").tag("SOS | Emergency! Need Assistance! HELP")
                                // Add more options as needed
                            }
                            .pickerStyle(MenuPickerStyle())
                            .padding(.horizontal)

                Spacer(minLength: 20)
                // Status Text Editor
                TextEditor(text: $statusText)
                    .border(Color.gray, width: 1)
                    .frame(height: 100)
                    .padding(.horizontal)
                Text("\(statusText.count)/250")
                    .font(.caption)
                    .foregroundColor(.gray)
                    .frame(maxWidth: .infinity, alignment: .trailing)
                    .padding(.horizontal)
                Spacer(minLength: 10)
                // Hyperlocal Distance Slider
                VStack {
                    Text("Select Hyperlocal Distance")
                    HStack {
                        Text("1 Km")
                        Spacer()
                        Text("100 Km")
                    }
                    Slider(value: $distanceValue, in: 1...100)
                    Text("\(Int(distanceValue))")
                        .bold()
                }
                .padding(.horizontal)
                Spacer(minLength: 10)
                // Purpose Buttons
                Text("Select Purpose")
                    .padding(.top)
                Spacer(minLength: 40)
                LazyVGrid(columns: [GridItem(), GridItem(), GridItem()]) {
                    ForEach(["Coffee", "Business", "Hobbies", "Friendship", "Movies", "Dining", "Dating", "Matrimony"], id: \.self) { purpose in
                        Button(action: {
                            if selectedPurposes.contains(purpose) {
                                selectedPurposes.removeAll(where: { $0 == purpose })
                            } else {
                                selectedPurposes.append(purpose)
                            }
                        }) {
                            Text(purpose)
                                .padding()
                                .frame(maxWidth: .infinity)
                                .background(selectedPurposes.contains(purpose) ? Color.blue : Color.gray.opacity(0.5))
                                .foregroundColor(.white)
                                .cornerRadius(10)
                        }
                        .frame(height: 50) // Set a fixed height for all buttons
                    }
                }
                .padding(.horizontal)

                Spacer(minLength: 40)

                            // Save & Explore Button
                Button(action: {
                                // Handle save and explore action here
                            }) {
                                Text("Save & Explore")
                                    .font(.headline)
                                    .foregroundColor(.white)
                                    .padding()
                                    .frame(maxWidth: .infinity)
                                    .background(Color.blue)
                                    .cornerRadius(10)
                            }
                            .padding(.horizontal)
            }
        }
    }
}

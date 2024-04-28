//
//  ContentView.swift
//  NetClan
//
//  Created by Satvik Viriyala on 17/04/24.
//
import SwiftUI
//
struct Interest: Identifiable {
    let id = UUID()
    let icon: String
    let name: String
}


let coffeeInterest = Interest(icon: "cup.and.saucer.fill", name: "Coffee")
let businessInterest = Interest(icon: "building.2.fill", name: "Trade")
let friendshipInterest = Interest(icon: "person.2.fill", name: "Friendship")

struct ProfileCardView: View {
    let initials: String
    let name: String
    let location: String
    let profession: String
    let distance: String
    let profileScore: Int
    let interests: [Interest]

    var body: some View {
        HStack {
            ZStack {
                RoundedRectangle(cornerRadius: 10)
                    .fill(Color.blue)
                Text(initials)
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .foregroundColor(.white)
            }
            .frame(width: 50, height: 50)

            VStack(alignment: .leading) {
                Text(name)
                    .font(.headline)
                Text("\(location) | \(profession)")
                    .font(.subheadline)
                Text("within \(distance)")
                    .font(.caption)
                
                HStack {
                    ProfileScoreView(score: profileScore)
                    Text("~ \(profileScore)%")
                }

                HStack {
                    ForEach(interests) { interest in
                        HStack {
                            Image(systemName: interest.icon)
                                .font(.caption)
                            Text(interest.name.capitalized)
                                .font(.caption)
                        }
                    }
                }
            }
            Spacer()
            Button("+ INVITE") {
                // Action for invite button To be implemented in fture
            }
        }
        .padding()
    }
}

struct ProfileScoreView: View {
    let score: Int

    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 5)
                .fill(Color.gray.opacity(0.5))
            GeometryReader { geometry in
                RoundedRectangle(cornerRadius: 5)
                    .fill(Color.blue)
                    .frame(width: geometry.size.width * CGFloat(score) / 100)
            }
        }
        .frame(height: 10)
    }
}

struct TopBarView: View {
    @State private var searchText = ""
    @Binding var selectedTab: Int
    @Binding var showRefineView: Bool
    

    var body: some View {
        VStack(spacing: 3) {
            HStack {
                Button(action: {
                    // Have to Implement settings or profile action here in Future
                }) {
                    Image(systemName: "line.horizontal.3")
                        .font(.title2)
                        .foregroundColor(.white)
                }
                Spacer()
                VStack(alignment: .trailing) {
                    Text("Howdy satvik viriyala!")
                        .font(.headline)
                        .foregroundColor(.white)
                    Text("Haripuram, Rajahmundry")
                        .font(.subheadline)
                        .foregroundColor(.white)
                }
                Spacer()
                Button(action: {
                    showRefineView = true
                }) {
                    HStack {
                        Image(systemName: "checkmark")
                        Text("Refine")
                    }
                    .font(.subheadline)
                    .foregroundColor(.white)
                }
            }
            .padding(.horizontal)
            .padding(.vertical, 8)
            .background(Color.blue)

            HStack {
                Button(action: {
                    selectedTab = 0
                }) {
                    Text("Personal")
                        .foregroundColor(.white)
                }
                Spacer()
                Button(action: {
                    selectedTab = 1
                }) {
                    Text("Services")
                        .foregroundColor(.white)
                }
                Spacer()
                Button(action: {
                    selectedTab = 2
                }) {
                    Text("Businesses")
                        .foregroundColor(.white)
                }
            }
            .padding(.horizontal)
            .padding(.vertical, 18)
            .background(Color.blue.opacity(0.95))

            HStack {
                Image(systemName: "magnifyingglass")
                    .foregroundColor(.gray)
                TextField("Search", text: $searchText)
                Spacer()
                Image(systemName: "slider.horizontal.3")
                    .foregroundColor(.gray)
            }
            .padding(.horizontal)
            .padding(.vertical, 8)
            .background(Color.gray.opacity(0.2))

        
            Button(action: {
                            showRefineView = true
                        }) {
                            HStack {
                                Image(systemName: "checkmark")
                                Text("Refine")
                            }
                            .font(.subheadline)
                            .foregroundColor(.white)
                        }
        }
    }
}

struct PersonalView: View {
    var body: some View {
        ScrollView {
            VStack {
                ProfileCardView(
                    initials: "PV",
                    name: "PersonalView Sample1",
                    location: "New Delhi",
                    profession: "Software Engineer",
                    distance: "700-800 m",
                    profileScore: 26,
                    interests: [coffeeInterest, businessInterest, friendshipInterest]
                )
                ProfileCardView(
                    initials: "PV",
                    name: "PersonalView Sample2",
                    location: "New Delhi",
                    profession: "Software Engineer",
                    distance: "700-800 m",
                    profileScore: 26,
                    interests: [coffeeInterest, businessInterest, friendshipInterest]
                )

                ProfileCardView(
                    initials: "PV",
                    name: "PersonalView Sample3",
                    location: "New Delhi",
                    profession: "Software Engineer",
                    distance: "700-800 m",
                    profileScore: 26,
                    interests: [coffeeInterest, businessInterest, friendshipInterest]
                )
                ProfileCardView(
                    initials: "PV",
                    name: "PersonalView Sample4",
                    location: "New Delhi",
                    profession: "Software Engineer",
                    distance: "700-800 m",
                    profileScore: 26,
                    interests: [coffeeInterest, businessInterest, friendshipInterest]
                )
                ProfileCardView(
                    initials: "PV",
                    name: "PersonalView Sample5",
                    location: "New Delhi",
                    profession: "Software Engineer",
                    distance: "700-800 m",
                    profileScore: 26,
                    interests: [coffeeInterest, businessInterest, friendshipInterest]
                )

            }
        }
    }
}

struct ServicesView: View {
    var body: some View {
        ScrollView {
            VStack {
                ProfileCardView(
                    initials: "SV",
                    name: "ServicesView Sample1",
                    location: "New Delhi",
                    profession: "Software Engineer",
                    distance: "700-800 m",
                    profileScore: 26,
                    interests: [coffeeInterest, businessInterest, friendshipInterest]
                )
                ProfileCardView(
                    initials: "SV",
                    name: "ServicesView Sample2",
                    location: "New Delhi",
                    profession: "Software Engineer",
                    distance: "700-800 m",
                    profileScore: 26,
                    interests: [coffeeInterest, businessInterest, friendshipInterest]
                )

            }
        }
    }
}

struct BusinessesView: View {
    var body: some View {
        ProfileCardView(
            initials: "BV",
            name: "BusinessView Sample1",
            location: "New Delhi",
            profession: "Software Engineer",
            distance: "700-800 m",
            profileScore: 26,
            interests: [coffeeInterest, businessInterest, friendshipInterest]
        )
    }
   
}
struct ContentView: View {
    @State private var selectedTab = 0
    @State private var showRefineView = false
    var body: some View {
        NavigationStack {
            VStack {
                TopBarView(selectedTab: $selectedTab, showRefineView: $showRefineView)

  
                switch selectedTab {
                case 0:
                    PersonalView()
                case 1:
                    ServicesView()
                case 2:
                    BusinessesView()
                default:
                    EmptyView()
                }

                Spacer()

                // Bottom Navigation Bar
                HStack {
                    Image(systemName: "magnifyingglass")
                    Spacer()
                    Image(systemName: "person.2.fill")
                    Spacer()
                    Image(systemName: "bubble.left.and.bubble.right.fill")
                    Spacer()
                    Image(systemName: "person.crop.circle.fill")
                    Spacer()
                    Image(systemName: "number")
                }
                .padding()
            }
            .navigationBarHidden(true)

    
            .navigationDestination(isPresented: $showRefineView) {
                            RefineView()
                        }
        }
    }
}
   

#Preview {
    ContentView()
}

//
//  ContentView.swift
//  shet
//
//  Created by Najla adel alabdullah on 24/04/1446 AH.
//

import SwiftUI

struct NewRecipePage: View {
    @State private var title: String = ""
    @State private var description: String = ""
    @State private var showingIngredientPopup = false

    var body: some View {
        NavigationStack {
            VStack(spacing: 50) {
                
                Spacer()

                // Upload Photo Section
                VStack {
                    Image(systemName: "photo.on.rectangle.angled")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 80, height: 80)
                        .foregroundColor(Color.orange)
                    
                    Text("Upload Photo")
                        .foregroundColor(.white)
                        .font(.headline)
                }
                .padding()
                .frame(maxWidth: .infinity, minHeight: 200)
                .background(Color.black.opacity(0.8))
                .overlay(
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(style: StrokeStyle(lineWidth: 2, dash: [10]))
                        .foregroundColor(Color.orange)
                )
                .cornerRadius(10)

                // Title TextField
                VStack(alignment: .leading, spacing: 5) {
                    Text("Title")
                        .foregroundColor(.white)
                        .font(.headline)
                    
                    TextField("Title", text: $title)
                        .padding()
                        .background(Color.black.opacity(0.2))
                        .cornerRadius(10)
                        .foregroundColor(.white)
                }
                .padding(.horizontal)

                // Description TextField
                VStack(alignment: .leading, spacing: 5) {
                    Text("Description")
                        .foregroundColor(.white)
                        .font(.headline)
                    
                    TextField("Description", text: $description)
                        .padding()
                        .background(Color.black.opacity(0.2))
                        .cornerRadius(10)
                        .foregroundColor(.white)
                }
                .padding(.horizontal)

                // Add Ingredient Section
                HStack {
                    Text("Add Ingredient")
                        .foregroundColor(.white)
                        .font(.headline)
                    
                    Spacer()
                    
                    Button(action: {
                        showingIngredientPopup = true
                    }) {
                        Image(systemName: "plus.circle.fill")
                            .foregroundColor(.orange)
                            .font(.title2)
                    }
                    .sheet(isPresented: $showingIngredientPopup) {
                        IngredientPopupView()
                    }
                }
                .padding(.horizontal)
                
                Spacer()
            }
            .navigationTitle("New Recipe")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button(action: {
                        print("Back button tapped")
                    }) {
                        Text("back")
                            .foregroundColor(.orange)
                    }
                }
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button(action: {
                        print("Save button tapped")
                    }) {
                        Text("Save")
                            .foregroundColor(.orange)
                    }
                }
            }
        }
    }
}

struct IngredientPopupView: View {
    @Environment(\.presentationMode) var presentationMode

    var body: some View {
        VStack {
            Text("Ingredient Name")
            TextField("Ingredient Name", text: .constant(""))

            Text("Measurement")
            HStack {
                Button("Spoon") { /* Measurement logic */ }
                Button("Cup") { /* Measurement logic */ }
            }

            Text("Serving")
            HStack {
                Button("-") { /* Decrease serving */ }
                Text("1")
                Button("+") { /* Increase serving */ }
            }

            HStack {
                Button("Cancel") {
                    presentationMode.wrappedValue.dismiss()
                }
                Button("Add") {
                    // Add ingredient logic here
                    presentationMode.wrappedValue.dismiss()
                }
            }
        }
        .padding()
    }
}
// Main view or any containing view
struct MainView: View {
    var body: some View {
        VStack {
            // Some UI code
        }
    }
}

// Ingredient view defined separately
struct dIngredientView: View {
    @Environment(\.presentationMode) var presentationMode
    @State private var ingredientName: String = ""
    @State private var measurement: String = "Spoon"
    @State private var quantity: Int = 1

    var body: some View {
        VStack(spacing: 20) {
            // Ingredient Name Field
            TextField("Ingredient Name", text: $ingredientName)
                .padding()
                .background(Color.black.opacity(0.05))
                .cornerRadius(8)

            // Measurement Options
            Text("Measurement")
                .font(.headline)
                .foregroundColor(.gray)

            HStack {
                Button(action: {
                    measurement = "Spoon"
                }) {
                    HStack {
                        Image(systemName: "flame.fill")
                        Text("Spoon")
                    }
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(measurement == "Spoon" ? Color.orange : Color.gray.opacity(0.2))
                    .foregroundColor(.white)
                    .cornerRadius(8)
                }

                Button(action: {
                    measurement = "Cup"
                }) {
                    HStack {
                        Image(systemName: "cup.and.saucer.fill")
                        Text("Cup")
                    }
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(measurement == "Cup" ? Color.orange : Color.gray.opacity(0.2))
                    .foregroundColor(.white)
                    .cornerRadius(8)
                }
            }
        }
        .padding()
    }
}

       
                #Preview {
                    NewRecipePage()
                        .preferredColorScheme(.dark)
                }
         

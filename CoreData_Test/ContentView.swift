//
//  ContentView.swift
//  CoreData_Test
//
//  Created by RGMCode on 03.06.24.
//

import SwiftUI

struct ContentView: View {
    
    @Environment(\.managedObjectContext) var moc
    @FetchRequest(sortDescriptors: []) var cars: FetchedResults<Car>
    @State private var name = ""
    @State private var selectedCar: Car?
    
    var body: some View {
        VStack {

            List(cars, id: \.self) { car in
                HStack {
                    Text(car.name ?? "Error")
                    Spacer()
                    if car == selectedCar {
                        Image(systemName: "checkmark")
                    }
                }
                .contentShape(Rectangle())
                .onTapGesture {
                    selectedCar = car
                }
            }.scrollContentBackground(.hidden)
            Spacer()
            TextField("Eingabe...", text: $name)
                .padding()
                .overlay(
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(.gray, lineWidth: 1)
                )
            HStack {
                Button(action: {
                    let newCar = Car(context: moc)
                    newCar.id = UUID()
                    newCar.name = name
                    
                    try? moc.save()
                    
                    name = ""
                }){
                    Image(systemName: "checkmark.seal.fill")
                        .foregroundColor(.green)
                        .font(.system(size: 50))
                }.padding()
                Button(action: {
                    if let carToDelete = selectedCar {
                        moc.delete(carToDelete)
                        try? moc.save()
                        selectedCar = nil
                    }
                }){
                    Image(systemName: "delete.left.fill")
                        .foregroundColor(.red)
                        .font(.system(size: 50))
                }.padding()
                .disabled(selectedCar == nil)
            }
        }
        .padding()
        .background(Gradient(colors: [.orange, .yellow, .white]))
    }
}

#Preview {
    ContentView()
}

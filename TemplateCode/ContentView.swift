//
//  ContentView.swift
//  PlayingWithSwiftUI
//
//  Created by Fareed Quraishi on 2023-01-20.
//

import SwiftUI
import CoreLocation

struct ContentView: View {
    @Environment(\.managedObjectContext) var moc
    @FetchRequest(sortDescriptors: []) var students: FetchedResults<Student>
    
    var body: some View {
        VStack {
            List(students) { student in
                Text(student.name ?? "Unknown")
            }
            Button("Add") {
                buttonPressed()
            }
        }
    }
    
    func buttonPressed() {
        let firstNames = ["Ginny", "Harry", "Hermione", "Luna", "Ron"]
        let lastNames = ["Granger", "Lovegood", "Potter", "Weasley"]

        let chosenFirstName = firstNames.randomElement() ?? "FirstName"
        let chosenLastName = lastNames.randomElement() ?? "LastName"

        let student = Student(context: moc)
        student.id = UUID()
        student.name = "\(chosenFirstName) \(chosenLastName)"
        
        do {
            try moc.save()
        } catch let error {
            print(error)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(ModelData())
    }
}

//
//  AddChildView.swift
//  MomentaryCo
//
//  Created by David Higgins on 23/11/2023.
//

import SwiftUI
import PhotosUI

struct AddChildView: View {
    
    @State private var childName = ""
    @State private var childBirthday = Date.now
    @State private var selectedBook = BookType.me
    @State private var photosPickerItem: PhotosPickerItem?
    @State private var childProfileImage: Image?
    
    private let dateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateStyle = .medium
        return formatter
    }()
    
    var body: some View {
        
       
        VStack {
            
            PhotosPicker(selection: $photosPickerItem, matching: .images) {
                Image(systemName: "pencil")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 90, height: 90)
                    .foregroundColor(.gray)
                       
                   
            }
            
            TextField("Child Name", text: $childName)
           
            DatePicker("Birthday", selection: $childBirthday, in: Date(timeIntervalSinceNow: -473040000)...Date.now.addingTimeInterval(-31536000), displayedComponents: .date)
            Text("Select Book Type")
            Picker("Select Book", selection: $selectedBook) {
                ForEach(BookType.allCases) { book in
                    Text(book.rawValue.capitalized)
                }
            }
            .pickerStyle(.segmented)
            
            
            
            
            Spacer()
            Text("Add Child View")
        }
        .padding()
        .onChange(of: photosPickerItem) { _ in
            Task {
                if let photosPickerItem,
                   let data = try await photosPickerItem.loadTransferable(type: Data.self) {
                    if let image = UIImage(data: data) {
                        childProfileImage = image
                    }
                }
                photosPickerItem = nil
            }
        }
    }
}

struct AddChildView_Previews: PreviewProvider {
    static var previews: some View {
        AddChildView()
    }
}

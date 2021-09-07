// UnderstandingGeometryReader.swift
// MARK: SOURCE
// https://www.hackingwithswift.com/books/ios-swiftui/understanding-frames-and-coordinates-inside-geometryreader
/// `GeometryReader` allows us to determine the size and coordinates of views
/// as a function of its own size and coordinates .
/// In its most basic usage , `GeometryReader`lets us read the size that was proposed by the parent ,
/// then use that to manipulate our view .
///
/// You should always keep in mind SwiftUI’s three-step layout system when working with GeometryReader :
/// `1`Parent proposes a size for the child ,
/// `2`the child uses that to determine its own size ,
/// `3`and parent uses that to position the child appropriately .

// MARK: - LIBRARIES -

import SwiftUI



struct UnderstandingGeometryReader: View {
   
   // MARK: - COMPUTED PROPERTIES
   
   var body: some View {
      
      VStack {
         GeometryReader { geometryProxy in
            Text("Hello, World!")
               .frame(width: geometryProxy.size.width * 0.90,
                      height: 40)
               .background(Color.red)
         }
         .background(Color.orange)
         Text("Hello Again")
            .background(Color.green)
      }
   }
}





// MARK: - PREVIEWS -

struct UnderstandingGeometryReader_Previews: PreviewProvider {
   
   static var previews: some View {
      
      UnderstandingGeometryReader()
   }
}

// CustomAlignmentGuide.swift
// MARK: SOURCE
// https://www.hackingwithswift.com/books/ios-swiftui/how-to-create-a-custom-alignment-guide

// MARK: - LIBRARIES -

import SwiftUI



struct CustomAlignmentGuide: View {
   
   // MARK: - COMPUTED PROPERTIES
   
   var body: some View {
      
      HStack(alignment: .midAccountName) {
         VStack {
            Text("@olivier")
               .alignmentGuide(.midAccountName) { (viewDimensions: ViewDimensions) in
                  return viewDimensions[VerticalAlignment.center]
               }
            Image("ovh")
               .resizable()
               .frame(width: 77,
                      height: 77)
         }
         VStack {
            Text("Full Name")
            Text("Olivier Van hamme")
               .alignmentGuide(.midAccountName) { (viewDimensions: ViewDimensions) in
                  return viewDimensions[VerticalAlignment.center]
               }
               .font(.largeTitle)
         }
      }
   }
}





// MARK: - EXTENSIONS -

extension VerticalAlignment {
   
   // MARK: - STATIC PROPERTIES
   static let midAccountName: VerticalAlignment = VerticalAlignment(MidAccountAndName.self)
   /// `NOTE`This is only a guide :
   /// it helps you align views along a single line ,
   /// but doesn’t say how they should be aligned .
   /// This means
   /// you still need to provide
   /// the closure to `alignmentGuide()`
   /// that positions the views along that guide as you want . For example ,
   /// we could update our Twitter code to use `.midAccountAndName`,
   /// then tell the account and name to use their center position for the guide .
   
   
   
   // MARK: - TYPES
   
   /// `NOTE`Using an enum is preferable to a struct , and here is why :
   /// if we created a new struct called MidAccountAndName ,
   /// we could (if we wanted) create an instance of that struct
   /// even though doing so doesn’t make sense
   /// because it doesn’t have any functionality .
   /// If you replace `struct MidAccountAndName` with `enum MidAccountAndName`
   /// then you can’t make an instance of it any more
   /// – it becomes clearer that this thing exists only to house some functionality :
   enum MidAccountAndName: AlignmentID {
      
      static func defaultValue(in context: ViewDimensions)
      -> CGFloat {
         
         return context[.top]
      }
   }
}





// MARK: - PREVIEWS -

struct CustomAlignmentGuide_Previews: PreviewProvider {
   
   static var previews: some View {
      
      CustomAlignmentGuide()
   }
}

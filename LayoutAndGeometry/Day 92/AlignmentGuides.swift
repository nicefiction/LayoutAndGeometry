// AlignmentGuides.swift
// MARK: SOURCE
// https://www.hackingwithswift.com/books/ios-swiftui/alignment-and-alignment-guides

// MARK: - LIBRARIES -

import SwiftUI



struct AlignmentGuides: View {
   
   // MARK: - COMPUTED PROPERTIES
   
   var body: some View {
      
      // OPTION 1 :
      /// The simplest alignment option is
      /// to use the alignment parameter of a `frame()` modifier .
      /// Remember , a text view always uses the exact width and height required to show its text ,
      /// but when we place a frame around it that can be any size .
      /// As the parent doesn’t have a say in the final size of the child :
//      Text("Live Long & Prosper")
//         .frame(width: 300,
//                height: 300,
//                alignment: .topLeading)
         /// You can then use `offset(x:y:)` to move the text around inside that frame .
//         .offset(x: 10.0,
//                 y: 20.0)
      
      // OPTION 2 :
      /// The next option up is to use the alignment parameter of a stack .
      /*
      HStack(alignment: .lastTextBaseline) {
         Text("Live")
            .font(.caption)
         Text("Long")
         Text("&")
            .font(.title)
         Text("Prosper")
            .font(.largeTitle)
       */
      /*
      VStack(alignment: .leading) {
         Text("Hello World")
            .alignmentGuide(.leading) { (viewDimensions: ViewDimensions) in
//               viewDimensions[.leading]
               viewDimensions[.trailing]
               /// The first text view will now move to the left
               /// so that its right edge sits directly above the left edge of the view below ,
               /// the VStack will expand to contain it ,
               /// and the whole thing will still be centered within the blue frame .
               /// `NOTE`This result is different from using the `offset()` modifier :
               /// if you offset a text its original dimensions don’t actually change ,
               /// even though the resulting view is rendered in a different location .
               /// If we had offset the first text view rather than changing its alignment guide ,
               /// the VStack wouldn’t expand to contain it .
            }
         Text("This is a longer line of text.")
      }
      .background(Color.red)
      .frame(width: 400,
             height: 400,
             alignment: .center)
      .background(Color.blue)
       */
      
      /// Although the alignment guide closure is passed your view’s dimensions ,
      /// you don’t need to use them if you don’t want to
      /// – you can send back a hard-coded number, or create some other calculation . For example ,
      /// this creates a tiered effect for 10 text views by multiplying their position by -10 :
      VStack(alignment: .leading) {
         ForEach(0..<10) { position in
            Text("Number \(position)")
               .alignmentGuide(.leading) { _ in
                  return CGFloat(position) * -10
               }
         }
      }
      .background(Color.red)
      .frame(width: 400,
             height: 400)
      .background(Color.blue)
   }
}
/// `NOTE`For complete control over your alignment guides
/// you need to create a custom alignment guide .
/// And I think that deserves a mini chapter all of its own…





// MARK: - PREVIEWS -

struct AlignmentGuides_Previews: PreviewProvider {
   
   static var previews: some View {
      
      AlignmentGuides()
   }
}

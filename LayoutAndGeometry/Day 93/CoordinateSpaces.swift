// CoordinateSpaces.swift
// MARK: SOURCE
// https://www.hackingwithswift.com/books/ios-swiftui/understanding-frames-and-coordinates-inside-geometryreader
/// When it comes to reading the frame of a view ,
/// `GeometryProxy` provides a `frame(in:)` method rather than simple properties .
/// This is because the concept of a _frame_ includes X and Y coordinates ,
/// which don’t make any sense in isolation
/// – do you want the view’s absolute X and Y coordinates ,
/// or their X and Y coordinates compared to their parent ?
/// SwiftUI calls these options _coordinate spaces_ ,
/// and those two in particular are called the `global space`
/// — measuring our view’s frame relative to the whole screen — ,
/// and the `local space`
/// —measuring our view’s frame relative to its parent .
/// We can also create custom coordinate spaces
/// by attaching the `coordinateSpace()` modifier to a view
/// – any children of that can then read its frame relative to that coordinate space .
///
/// Which coordinate space you want to use depends on what question you want to answer :
/// `A`Want to know where this view is _on the screen_ ? Use the `global space`.
/// `B`Want to know where this view is _relative to its parent_ ? Use the `local space`.
/// `C`What to know where this view is _relative to some other view_ ? Use a `custom space`.

// MARK: - LIBRARIES -

import SwiftUI



// MARK: - struct OuterView -

struct OuterView: View {
   
   // MARK: - COMPUTED PROPERTIES
   
   var body: some View {
      
      return VStack {
         Text("Top")
         InnerView()
            .background(Color.green)
         Text("Bottom")
      }
   }
}





// MARK: - struct InnerView -

struct InnerView: View {
   
   // MARK: - COMPUTED PROPERTIES
   
   var body: some View {
      
      return HStack {
         Text("Left")
         GeometryReader { geometryProxy in
               Text("Center")
                  .background(Color.blue)
                  .onTapGesture {
                     print("Global center: \(geometryProxy.frame(in: .global).midX) x \(geometryProxy.frame(in: .global).midY)")
                     print("Custom center: \(geometryProxy.frame(in: .named("Custom")).midX) x \(geometryProxy.frame(in: .named("Custom")).midY)")
                     print("Local center: \(geometryProxy.frame(in: .local).midX) x \(geometryProxy.frame(in: .local).midY)")
               }
         }
         .background(Color.purple)
         Text("Right")
      }
   }
}
/*
 Global center: 189.83333333333331 x 430.60424804687494
 Custom center: 189.83333333333331 x 383.60424804687494
 Local center: 152.16666666666666 x 350.96183268229163
 
 Global center: 194.99999999999997 x 430.60424804687494
 Custom center: 194.99999999999997 x 383.60424804687494
 Local center: 157.33333333333331 x 350.96183268229163
 */




// MARK: - struct CoordinateSpaces -

struct CoordinateSpaces: View {
   
   // MARK: - COMPUTED PROPERTIES
   
   var body: some View {
      
      OuterView()
         .background(Color.red)
         .coordinateSpace(name: "Custom")
   }
}





// MARK: - PREVIEWS -

struct CoordinateSpaces_Previews: PreviewProvider {
   
   static var previews: some View {
      
      CoordinateSpaces()
   }
}

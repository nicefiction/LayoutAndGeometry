// AbsolutePositioning.swift
// MARK: SOURCE
// https://www.hackingwithswift.com/books/ios-swiftui/absolute-positioning-for-swiftui-views
/// The three step layout process of SwiftUI :
/// `1`A parent view proposes a size for its child .
/// `2`Based on that information ,
/// the child then chooses its own size
/// and the parent must respect that choice .
/// `3`The parent then positions the child in its coordinate space .
/// So , the parent is responsible for positioning the child , not the child .

// MARK: - LIBRARIES -

import SwiftUI



struct AbsolutePositioning: View {
   
   // MARK: - COMPUTED PROPERTIES
   
   var body: some View {
      
      Text("Position")
         .position(x: 100,
                   y: 100)
         .background(Color.red)
      /// When we use `Text` , `position` , then `background`
      /// the `position` will take up all available space
      /// so it can position its `text` correctly ,
      /// then the `background` will use that size for itself .
      /// When we use `Text` , `background` , then `position` ,
      /// the `background` will use the `text` size for its size ,
      /// then the `position` will take up all available space
      /// and place the `background` in the correct location .
      
      Text("Offset")
         .offset(x: 100,
                 y: 100)
         .background(Color.blue)
      /// If you `offset` some `text`
      /// its original dimensions don’t actually change ,
      /// even though the resulting view is rendered in a different location .
      /// When we use the `offset()` modifier ,
      /// we are changing the location where a view should be rendered
      /// without actually changing its underlying geometry .
      /// This means when we apply `background()` afterwards
      /// it uses the original position of the `text` , not its `offset` .
      /// If you move the modifier order so that `background()` comes before `offset()`
      /// then things work more like you might have expected ,
      /// showing once again that modifier order matters .
   }
}





// MARK: - PREVIEWS -

struct AbsolutePositioning_Previews: PreviewProvider {
   
   static var previews: some View {
      
      AbsolutePositioning()
   }
}

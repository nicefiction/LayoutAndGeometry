// HowLayoutWorks.swift
// MARK: SOURCE
// https://www.hackingwithswift.com/books/ios-swiftui/how-layout-works-in-swiftui
/// All SwiftUI layout happens in three simple steps ,
/// and understanding these steps is the key to getting great layouts every time .
/// The steps are :
/// `1` A parent view proposes a size for its child .
/// `2` Based on that information , the child then chooses its own size and the parent must respect that choice .
/// `3` The parent then positions the child in its coordinate space .

// MARK: - LIBRARIES -

import SwiftUI



struct HowLayoutWorks: View {
   
   // MARK: - COMPUTED PROPERTIES
   
   var body: some View {
      
//      Text("Hello, World!")
//         .padding(20)
//         .background(Color.red)
      /// `SwiftUI`: You can have the whole screen , how much of it do you need , `ContentView` ?
      /// `ContentView`: You can have the whole screen , how much of it do you need, `background` ?
      /// `Background`: You can have the whole screen , how much of it do you need , `padding` ?
      /// `Padding`: You can have the whole screen minus 20 points on each side, how much of it do you need , `text` ?
      /// `Text`: I need X by Y .
      /// `Padding`: I need X by Y plus 20 points on each side .
      /// `Background`: I need X by Y plus 20 points on each side .
      /// `ContentView`: I need X by Y plus 20 points on each side .
      /// `SwiftUI`: OK; I’ll center you .
  
      // Two interesting side effecets :
      
//      Color.red
      ///  `Color.red` is a view in its own right ,
      ///  but because it is layout neutral
      ///  it can be drawn at any size .
      ///  When we used it inside background()
      ///  the abridged layout conversation worked like this :
      /// `1` Background : Hey text , you can have the whole screen – how much of that do you want ?
      /// `2` Text : I need X by Y points; I don’t need the rest .
      /// `3` Background : OK . Hey , Color.red: you can have X by Y points – how much of that do you want ?
      /// `4` Color.red : I don’t care ; I’m layout neutral , so X by Y points sounds good to me .
      
      /// The second interesting side effect is one we faced earlier :
      /// if we use `frame()` on an image that isn’t resizable ,
      /// we get a larger frame without the image inside changing size .
      /// This might have been confusing before ,
      /// but it makes absolute sense
      /// once you think about the frame as being the parent of the image :
      Image("sanGiovanni")
         // .resizable()
         .frame(width: 300, height: 300)
      /// ContentView offers the frame the whole screen.
      /// The frame reports back that it wants 300x300 .
      /// The frame then asks the image inside it what size it wants .
      ///  The image, not being resizable , reports back a fixed size of 64x64 (for example) .
      ///  The frame then positions that image in the center of itself .
      
      /// When you listen to Apple’s own SwiftUI engineers talk about `modifiers` ,
      /// you’ll hear them refer them to as views
      /// – “the frame view” , “the background view” , and so on .
      /// I  think that’s a great mental model to help understand exactly what’s going on :
      /// applying modifiers creates new views rather than just modifying existing views in-place .
   }
}






// MARK: - PREVIEWS -

struct HowLayoutWorks_Previews: PreviewProvider {
   
   static var previews: some View {
      
      HowLayoutWorks()
   }
}

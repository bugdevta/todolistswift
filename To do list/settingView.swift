
import SwiftUI

struct settingView: View {
    var body: some View {
        NavigationStack{
            Text("Settings")
                .font(.largeTitle) //modifier.
                .fontWeight(.bold)
                .padding()
                .foregroundStyle(.brown)
            List{
                
                HStack{
                    //                    Image(systemName: "circle")
                    Button{
                        
                    } label: {
                        Image(systemName: "circle.lefthalf.filled")
                    }
                    Text("Dark Mode")
                    //                    if(itemList[index].important){
                    //                        Image(systemName: "star.fill")
                    //                    }
                }
                HStack{
                    //                    Image(systemName: "circle")
                    Button{
                        
                    } label: {
                        Image(systemName: "plus")
                    }
                    Text("Create Category")
                    //                    if(itemList[index].important){
                    //                        Image(systemName: "star.fill")
                    //                    }
                }
            }
            .listStyle(.grouped)
            NavigationLink{
                ContentView()
            } label: {
                Image(systemName: "house")
            }
        }
    }
}

#Preview {
    settingView()
}

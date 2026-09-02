
import SwiftUI

struct item{
    var name:String
    var completed:Bool
    var important: Bool
}


struct ContentView: View{
    @State var task=""
    @State var itemList:[item] = [item(name: "Study Swift", completed: false, important: false), item(name: "Complete Assignment", completed: false, important: false)]
    @State var ind: Int?
    var body: some View {
        NavigationStack{
            
            Text("To Do List")
                .font(.largeTitle)
                .fontWeight(.bold)
                .foregroundStyle(.blue)
            HStack{
                TextField("Enter New task", text: $task, prompt: Text("Enter the task").foregroundStyle(.black))
                    .frame(width: 300, height: 30)
                    .padding(10)
                    .background(.thinMaterial)
                    .foregroundStyle(.black)
                    .clipShape(.rect(cornerRadius: 30))
                
                Button(){
                    addTask()
                } label: {
                    Text("+")
                        .font(.title2)
                        .padding(20)
                        .background(.blue)
                        .foregroundStyle(.white)
                        .clipShape(.circle)
                }
            }
            List{
                ForEach(itemList.indices, id: \.self){ index in
                    HStack{
                        //                    Image(systemName: "circle")
                        Button{
                            itemList[index].completed.toggle()
                        } label: {
                            if(itemList[index].completed){
                                Image(systemName: "checkmark.circle")
                            }
                            else{
                                Image(systemName: "circle")
                            }
                            //                        Image(systemName: itemList[index].completed ? "checkmark.circle":"circle")
                        }
                        Text(itemList[index].name)
                        if(itemList[index].important){
                            Image(systemName: "star.fill")
                        }
                    }
                    .swipeActions(edge : .leading){
                        Button{
                            itemList[index].important.toggle()
                        } label: {
                            Text("mark Important")
                        }
                    }
                    .swipeActions(edge: .trailing){
                        Button{
                            ind=index
                            removeTask()
                        } label:{
                            Text("Delete")
                        }
                        .tint(.red)
                    }
                }
            }
            .listStyle(.plain)
            NavigationLink{
                settingView()
            } label: {
                Image(systemName: "gear")
                
            }
        }
    }
    
    func addTask(){
        if(!task.isEmpty){
            itemList.append(item(name: task, completed: false, important: false))
            task=""
        }
    }
    func removeTask(){
        if let ind{
            itemList.remove(at: ind)
        }
        ind = nil
    }
}

#Preview {
    ContentView()
}

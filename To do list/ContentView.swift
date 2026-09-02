import SwiftUI

struct item{
  var name:String
  var completed:Bool
  var important:Bool
}
struct ContentView: View{
    @State var task=""
    @State var itemList:[item] = [item(name: "Sleep", completed: false, important: false), item(name: "work", completed: false, important: false), item(name: "eat", completed: false, important: false)]
    @State var ind: Int?
    var body: some View {
        Text("To Do List")
            .font(.largeTitle) //modifier.
            .fontWeight(.bold)
            .padding()
            .foregroundStyle(.orange)
        HStack{
            TextField("Add a new task...", text : $task, prompt: Text("Add a new task...").foregroundStyle(.gray))
                .frame(width: 300,height: 20)
                .padding(10)
                .background(.thinMaterial)
                .foregroundStyle(.black)
                .clipShape(.rect(cornerRadius: 20))
            
            Button{
                addTask()
            } label: {
                Text("+")
                    .padding(13)
                    .background(.brown)
                    .foregroundStyle(.white)
                    .clipShape(.circle)
//                .buttonStyle(.borderedProminent) //inverts colours of text and border
            }
            
        }
        List{
            ForEach(itemList.indices, id: \.self){index in
                HStack{
//                    Image(systemName: "circle")
                    Button{
                        itemList[index].completed.toggle()
                    } label: {
//                        Image(systemName: itemList[index].completed ? "circle" : "checkmark.circle")
                        if(itemList[index].important){
                            if (itemList[index].completed){
                                Image(systemName: "star.fill")
                            }
                            else{
                                Image(systemName: "star")
                            }
                        }
                        else{
                            if (itemList[index].completed){
                                Image(systemName: "checkmark.circle")
                            }
                            else{
                                Image(systemName: "circle")
                            }
                        }
                    }
                    Text(itemList[index].name)
//                    if(itemList[index].important){
//                        Image(systemName: "star.fill")
//                    }
                }
                .swipeActions(edge: .leading){
                    Button{
                        itemList[index].important.toggle()
                    }label: {
                        Text("mark important")
                    }
                }
                .swipeActions(edge: .trailing){
                    Button{
                        ind=index
                        removeTask()
                    } label: {
                        Text("Delete")
                    }.tint(.red)
                }
            }
        }
        .listStyle(.plain)
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

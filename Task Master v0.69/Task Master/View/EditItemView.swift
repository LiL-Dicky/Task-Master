

import SwiftUI

struct EditItemView: View {
    
    var todo: Todo
    
    @State var todoItem: TodoItem
    
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        VStack(alignment: .leading) {
            
            // Header
            HStack {
                Text("Edit task")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                
                Spacer()
                
                Button(action: {
                    self.todo.editItem(item: self.todoItem)
                    self.presentationMode.wrappedValue.dismiss()
                }) {
                    Text("Apply")
                        .fontWeight(.medium)
                }
                .disabled(todoItem.title.count == 0)
            }
            .padding([.top, .horizontal])
            
            // Input
            TextField("Edit Task", text: self.$todoItem.title)
                .font(.system(size: 20))
                .padding(20)
                .background(Color(.systemGray5))
                .cornerRadius(20)
                .padding(.bottom)
            
            ColorPickerView(choosenColor: self.$todoItem.colorName)
            
            Spacer()
            
            // Footer
            HStack {
                Spacer()
                Text("Swipe down to cancel")
                    .foregroundColor(.secondary)
                    .padding(.top)
                Spacer()
            }
        }
        .padding(25)
    }
}

struct EditItemView_Previews: PreviewProvider {
    static var previews: some View {
        EditItemView(todo: Todo(), todoItem: TodoItem(title: "Sample task"))
    }
}

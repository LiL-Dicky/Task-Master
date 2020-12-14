

import SwiftUI

struct ListView: View {
    
  
    @EnvironmentObject var todo: Todo
    

    
    var body: some View {
        List{
            ForEach(self.todo.items.sorted(by: { $0.colorName < $1.colorName})) { item in
                RowView(itemId: item.id)
            }
        }
        .animation(.default)
        .onAppear() {
            UITableView.appearance().separatorColor = .clear
        }
    }
}

struct ListView_Previews: PreviewProvider {
    static var previews: some View {
        ListView().environmentObject(Todo())
    }
}

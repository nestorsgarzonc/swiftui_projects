import Foundation

class Node {
    var value: Story
    var children: [Node] = []
    weak var parent: Node?
    
    init(value: Story) {
        self.value = value
    }
    
    func add(child: Node) {
        children.append(child)
        child.parent = self
    }
    
    func hasChilren()->Bool{
        return !children.isEmpty
    }
}

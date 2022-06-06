

class LinkedList
  attr_reader :head, :tail
  def initialize()
    @head = nil
    @tail = nil
  end
  def append(value)
    node = Node.new(value)
    @head = node unless @head
    @tail.next_node = node if @tail
    @tail = node
  end
  def prepend(value)
    node = Node.new(value, @head)
    @head = node
  end
  def size
    return 0 unless @head
    count = 1
    node_check = @head
    while node_check.next_node
      node_check = node_check.next_node
      count += 1
    end
    count
  end
  def at(index)
    count = 0
    node_check = @head
    while count < index
      return nil unless node_check
      node_check = node_check.next_node
      count += 1
    end
    node_check
  end
  def list
    node_check = @head
    while node_check
      puts "#{node_check.value}, #{node_check.next_node}"
      node_check = node_check.next_node
    end
  end
  def pop
    return unless @head
    node_check = @head
    prev = nil
    while node_check.next_node != nil
      prev = node_check
      node_check = node_check.next_node
    end
    if !prev
      @head = nil
      @tail = nil
      return
    end
    prev.next_node = nil
    @tail = prev
  end
  def contains?(value)
    return unless @head
    node_check = @head
    while node_check
      return true if node_check.value == value
      node_check = node_check.next_node
    end
    false
  end
  def find(value)
    return nil unless @head
    node_check = @head
    index = 0
    while node_check
      return index if node_check.value == value
      index += 1
      node_check = node_check.next_node
    end
    nil
  end
  def to_s
    node_check = @head
    str = ''
    while node_check
      str += "( #{node_check.value} ) -> "
      node_check = node_check.next_node
    end
    str + 'nil'
  end
  def insert_at(value, index)
    return append(value) unless @head
    return prepend(value) if index <= 0
    i = 0
    node = @head
    prev = nil
    while i < index
      if !node
        return "index out of range"
      end
      prev = node
      node = node.next_node
      i += 1
    end
    new_node = Node.new(value, node)
    prev.next_node = new_node
  end
  def remove_at(index)
    i = 0
    node = @head
    prev = nil
    while i < index
      prev = node
      node = node.next_node
      return "index out of range" if !node
      i += 1
    end
    if i == 0
      @head = node.next_node
      if @tail == node
        @tail = node.next_node
      end
      return
    end
    prev.next_node = node.next_node
    if @tail == node
      @tail = prev
    end
  end
end





class Node
  attr_accessor :value, :next_node
  def initialize(value = nil, next_node = nil)
    @value = value
    @next_node = next_node
  end
end




list = LinkedList.new

list.append('first')
list.append('second')
list.append('third')

list.insert_at("before second", 3)

list.remove_at(0)

puts list.at(0)
puts list.find('second')
p list.to_s

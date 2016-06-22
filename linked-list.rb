# Quick Example of a Self Referential Data Structure in Ruby
# NODE -> contains a value and a pointer to (next_node)
# LinkedList -> This class holds the linked list functions - adding a node, traversing and displaying the linked list

class Node
   attr_accessor :value, :next_node

   def initialize(val,next_in_line=nil)
     @value = val
     @next_node = next_in_line
     #puts "Initialized a Node with value:  " + value.to_s
   end
end

class LinkedList
   def initialize
     @head = nil
     @size = 0
   end

   def add(value)
       if @size == 0
         @head = Node.new(value,nil)
         @size += 1
       else
         # Traverse to the end of the list
         # And insert a new node over there with the specified value
         current = @head
         while current.next_node != nil
             current = current.next_node
         end
         current.next_node = Node.new(value,nil)
         @size += 1
       end
       self
   end

   def delete(val)
       return nil if @size == 0
       if @head.value == val
           # If the head is the element to be delete, the head needs to be updated
           @head = @head.next_node
           @size -= 1
       else
           # ... x -> y -> z
           # Suppose y is the value to be deleted, you need to reshape the above list to :
           #   ... x->z
           previous = @head
           current = @head.next_node
           while current != nil && current.value != val
               previous = current
               current = current.next_node
           end

           if current != nil
               previous.next_node = current.next_node
               @size -= 1
           end
       end
   end

   def display
       # Traverse through the list till you hit the "nil" at the end
       current = @head
       full_list = []
       while current.next_node != nil
           full_list += [current.value.to_s]
           current = current.next_node
       end
       full_list += [current.value.to_s]
       puts "===" + full_list.join("->") + "==="
   end

   def include?(key)
     current = @head
     while current != nil
       return true if current.value == key
       current = current.next_node
     end
     return false
   end

   def size
     return @size
   end

   def max
     return nil if @size == 0
     max = @head.value
     current = @head.next_node
     while current != nil
       if current.value > max
         max = current.value
       end
       current = current.next_node
     end
     return max
   end

   def sort
     length = @size
     puts @size
     last = nextNode(@head,length)

     @size.times do |count|
       min = @head
       current = @head
       pre_min = nil

       until(current.next_node == last.next_node)
         previous = current
         current = current.next_node
         if(current.value < min.value)
           min = current
           pre_min = previous
         end
       end

     if (min == last)
      if(min == @head)
        add(min.value)
        @head = min.next_node
      else
       length -= 1
       add(min.value)
        pre_min.next_node = min.next_node
      end
    else
     min == @head ? @head = min.next_node : pre_min.next_node = min.next_node
     add(min.value)
    end
    end
     self
   end

   def reverse
     length = @size - 1
     last= nextNode(@head,@size)
    #  puts "Tail ==> length: #{@size} ==> #{last.value} --->"
    #  puts "enter loop"
     current = @head
     length.times do |count|
       current_last = nextNode(@head,(length - count))
        add(current_last.value)
        # puts "length: #{length - count} ==> #{current_last.value} --->"
        # puts self.display
     end
     @head = last
    #  puts "@head ==> #{last.value}"
     @size = length + 1
     self
   end

   def nextNode(node,num)
     until(num == 1)
       node = node.next_node
       num -= 1
     end
     return node
   end

end

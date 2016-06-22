require './array-list.rb'
require './linked-list.rb'

class Lotto
  def initialize
    @ticket = LinkedList.new
    while @ticket.size < 5
      auto_num = rand(55) + 1
      if !@ticket.include?(auto_num)
        @ticket.add(auto_num)
      end
    end
  end

  def display_ticket
    puts "original ticket: #{@ticket.display}"
    puts "reversed ticket: #{@ticket.reverse.display}"
    puts "  sorted ticket: #{@ticket.sort.display}"
  end
end

lotto_sim = Lotto.new

puts "Your ticket is......"
lotto_sim.display_ticket

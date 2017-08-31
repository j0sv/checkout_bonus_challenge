require 'yaml'

class Checkout

attr_accessor :basket, :products, :promotions, :total

def initialize
  @basket = []
  @products = YAML.load_file('./lib/product_list.yml')
  @promotions
  @total = []
end

def shop(index)
  @basket << @products[index]
  @total << @products[index]
  puts "You have added #{@products[index][:item][:name]} (price: #{@products[index][:item][:price]})."
  total_cost(index)
end

def total_cost(index)
  puts "Total cost is #{@total[index][:item][:price]}."
end

end

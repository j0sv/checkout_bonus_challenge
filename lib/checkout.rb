require 'yaml'

class Checkout

attr_accessor :basket, :products, :promotions

def initialize
  @basket = []
  @products = YAML.load_file('./lib/product_list.yml')
  @promotions
end

def shop(index)
  @basket << @products[index]
  puts "You have added #{@products[index][:item][:name]} and it costs #{@products[index][:item][:price]}"
end

end

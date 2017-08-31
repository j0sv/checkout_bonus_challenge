require 'yaml'

class Checkout

attr_accessor :basket, :products, :promotions, :total

def initialize
  @basket = []
  @products = YAML.load_file('./lib/product_list.yml')
  @promotions = YAML.load_file('./lib/promotions.yml')
  @total = []
end

def shop(index)
  @basket << @products[index]
  puts "You have added #{@products[index][:item][:name]} (price: #{@products[index][:item][:price]})."
  total_cost
end

def total_cost
  #basket.values_at(:price).each { |c| puts c }
  @basket.each { |x| puts x }
  end
end

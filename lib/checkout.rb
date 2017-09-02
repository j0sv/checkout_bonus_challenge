require 'yaml'

class Checkout

  attr_accessor :basket, :products, :total

  def initialize
    @basket = []
    @products = YAML.load_file('./lib/product_list.yml')
  end

  def shop(index)
    if index.kind_of?(Integer) && 0 <= index && index <= 2
      @basket << @products[index]
      puts "You have added #{@products[index][:item][:name]} (price: $#{@products[index][:item][:price]})."
    else
      puts "Please use the products index number."
      @products.each_with_index do |item, index|
        puts "#{index}. #{item[:item][:name]}, $#{item[:item][:price]}."
      end
    end
  end

  def total_cost
    total_price - get_discount
  end

private
  def get_discount
    sum = 0
    sum = total_price * 0.1 if total_price >= 60 
    sum +=1.5 if enough_hearts?
    return sum
  end

  def total_price
    total = 0
    basket.each do |prod|
      total += prod[:item][:price]
    end
    total
  end

  def count_hearts
    hearts = 0
    basket.each do |prod|
      if prod[:item][:code] == 0
        hearts += 1
      end
    end
    return hearts 
  end

  def enough_hearts?
    count_hearts >= 2
  end
  
end

require 'yaml'

class Checkout

attr_accessor :basket, :products, :promotions

def initialize
  @basket = []
  @products = YAML.load_file('./lib/product_list.yml')
  @promotions
end



end

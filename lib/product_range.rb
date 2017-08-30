require 'yaml'

class ProductRange

  attr_accessor :products

  def initialize
    @products = YAML.load_file('./lib/product_list.yml')
  end
end

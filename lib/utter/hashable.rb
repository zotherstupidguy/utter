module Hashable
  def self.included klass
    p Object.methods
    #(Object.instance_methods - klass.instance_methods).each do |method|
    (klass.methods - Object.methods).each do |method|
      p method
    end
  end
end

class Model
  include Hashable
  attr_accessor :title, :price
  def hack
  end
end

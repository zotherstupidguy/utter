module Services 
  module V1
    class Service < Utter::Model

      attr_accessor :title, :price
      index :title

    end
  end
end

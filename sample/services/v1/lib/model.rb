module Services 
  module V1
    class Service < Utter::Model
      attr_accessor :title, :price

      index :title

    end
  end
end

=begin

class Public
end

class Person
end

class Idea
 attr_accessor :graph, :granurality_level
end

class Graph
 attr_accessor :owner # public_view, private_view
end

class Manifastation
end

general_graph (generalized view of the idea)
personal_graph (personalized view of the idea)

=end

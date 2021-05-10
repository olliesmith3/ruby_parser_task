require 'list'

class Parser
  attr_reader :list
  
  def initialize(file)
    @file = file
  end

  def create_list
    @list = List.new
  end
end
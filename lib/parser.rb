require 'list'

class Parser
  attr_reader :list

  def initialize(file, list_class = List)
    @file = file
    @list_class = list_class
  end

  def create_list
    @list = @list_class.new
  end
end
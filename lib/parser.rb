require 'list'

class Parser
  attr_reader :list

  def initialize(file, list_class = List)
    @file = file
    @list_class = list_class
    @logs = Hash.new
  end

  def create_list
    File.foreach(@file) do |line| 
      split_line = line.split(" ")
      page_name, ip_address = split_line[0], split_line[1]  
      @logs[page_name] = [ip_address]
    end
    @list = @list_class.new(@logs)
  end
end
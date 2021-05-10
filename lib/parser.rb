# frozen_string_literal: true

require './lib/list'

class Parser
  attr_reader :list

  def initialize(file, list_class = List)
    @file = file
    @list_class = list_class
    @logs = {}
  end

  def create_list(is_unique = false)
    read_logs(is_unique)
    @list = @list_class.new(@logs)
    @list.print_visits
    reset_logs
  end

  private

  def read_logs(is_unique)
    File.foreach(@file) do |line|
      split_line = line.split(' ')
      page_name = split_line[0]
      ip_address = split_line[1]
      add_log(page_name, ip_address, is_unique)
    end
  end

  def add_log(page_name, ip_address, is_unique)
    if is_unique
      if @logs[page_name]
        @logs[page_name] << ip_address unless @logs[page_name].include?(ip_address)
      else
        @logs[page_name] = [ip_address]
      end
    elsif @logs[page_name]
      @logs[page_name] << ip_address
    else
      @logs[page_name] = [ip_address]
    end
  end

  def reset_logs
    @logs = {}
  end
end

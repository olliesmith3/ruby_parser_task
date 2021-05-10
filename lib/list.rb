# frozen_string_literal: true

class List
  attr_reader :logs

  def initialize(logs)
    @logs = logs
    @visits = []
  end

  def print_visits(is_unique = false)
    format_visits(is_unique)
    puts @visits.join
  end

  private

  def format_visits(is_unique)
    sorted_logs = @logs.sort_by { |_page_name, ip_addresses| -ip_addresses.length }
    sorted_logs.each do |page_name, ip_addresses|
      add_visit(page_name, ip_addresses, is_unique)
    end
  end

  def add_visit(page_name, ip_addresses, is_unique)
    plural = ip_addresses.length == 1 ? '' : 's'
    if is_unique
      @visits << "#{page_name} #{ip_addresses.length} unique visit#{plural} "
    else
      @visits << "#{page_name} #{ip_addresses.length} visit#{plural} "
    end
  end
end

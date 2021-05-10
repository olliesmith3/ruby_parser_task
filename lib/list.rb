class List
  attr_reader :logs

  def initialize(logs)
    @logs = logs
    @visits = []
  end

  def print_visits
    format_visits
    puts @visits.join
  end

  private

  def format_visits
    sorted_logs = @logs.sort_by { |page_name, ip_addresses| -ip_addresses.length }
    sorted_logs.each do |page_name, ip_addresses| 
      add_visit(page_name, ip_addresses)
    end
  end

  def add_visit(page_name, ip_addresses)
    plural = ip_addresses.length == 1 ? "" : "s"
    @visits << "#{page_name} #{ip_addresses.length} visit#{plural} "
  end
end
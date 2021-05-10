class List
  attr_reader :logs

  def initialize(logs)
    @logs = logs
    @visits = []
  end

  def print_visits
    @logs.each do |page_name, ip_addresses| 
      plural = ip_addresses.length == 1 ? "" : "s"
      @visits << "#{page_name} #{ip_addresses.length} visit#{plural} "
    end
    puts @visits.join
  end
end
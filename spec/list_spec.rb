# frozen_string_literal: true

require 'list'
describe List do
  describe '#print_visits' do
    it 'formats the logs into human readable format and then prints to the terminal' do
      logs = { '/help_page/1' => ['126.318.035.038'] }
      list = List.new(logs)
      expect { list.print_visits }.to output("/help_page/1 1 visit \n").to_stdout
    end

    it 'formats the logs into human readable format and then prints to the terminal. There are two logs to the same page' do
      logs = { '/help_page/1' => ['126.318.035.038', '929.398.951.889'] }
      list = List.new(logs)
      expect { list.print_visits }.to output("/help_page/1 2 visits \n").to_stdout
    end

    it 'formats the logs into human readable format and sorted by visit count and then prints to the terminal. There are three logs, two of them to the same page' do
      logs = { '/about' => ['061.945.150.735'], '/help_page/1' => ['126.318.035.038', '929.398.951.889'] }
      list = List.new(logs)
      expect { list.print_visits }.to output("/help_page/1 2 visits /about 1 visit \n").to_stdout
    end

    it 'formats the logs into human readable format and sorted by visit count and then prints to the terminal. There are four logs, three of them to the same page and one duplicate' do
      logs = { '/about' => ['061.945.150.735'],
               '/help_page/1' => ['126.318.035.038', '126.318.035.038', '929.398.951.889'] }
      list = List.new(logs)
      expect { list.print_visits }.to output("/help_page/1 3 visits /about 1 visit \n").to_stdout
    end
  end
end

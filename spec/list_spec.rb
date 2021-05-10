require 'list'
describe List do
  describe '#print_visits' do
    it 'formats the logs into human readable format and then prints to the terminal' do
      logs = {"/help_page/1"=>["126.318.035.038"]}
      list = List.new(logs)
      expect { list.print_visits }.to output("/help_page/1 1 visit \n").to_stdout
    end

    it 'formats the logs into human readable format and then prints to the terminal. There are two logs to the same page' do
      logs = {"/help_page/1"=>["126.318.035.038"], "/help_page/1"=>["929.398.951.889"]}
      list = List.new(logs)
      expect { list.print_visits }.to output("/help_page/1 2 visits \n").to_stdout
    end
  end
end
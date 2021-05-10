require 'parser'

describe 'parse the file provided and output a sorted list of the number of page visits. Non unique list.' do
  it 'formats the logs into human readable format and then prints to the terminal' do
    dir = File.dirname(__FILE__)
    file = File.open(File.join(dir, '../webserver.log'))
    parser = Parser.new(file)
    expect { parser.create_list }.to output("/about/2 90 visits /contact 89 visits /index 82 visits /about 81 visits /help_page/1 80 visits /home 78 visits \n").to_stdout
  end
end

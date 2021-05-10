require 'parser'

describe 'Gives response user would expect' do
  it 'Parse the file provided and output a sorted list of the number of page visits. Non unique list.' do
    dir = File.dirname(__FILE__)
    file = File.open(File.join(dir, '../webserver.log'))
    parser = Parser.new(file)
    expect { parser.create_list() }.to output("/about/2 90 visits /contact 89 visits /index 82 visits /about 81 visits /help_page/1 80 visits /home 78 visits \n").to_stdout
  end

  it 'Parse the file provided and output a sorted list of the number of page visits. Unique list.' do
    dir = File.dirname(__FILE__)
    file = File.open(File.join(dir, '../webserver.log'))
    parser = Parser.new(file)
    expect { parser.create_list(is_unique = true) }.to output("/help_page/1 23 visits /contact 23 visits /home 23 visits /index 23 visits /about/2 22 visits /about 21 visits \n").to_stdout
  end
end

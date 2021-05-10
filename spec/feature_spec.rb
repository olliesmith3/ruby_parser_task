# frozen_string_literal: true

require 'parser'

describe 'Gives response user would expect' do
  it 'Parse the file provided and output a sorted list of the number of page visits. Non unique list.' do
    dir = File.dirname(__FILE__)
    file = File.open(File.join(dir, '../webserver.log'))
    parser = Parser.new(file)
    expect do
      parser.create_list
    end.to output("/about/2 90 visits /contact 89 visits /index 82 visits /about 81 visits /help_page/1 80 visits /home 78 visits \n").to_stdout
  end

  it 'Parse the file provided and output a sorted list of the number of page visits. Unique list.' do
    dir = File.dirname(__FILE__)
    file = File.open(File.join(dir, '../webserver.log'))
    parser = Parser.new(file)
    expect do
      parser.create_list(is_unique = true)
    end.to output("/help_page/1 23 unique visits /contact 23 unique visits /home 23 unique visits /index 23 unique visits /about/2 22 unique visits /about 21 unique visits \n").to_stdout
  end

  it 'Can print both a unique list and a non unique list to the terminal' do
    dir = File.dirname(__FILE__)
    file = File.open(File.join(dir, '../webserver.log'))
    parser = Parser.new(file)
    expect do
      parser.create_list
    end.to output("/about/2 90 visits /contact 89 visits /index 82 visits /about 81 visits /help_page/1 80 visits /home 78 visits \n").to_stdout
    expect do
      parser.create_list(is_unique = true)
    end.to output("/help_page/1 23 unique visits /contact 23 unique visits /home 23 unique visits /index 23 unique visits /about/2 22 unique visits /about 21 unique visits \n").to_stdout
  end
end

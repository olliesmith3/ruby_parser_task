require './lib/parser.rb'

parser = Parser.new("webserver.log")
parser.create_list
parser.create_list(is_unique = true)
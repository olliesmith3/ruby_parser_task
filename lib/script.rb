# frozen_string_literal: true

require './lib/parser'

parser = Parser.new('webserver.log')
parser.create_list
parser.create_list(is_unique = true)

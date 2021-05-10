require 'parser'
describe Parser do
  let(:list_double) { double(:list) }
  let(:list_class_double) { double(:list_class, new: list_double) }

  describe '#create_list' do
    it 'creates a list' do
      dir = File.dirname(__FILE__)
      file = File.open(File.join(dir, 'test_logs_1.log'))
      parser = Parser.new(file, list_class_double)
      parser.create_list
      expect(parser.list).to eq(list_double)
    end
  end
end
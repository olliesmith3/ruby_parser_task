require 'parser'
describe Parser do
  let(:list_double) { double(:list, print_visits: nil) }
  let(:list_class_double) { double(:list_class, new: list_double) }

  describe '#create_list' do
    it 'creates a list' do
      dir = File.dirname(__FILE__)
      file = File.open(File.join(dir, 'test_logs_1.log'))
      parser = Parser.new(file, list_class_double)
      parser.create_list
      expect(parser.list).to eq(list_double)
    end

    it 'creates a list and the logs stored on that list are a hash containing the information in the file. The file has one row.' do
      dir = File.dirname(__FILE__)
      file = File.open(File.join(dir, 'test_logs_1.log'))
      parser = Parser.new(file)
      parser.create_list
      expect(parser.list.logs).to eq({"/help_page/1"=>["126.318.035.038"]})
    end

    it 'creates a list and the logs stored on that list are a hash containing the information in the file. The file has two visits to the same page.' do
      dir = File.dirname(__FILE__)
      file = File.open(File.join(dir, 'test_logs_2.log'))
      parser = Parser.new(file)
      parser.create_list
      expect(parser.list.logs).to eq({"/help_page/1"=>["126.318.035.038", "929.398.951.889"]})
    end

    it 'creates a list and the logs stored on that list are a hash containing the information in the file. The file has two visits to the same page from the same ip_address.' do
      dir = File.dirname(__FILE__)
      file = File.open(File.join(dir, 'test_logs_3.log'))
      parser = Parser.new(file)
      parser.create_list
      expect(parser.list.logs).to eq({"/help_page/1"=>["126.318.035.038", "126.318.035.038"]})
    end

    it 'creates a unique list and the logs stored on that list are a hash containing the information in the file. The file has one row.' do
      dir = File.dirname(__FILE__)
      file = File.open(File.join(dir, 'test_logs_3.log'))
      parser = Parser.new(file)
      parser.create_list(is_unique = true)
      expect(parser.list.logs).to eq({"/help_page/1"=>["126.318.035.038"]})
    end
  end
end
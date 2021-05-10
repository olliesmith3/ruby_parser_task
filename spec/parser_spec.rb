describe Parser do
  describe '#create_list' do
    it 'creates a list' do
      dir = File.dirname(__FILE__)
      file = File.open(File.join(dir, 'test_logs_1.log'))
      parser = Parser.new(file)
      parser.create_list
      expect(parser.list).to be_an_instance_of(List)
    end
  end
end
require File.expand_path(File.dirname(__FILE__) + '/../test_config.rb')

describe "Information Model" do
  it 'can construct a new instance' do
    @information = Information.new
    refute_nil @information
  end
end

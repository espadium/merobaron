require File.expand_path(File.dirname(__FILE__) + '/../test_config.rb')

describe "Item Model" do
  it 'can construct a new instance' do
    @item = Item.new
    refute_nil @item
  end
end

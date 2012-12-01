require File.expand_path(File.dirname(__FILE__) + '/../test_config.rb')

describe "Question Model" do
  it 'can construct a new instance' do
    @question = Question.new
    refute_nil @question
  end
end

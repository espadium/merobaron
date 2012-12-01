require File.expand_path(File.dirname(__FILE__) + '/../test_config.rb')

describe "Submission Model" do
  it 'can construct a new instance' do
    @submission = Submission.new
    refute_nil @submission
  end
end

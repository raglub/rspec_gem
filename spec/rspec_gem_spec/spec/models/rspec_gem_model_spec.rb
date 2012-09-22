require 'spec_helper'

describe RspecGemModel do
  it "should properly add new record into model" do
    RspecGemModel.create(name: "example")
    RspecGemModel.count.should eql(1)
  end
end

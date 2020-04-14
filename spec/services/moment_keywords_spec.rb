require 'spec_helper'

describe MomentKeywords do
  subject(:moment) {FactoryBot.build(:moment,
                                     name: "Test ADDICTION",
                                     why: "More testing content self-care.",
                                     fix: "Text tested is @Teachers!!") }


  it 'downcases words' do
    keywords = MomentKeywords.new(moment).extract_moment_keywords
    expect(keywords).to include("addiction")
  end
end



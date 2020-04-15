describe MomentKeywords do
  subject(:moment) {FactoryBot.build(:moment,
                                     categories: [build(:category, name: 'free', description: 'My description')],
                                     name: "Test ADDICTION",
                                     why: "More testing content self-care.",
                                     fix: "Text tested is @Teachers!!" )}

  let(:keywords) { MomentKeywords.new(moment).extract_moment_keywords }

  it 'downcases words' do
    expect(keywords).to include("addiction")
  end

  it 'removes hyphen from compound words' do
    expect(keywords).to include("self care")
  end

  it 'removes special characters' do
    expect(keywords).to include("teachers")
  end

  it 'returns an array of all the key words' do
    expect(keywords).to eq(
                            ["free", "my", "description", "test", "addiction", "more", "testing", "content", "self care",
                             "text", "tested", "is", "teachers"]
                        )
  end
end

# @moment.moods
# @moment.strategies



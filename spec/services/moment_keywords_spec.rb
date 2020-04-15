
describe MomentKeywords do
    let(:user) { create(:user) }
    subject(:moment) {FactoryBot.build(:moment,
                                       name: "Test ADDICTION",
                                       why: "More testing content self-care.",
                                       fix: "Text tested is @Teachers!!") }
    let(:keywords) { MomentKeywords.new(moment).extract_keywords }
    it 'downcases words' do
      expect(keywords).to include("addiction")
    end

    it 'separates hyphenated or underscored words' do
        expect(keywords).to include("self care")
    end

    it 'removes special characters' do
        expect(keywords).to include("teachers")
    end

    it 'returns an array of all the key words' do
        expect(keywords).to eq(
            ["test", "addiction", "more", "testing", "content", "self care", 
                "text", "tested", "is", "teachers"]
        )
    end
  end
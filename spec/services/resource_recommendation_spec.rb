
describe ResourceRecommendation do
    let(:user) { create(:user) }
    subject(:moment) {FactoryBot.build(:moment,
                                       name: "Test ADDICTION",
                                       why: "More testing content self-care.",
                                       fix: "Text tested is @Teachers!!") }
    let(:keywords) { MomentKeywords.new(moment).extract_keywords } 
    let(:resources) { ResourceRecommendation.new(moment).resources }

    it 'initiates the extraction of moment_keywords' do
        expect(keywords).to include("addiction")
    end

    it 'extracts all the resource keywords from tags' do
    end

    it 'separates hyphenated or underscored words' do
    end

    it 'matches all the moment_keywords with the resource keywords' do
    end

    it 'displays the links of resources based on matched keyword' do
    end

    it 'limits the display of links to three' do
    end
end
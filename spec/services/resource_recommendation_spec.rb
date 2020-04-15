
describe ResourceRecommendation do
    let(:user) { create(:user) }
    subject(:moment) {FactoryBot.build(:moment,
                                       name: "Test ADDICTION",
                                       why: "More testing content self-care.",
                                       fix: "Text tested is @Teachers!!") }
     
    let(:resources) { ResourceRecommendation.new(moment).resources }
    

    it 'initiates the extraction of moment_keywords' do
        expect(@moment_keywords).to eq(MomentKeywords.new(moment).extract_keywords)
    end

    it 'extracts all the resources' do
        available_resource = [ {
            "name"=> "Insight Timer",
            "link"=> "https://insighttimer.com",
            "tags"=> ["free", "meditation", "teachers", "self_care", "android", "ios"],
            "languages"=> ["en"]
        }  ]
        allow(JSON).to receive(:parse) { available_resource }
        expect(resources).to eq(available_resource)
    end

    it 'gets all the keywords from resource tags' do
    end

    it 'separates hyphenated or underscored words' do
    end

    it 'matches all the moment_keywords with the resource keywords' do
    end

    it 'does not display unmatched keyword links' do
    end

    it 'displays the links of resources based on matched keyword' do
    end

    it 'limits the display of links to three' do
    end
end
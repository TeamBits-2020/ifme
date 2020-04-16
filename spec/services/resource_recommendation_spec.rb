
describe ResourceRecommendation do
    let(:user) { create(:user) }
    subject(:moment) {FactoryBot.build(:moment,
                                       name: "Test ADDICTION",
                                       why: "More testing content self-care.",
                                       fix: "Text tested is SELF-INJURY@") }
     
    let(:matches) { ResourceRecommendation.new(moment).resources }
    describe 'testing .resource method for ResourceRecommendation class' do
        it 'returns recommended resources matched with moment keywords' do
            matched_resource = [ {
                "name"=> "Insight Timer",
                "link"=> "https://insighttimer.com",
                "tags"=> ["free", "meditation", "teachers", "self_care", "android", "ios"],
                "languages"=> ["en"]
            }  ]
            allow(JSON).to receive(:parse) { matched_resource }
            expect(matches).to eq(matched_resource)
        end

        it 'returns no recommended resources when no moment keywords match with tag keywords' do
            unmatched_resource = [ {
              "name"=> "Aloe Bud",
              "link"=> "https://aloebud.com",
              "tags"=> ["self-care","anonymous", "ios", "communities"],
              "languages"=> ["en"]
            }  ]
            allow(JSON).to receive(:parse) { unmatched_resource }
            expect(matches).not_to eq(unmatched_resource)
        end

        it 'gets all the keywords from resource tags' do
        end

        it 'separates hyphenated or underscored words the same as moment keywords' do
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
end
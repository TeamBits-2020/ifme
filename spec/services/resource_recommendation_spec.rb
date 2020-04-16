
describe ResourceRecommendation do
    let(:moment) {FactoryBot.build(:moment,
                                       name: "Test ADDICTION",
                                       why: "More testing content self-care.",
                                       fix: "Text tested is @Teachers!!") }
     
    subject(:recommended_resources) { ResourceRecommendation.new(moment).resources }
    describe 'test .resource method for ResourceRecommendation class' do
        it 'returns recommended resources matched with moment keywords' do
            matched_resource = [ {
                "name"=> "Insight Timer",
                "link"=> "https://insighttimer.com",
                "tags"=> ["testing"],
                "languages"=> ["en"]
            }  ]
            allow(JSON).to receive(:parse) { matched_resource }
            expect(recommended_resources).to eq(matched_resource)
        end

        it 'returns no recommended resources when no moment keywords match with tag keywords' do
            unmatched_resource = [ {
              "name"=> "Aloe Bud",
              "link"=> "https://aloebud.com",
              "tags"=> ["anonymous"],
              "languages"=> ["en"]
            }  ]
            allow(JSON).to receive(:parse) { unmatched_resource }
            expect(recommended_resources).not_to eq(unmatched_resource)
        end

        it 'matches underscored tags' do
            matched_resource = [ {
                "name"=> "Insight Timer",
                "link"=> "https://insighttimer.com",
                "tags"=> ["self_care"],
                "languages"=> ["en"]
            }  ]
            allow(JSON).to receive(:parse) { matched_resource }
            expect(recommended_resources).to eq(matched_resource)
        end

        it 'matches keywords with special characters' do
            matched_resource = [ {
                "name"=> "Insight Timer",
                "link"=> "https://insighttimer.com",
                "tags"=> ["teachers"],
                "languages"=> ["en"]
            }  ]
            allow(JSON).to receive(:parse) { matched_resource }
            expect(recommended_resources).to eq(matched_resource)
        end

    end
end

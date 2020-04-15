describe ResourceRecommendation do
  subject(:moment) {FactoryBot.build(:moment,
                                     name: "TEACHERS",
                                     why: "text",
                                     fix: "text" )}

  let(:resources) { ResourceRecommendation.new(moment).resources}

  describe "A test for resources method from ResourceRecommendation class" do
    it "returns recommended resources based on moment keywords" do
      available_resource = [ {
                             "name"=> "Insight Timer",
                             "link"=> "https://insighttimer.com",
                             "tags"=> ["free", "meditation", "teachers", "self_care", "android", "ios"],
                             "languages"=> ["en"]
                         }  ]
      allow(JSON).to receive(:parse) { available_resource }
      expect(resources).to eq(available_resource)
    end
  end
end

describe ResourceRecommendation do
  subject(:moment) {FactoryBot.build(:moment,
                                     name: 'SELF-INJURY@',
                                     why: 'text',
                                     fix: 'text' )}

  let(:resources) { ResourceRecommendation.new(moment).resources}

  describe 'A test for resources method from ResourceRecommendation class' do
    it 'returns recommended resources based on moment keywords' do
      available_resource = [ {
                                   'name'=> "LifeSIGNS: Self Injury Guidance & Network Support (UK)",
                                   'link'=> "http://www.lifesigns.org.uk/",
                                   'tags'=> ["self_injury", "blog", "books", "communities"],
                                   'languages'=> ["en"]
                               },
                             {
                                 'name'=> "Self-Injury Outreach and Support (Canada)",
                                 'link'=> "http://sioutreach.org/",
                                 'tags'=> ["self_injury", "education"],
                                 'languages'=> ["en"]
                             }]
      allow(JSON).to receive(:parse) { available_resource }
      expect(resources).to eq(available_resource)
    end

    it 'does not return any matched resources' do
      available_resource2 = [ {
                                  'name'=> 'Aloe Bud',
                                  'link'=> 'https://aloebud.com',
                                  'tags'=> ['self_care', 'anonymous', 'ios', 'communities'],
                                  'languages'=> ['en']
                                } ]
      allow(JSON).to receive(:parse) { available_resource2 }
      expect(resources).not_to eq(available_resource2)
    end
  end
end

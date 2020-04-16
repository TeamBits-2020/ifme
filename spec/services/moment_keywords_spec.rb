describe MomentKeywords do
    let(:user) { create(:user) }
    let(:categories) do
        [FactoryBot.build(
          :category,
          name: "category name",
          description: "category description."
        )]
      end
    let(:moods) do
        [FactoryBot.build(
          :mood,
          name: "mood-name",
          description: "mood-description."
        )]
    end  
    let(:strategies) do
        [FactoryBot.build(
          :strategy,
          name: "strategy-name",
          description: "strategy-description."
        )]
    end 
    
    let(:moment) {FactoryBot.build(:moment,
                                       name: "Test ADDICTION",
                                       why: "More testing content self-care.",
                                       fix: "Text tested is @Teachers!!",
                                       categories: categories,
                                       moods: moods,
                                       strategies: strategies
                                       ) }
    subject(:keywords) { MomentKeywords.new(moment).extract_keywords }
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
            ["category", "name", "category", "description", "mood name", 
                "mood description", "strategy name", "strategy description",
                "test", "addiction", "more", "testing", "content", 
                "self care", "text", "tested", "is", "teachers"]
        )
    end
  end
  

class ResourceRecommendation
    
    def initialize(moment)
      @moment = moment
    end

    def resources
      all_resources = JSON.parse(File.read(Rails.root.join('doc', 'pages', 'resources.json')))
      matched_resources = []
      moment_keywords = []
      moment_name = @moment.name.split
      moment_why = @moment.why.split
      moment_fix = @moment.fix.split
      @moment.categories.each do |category|
        moment_keywords.push(category['name'].split)
      end
      @moment.categories.each do |category|
        category_description = category['description']
        moment_keywords.push(category_description.split)
      end
      @moment.moods.each do |mood|
        moment_keywords.push(mood['name'].split)
      end
      @moment.moods.each do |mood|
        mood_description = mood['description']
        moment_keywords.push(mood_description.split)
      end
      @moment.strategies.each do |strategy|
        moment_keywords.push(strategy['name'].split)
      end
      @moment.strategies.each do |strategy|
        strategy_description = strategy['description']
        moment_keywords.push(strategy_description.split)
      end
      moment_keywords.push(moment_name, moment_why, moment_fix)
      moment_keywords = moment_keywords.flatten
      moment_keywords = moment_keywords.map(&:downcase)
      all_resources.each do |resource|
        unless (resource['tags'] & moment_keywords).empty?
          matched_resources.push(resource)
        end
      end
      matched_resources
    end

end
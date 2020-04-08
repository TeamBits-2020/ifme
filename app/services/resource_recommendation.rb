
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
        category_description = ActionController::Base.helpers.strip_tags(category['description'])
        moment_keywords.push(category_description.split)
      end
      @moment.moods.each do |mood|
        moment_keywords.push(mood['name'].split)
      end
      @moment.moods.each do |mood|
        mood_description = ActionController::Base.helpers.strip_tags(mood['description'])
        moment_keywords.push(mood_description.split)
      end
      @moment.strategies.each do |strategy|
        moment_keywords.push(strategy['name'].split)
      end
      @moment.strategies.each do |strategy|
        strategy_description = ActionController::Base.helpers.strip_tags(strategy['description'])
        moment_keywords.push(strategy_description.split)
      end
      moment_keywords.push(moment_name, moment_why, moment_fix)
      moment_keywords = moment_keywords.flatten
      moment_keywords = moment_keywords.map(&:downcase)
      moment_keywords.each do |keyword|
        keyword.gsub!(/([_@#!%()\-=;><,{}\~\[\]\.\/\?\"\*\^\$\+\-]+)/, ' ')
      end
      all_resources.each do |resource|
        resource_tags = resource['tags']
        resource_tags.each do |tag|
            tag.gsub!(/([_@#!%()\-=;><,{}\~\[\]\.\/\?\"\*\^\$\+\-]+)/, ' ')
        end
        unless (resource_tags & moment_keywords).empty?
          matched_resources.push(resource)
        end
      end
      matched_resources
    end

end
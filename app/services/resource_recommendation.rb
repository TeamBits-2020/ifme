# frozen_string_literal: true

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
      moment_keywords.push(category['name'])
    end
    @moment.categories.each do |mood|
      moment_keywords.push(mood['name'])
    end
    @moment.strategies.each do |strategy|
      moment_keywords.push(strategy['name'])
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

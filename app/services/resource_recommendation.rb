# frozen_string_literal: true
class ResourceRecommendation
  def initialize(moment)
    @moment = moment
  end

  def all_resources
    JSON.parse(File.read(Rails.root.join('doc', 'pages', 'resources.json')))
  end

  def moment_name
    @moment.name.split
  end

  def html_clean(str)
    ActionController::Base.helpers.strip_tags(str)
  end

  def moment_why
    html_clean(@moment.why).split
  end

  def moment_fix
    html_clean(@moment.fix).split
  end

  def resources
    matched_resources = []
    moment_keywords = []
    @moment.categories.each do |category|
      moment_keywords.push(category['name'].split,
                           html_clean(category['description']).split)
    end
    @moment.moods.each do |mood|
      moment_keywords.push(mood['name'].split,
                           html_clean(mood['description']).split)
    end
    @moment.strategies.each do |strategy|
      moment_keywords.push(strategy['name'].split,
                           html_clean(strategy['description']).split)
    end
    moment_keywords.push(moment_name, moment_why, moment_fix)
    moment_keywords = moment_keywords.flatten
    moment_keywords.each do |keyword|
      keyword.gsub!(%r{([_@#!%()\-=;><,{}\~\[\]\./\?\"\*\^\$\+\-]+)}, '')
    end
    moment_keywords = moment_keywords.map(&:downcase)
    all_resources.each do |resource|
      resource_tags = resource['tags'].map do |tag|
        tag.split('_')
      end
      unless (resource_tags.flatten & moment_keywords).empty?
        matched_resources.push(resource)
      end
    end
    matched_resources
  end
end

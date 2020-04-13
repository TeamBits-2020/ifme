# frozen_string_literal: true
class ResourceRecommendation
  def initialize(moment)
    @moment = moment
    @moment_keywords = []
    @matched_resources = []
  end

  def get_keywords(array)
    array.each do |item|
      @moment_keywords.push(item['name'].split,
                            html_clean(item['description']).split)
    end
  end

  def modify_keywords
    @moment_keywords = @moment_keywords.flatten
    @moment_keywords.each do |keyword|
      keyword.gsub!(%r{([_@#!%()\-=;><,{}\~\[\]\./\?\"\*\^\$\+\-]+)}, '')
    end
    @moment_keywords = @moment_keywords.map(&:downcase)
  end

  def match_keywords
    all_resources.each do |resource|
      resource_tags = resource['tags'].map do |tag|
        tag.split('_')
      end
      unless (resource_tags.flatten & @moment_keywords).empty?
        @matched_resources.push(resource)
      end
    end
  end

  def resources
    get_keywords(@moment.categories)
    get_keywords(@moment.moods)
    get_keywords(@moment.strategies)
    @moment_keywords.push(moment_name, moment_why, moment_fix)
    modify_keywords
    match_keywords
    @matched_resources
  end

  private

  def all_resources
    JSON.parse(File.read(Rails.root.join('doc/pages/resources.json')))
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
end

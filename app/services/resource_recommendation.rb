# frozen_string_literal: true

class ResourceRecommendation
  def initialize(moment)
    @moment = moment
    @moment_keywords = []
  end

  def resources
    matched_resources = []
    extract_moment_keywords
    @moment_keywords = @moment_keywords.flatten
    @moment_keywords = @moment_keywords.each do |keyword|
      keyword.gsub!(%r{([_@#!%()\-=;><,{}\~\[\]\./\?\"\*\^\$\+\-]+)}, '')
    end
    downcase_keywords
    all_resources.each do |resource|
      tags = resource['tags'].map do |tag|
        tag.split('_')
      end
      unless (tags.flatten & @moment_keywords).empty?
        matched_resources.push(resource)
      end
    end
    matched_resources
  end

  private

  def all_resources
    JSON.parse(File.read(Rails.root.join('doc', 'pages', 'resources.json')))
  end

  def extract_moment_keywords
    extract_category_keywords
    extract_mood_keywords
    extract_strategy_keywords
    extract_moment_name
    extract_moment_why
    extract_moment_fix
  end

  def extract_moment_name
    @moment_keywords.push(@moment.name.split)
  end

  def extract_moment_why
    @moment_keywords.push(strip_tags(@moment.why).split)
  end

  def extract_moment_fix
    @moment_keywords.push(strip_tags(@moment.fix).split)
  end

  def strip_tags(str)
    ActionController::Base.helpers.strip_tags(str)
  end

  def extract_category_keywords
    @moment.categories.each do |category|
      @moment_keywords.push(category['name'].split,
                            strip_tags(category['description']).split)
    end
  end

  def extract_mood_keywords
    @moment.moods.each do |mood|
      @moment_keywords.push(mood['name'].split,
                            strip_tags(mood['description']).split)
    end
  end

  def extract_strategy_keywords
    @moment.strategies.each do |strategy|
      @moment_keywords.push(strategy['name'].split,
                            strip_tags(strategy['description']).split)
    end
  end

  def downcase_keywords
    @moment_keywords = @moment_keywords.map(&:downcase)
  end
end

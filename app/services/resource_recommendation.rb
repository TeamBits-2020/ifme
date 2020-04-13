# frozen_string_literal: true

class ResourceRecommendation
  def initialize(moment)
    @moment = moment
    @moment_keywords = []
  end

  def resources
    extract_moment_keywords
    @moment_keywords = @moment_keywords.flatten
    remove_special_chars
    downcase_keywords
    all_resources.select do |resource|
      tags = resource['tags'].flat_map do |tag|
        tag.split('_')
      end
      (tags & @moment_keywords).any?
    end
  end

  private

  def all_resources
    JSON.parse(File.read(Rails.root.join('doc', 'pages', 'resources.json')))
  end
end

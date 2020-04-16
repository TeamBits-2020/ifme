# frozen_string_literal: true
class ResourceRecommendation
  def initialize(moment)
    @moment = moment
  end

  def resources
    @moment_keywords = MomentKeywords.new(@moment).extract_keywords
    match_keywords
  end

  private

  def all_resources
    JSON.parse(File.read(Rails.root.join('doc/pages/resources.json')))
  end

  def match_keywords
    all_resources.select do |resource|
      resource_tags = resource['tags'].flat_map do |tag|
        tag.tr('_', ' ')
      end
      (resource_tags & @moment_keywords).any?
    end
  end
end

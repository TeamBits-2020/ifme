# frozen_string_literal: true

class ResourceRecommendations
  def initialize(moment)
    @moment = moment
    @moment_keywords = []
  end

  def call
    @moment_keywords = MomentKeywords.new(@moment).call
    all_resources.select do |resource|
      tags = resource['tags'].flat_map do |tag|
        tag.tr('_', '-')
      end
      (tags & @moment_keywords).any?
    end
  end

  def matched_tags
    @moment_keywords = MomentKeywords.new(@moment).call
     resource_tags = all_resources.flat_map do |resource|
       resource['tags'].map do |tag|
         tag.tr('_', '-')
       end
     end
     matched_tags = (@moment_keywords & resource_tags)
  end

  private

  def all_resources
    # JSON.parse(File.read(Rails.root.join('doc', 'pages', 'resources.json')))
    resources = JSON.parse(File.read('doc/pages/resources.json'))
    resources.each do |item|
      item['tags'].map! { |tag| I18n.t("pages.resources.tags.#{tag}") }
      item['languages'].map! { |language| I18n.t("languages.#{language}") }
    end
    resources
  end
end

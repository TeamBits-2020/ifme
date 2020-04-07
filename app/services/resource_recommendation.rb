# frozen_string_literal: true

class ResourceRecommendation
  def initialize(moment)
    @moment = moment
  end

  def resources
    resources = JSON.parse(File.read(Rails.root.join('doc', 'pages', 'resources.json')))
  end




end

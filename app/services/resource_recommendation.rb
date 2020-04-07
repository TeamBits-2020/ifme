# frozen_string_literal: true

class ResourceRecommendation
  def initialize(moment)
    @moment = moment
  end

  def parse_json()
    JSON.parse(File.read(Rails.root.join('doc', 'pages', 'resources.json')))
  end


end

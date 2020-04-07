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
    moment_keywords.push(moment_name)
    moment_why = @moment.why.split
    moment_keywords.push(moment_why)
    moment_fix = @moment.fix.split
    moment_keywords.push(moment_fix)
    moment_keywords = moment_keywords.flatten
    all_resources.each do |resource|
      unless (resource['tags'] & moment_keywords).empty?
        matched_resources.push(resource)
      end
    end
    matched_resources
  end
  end

#the mathcing happen with just one word and in alphabetical order
# flatten puts it in order

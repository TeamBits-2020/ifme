class ResourceRecommendation

    def initialize(moment)
      @moment = moment
    end

    def resources
      resources = JSON.parse(File.read(Rails.root.join('doc', 'pages', 'resources.json')))
      all_resources = JSON.parse(File.read(Rails.root.join('doc', 'pages', 'resources.json')))
      matched_resources = []
      moment_name = @moment.name.split
      all_resources.each do |resource|
        unless (resource['tags'] & moment_name).empty?
          matched_resources.push(resource)
        end
      end
      matched_resources
    end

end
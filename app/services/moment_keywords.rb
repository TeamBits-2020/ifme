# frozen_string_literal: true
class MomentKeywords
  def initialize(moment)
    @moment = moment
    @moment_keywords = []
  end

  def extract_keywords
    get_keywords(@moment.categories)
    get_keywords(@moment.moods)
    get_keywords(@moment.strategies)
    @moment_keywords.push(moment_name, moment_why, moment_fix)
    modify_keywords
  end

  private

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

  def get_keywords(array)
    array.each do |item|
      @moment_keywords.push(item['name'].split,
                            html_clean(item['description']).split)
    end
  end

  def modify_keywords
    @moment_keywords = @moment_keywords.flatten
    @moment_keywords.each do |keyword|
      keyword.gsub!('-' || '_', ' ')
      keyword.gsub!(/[^\p{Alpha} -]/, '')
    end
    @moment_keywords = @moment_keywords.map(&:downcase)
  end
end

# frozen_string_literal: true

class MomentKeywords
  def initialize(moment)
    @moment = moment
    @moment_keywords = []
  end

  private

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

  def remove_special_chars
    @moment_keywords = @moment_keywords.each do |keyword|
      keyword.gsub!(/[^a-z]+/i, '')
    end
  end
end

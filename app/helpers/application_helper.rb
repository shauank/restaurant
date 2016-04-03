module ApplicationHelper
  def generate_slug(model)
    ActiveSupport::Inflector.transliterate("#{model.name} #{model.created_at.to_date}").
                              strip.
                              gsub("-","").
                              gsub(" ","-").
                              gsub(":","").
                              downcase
  end
end

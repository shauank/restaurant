class Reservation < ActiveRecord::Base
  belongs_to :user
  belongs_to :detail
  
  before_validation :generate_slug
  validates :slug, presence: true, uniqueness: true
  
  def to_param
    self.slug
  end
  
  def can_confirm?
    self.status == 'Submitted' 
  end
  
  def can_edit?
    self.status != 'Success' 
  end
  
  def generate_slug
    if (self.slug.blank?)
      begin
        count = (count ||= 0) + 1        
        new_slug = ActiveSupport::Inflector.transliterate("#{detail.slug} #{reserved_date} #{count}").
                              strip.
                              gsub("-","").
                              gsub(" ","-").
                              gsub(":","").
                              gsub(",","").
                              gsub("'","").                                                            
                              downcase

      end until (new_slug and !(reservation = Reservation.find_by_slug(new_slug)))
      self.slug = new_slug
    end
  end
end

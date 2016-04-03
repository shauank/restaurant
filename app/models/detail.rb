class Detail < ActiveRecord::Base
  
  has_attached_file :photo,
                    styles: { medium: "300x300>", thumb: "100x100>", small: "50*50>" },
                    default_url: ":rails_root/public/assets/products/:id/:style/:basename.:extension"
                 
  has_many :addresses
  has_many :reservations
  has_and_belongs_to_many :cuisines
  has_and_belongs_to_many :food_types
  
  accepts_nested_attributes_for :reservations
  
  before_validation :generate_slug
  validates :slug, presence: true, uniqueness: true

  
  
  

  validates_attachment_content_type :photo, content_type: ['image/jpeg', 'image/png']
  validates_attachment_size :photo, less_than: 5.megabytes
  CURRENT_TIME = Time.now
 # 
  # scope :by_hours_from, ->(hours_from) { where('extract(hour from hours_from) > :hour', { hour: hours_from }) }
#generate_scope

  def time_duration
    duration_ary = []
    [CURRENT_TIME].tap { 
            |array| array << round_to(array.last) + 30.minutes while array.last < (round_to(hours_to) - 1.hour) 
    }.each{|time|  duration_ary << "#{time.hour}:#{time.min}"}
  end 
  
  def round_to(min=15)
    Time.at((CURRENT_TIME.to_r/min*60).round  * (min*60))
  end
  
  def to_param
    self.slug
  end
  
  def generate_slug
    unless self.slug
      begin
        count = (count ||= 0) + 1 
        new_slug = ActiveSupport::Inflector.transliterate("#{name} #{count}").
                                  strip.
                                  gsub("-","").
                                  gsub(" ","-").
                                  gsub(":","").
                                  gsub(",","").
                                  gsub("'","").                                                            
                                  downcase
      end until (new_slug and !(detail = Detail.find_by_slug(new_slug)))
      self.slug = new_slug
    end
  end
end
 
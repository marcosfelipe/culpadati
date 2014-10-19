class Post < ActiveRecord::Base

  validates :title, :author, presence:  true

  has_attached_file :image, :styles => {:thumb => '100x100>', :original => '500x500>'}

  validates_attachment :image, :presence => true,
                       :content_type => { :content_type => "image/gif" },
                       :size => { :in => 0..5.megabytes }

  def self.sort_date_desc
    order('created_at desc')
  end


  def self.get_random
    order('random()').first
  end

  def self.hint
    where('hint = "t" ');
  end

  def self.ultimate
    where('hint = "f" ')
  end

end

class Tag < ActiveRecord::Base
  has_and_belongs_to_many :articles

  def <=>(other)
    name <=> other.name
  end

  def to_s
    name
  end
  
  def Tag.find_for_tagbar
    # TODO: limit to most popular tags if this gets too large
    Tag.all.sort
  end

end

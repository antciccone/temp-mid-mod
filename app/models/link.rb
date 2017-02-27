class Link < ApplicationRecord

  has_many :reads,  dependent: :destroy
  belongs_to :user

  scope :hot, -> {
    select('links.url as url')
      .joins('join reads on reads.link_id = links.id')
      .where('reads.created_at > ?', Time.now - 1.day)
      .group("links.url")
      .order('count("reads".id) DESC').limit(10)
  }


  def self.all_links
    links = where(updated_at: (Time.now - 24.hours)..Time.now)
    grouped = links.group_by{|link| link.url}
    grouped.values.map {|similiar_links| similiar_links.first}.reverse
  end
end

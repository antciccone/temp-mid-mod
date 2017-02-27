class Link < ApplicationRecord


  def self.top_ten
    # links = where(read: true)
    links = where(updated_at: (Time.now - 24.hours)..Time.now)
    grouped = links.group_by{|link| link.url}
    grouped.values.map {|similiar_links| similiar_links.first}
  end

  has_many :reads,  dependent: :destroy
  belongs_to :user
end

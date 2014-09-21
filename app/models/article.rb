class Article < ActiveRecord::Base
  extend FriendlyId
  friendly_id :title, use: :slugged

  has_many :attachments
  accepts_nested_attributes_for :attachments, reject_if: :all_blank, allow_destroy: true

  scope :published, -> { where(published: true) }

  def summary
    html = Nokogiri::HTML(body)
    html.css("blockquote").first
  end
end

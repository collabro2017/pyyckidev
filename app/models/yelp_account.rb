class YelpAccount < ActiveRecord::Base
  belongs_to :office
  has_many :reviews

  after_create :pull_yelp_account_details!, if: :external_id
  after_create :pull_yelp_reviews!, if: :external_id

  def url=(url_string)
    # https://www.yelp.com/biz/skoulas-dds-san-francisco?adjust_creative=VUQQy5XBcV2A0mshOam9DA&utm_campaign=yelp_api_v3&utm_medium=api_v3_business_lookup&utm_source=VUQQy5XBcV2A0mshOam9DA
    return unless url_string.present?
    self.external_id = url_string.match(/biz\/((\w|-)*)(\z|\?{1})/)[1]
    self[:url] = url_string
  end

  def client
    @client ||= Yelp.client
  end

  private

  def pull_yelp_account_details!
    response          = client.business(external_id).business
    self.raw_response = response.as_json
    self.rating       = response.rating
    self.review_count = response.review_count
    self.name         = response.name
    save
  end

  def pull_yelp_reviews!
    response = Yelp.client.reviews(external_id).reviews
    response.each do |review|
      self.reviews.create(
        office: office,
        rating: review.rating,
        text: review.text,
        url: review.url,
        user_info: review.user,
        posted_at: review.time_created,
        raw_response: review.as_json
      )
    end
  end
end
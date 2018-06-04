class Review < ActiveRecord::Base
  belongs_to :yelp_account
  belongs_to :office

  def user_name
    user_info['name']
  end

  def user_image
    user_info['image_url']
  end

  def rating_in_words
    "#{ rating.to_i }#{ "_half" if ((rating - rating.to_i) > 0) }"
  end
end
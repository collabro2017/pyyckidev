class Employee < ActiveRecord::Base
  belongs_to :user
  belongs_to :office

  validates :user, presence: true, uniqueness: { scope: :office }
  validates :office, presence: true

end

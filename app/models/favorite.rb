class Favorite < ApplicationRecord
  belongs_to :user, optional: true
  belongs_to :books, optional: true
end

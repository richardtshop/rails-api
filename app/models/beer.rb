class Beer < ApplicationRecord
  belongs_to :brewery
  before_save :custom_before_save

  validates(
    :name,
    presence: true,
    uniqueness: {
      case_sensitive: false ,
      scope: [:brewery_id]
    }
  )
  validates(
    :style,
    presence: true
  )
  validates(
    :ibu,
    presence: true,
    numericality: true,
  )
  validates(
    :abv,
    presence: true

    )
  validates(
    :brewery_id,
    presence: true,
    )

  private




  def custom_before_save
    name.downcase!
  end
end

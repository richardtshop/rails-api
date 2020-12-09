class Brewery < ApplicationRecord
  before_save :custom_before_save

  VALID_URL_REGEX = URI::DEFAULT_PARSER.regexp[:ABS_URI]

  validates(
    :name,
    presence: true,
    uniqueness: { case_sensitive: false }
  )
  validates(
    :address,
    presence: true
  )
  validates(
    :city,
    presence: true
  )
  validates(
    :taproom,
    inclusion: { in: [true, false] }
    )
  validates(
    :restaurant,
    inclusion: { in: [true, false] }
    )
  validates(
    :website,
    presence: true,
    uniqueness: { case_sensitive: false },
    format: { with: VALID_URL_REGEX },
  )

  private

  def custom_before_save
    name.downcase!
    website.downcase!
  end
end

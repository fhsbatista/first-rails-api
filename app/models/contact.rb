class Contact < ApplicationRecord
  belongs_to :kind
  has_many :phones

  def as_json(options = {})
    formatted_birthdate = I18n.l(self.birthdate)
    json = super(options)
    json[:birthdate] = formatted_birthdate
    json
  end
end

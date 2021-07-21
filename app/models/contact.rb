class Contact < ApplicationRecord
  belongs_to :kind
  has_many :phones

  def birthdate
    I18n.l(self[:birthdate])
  end

  def as_json(options = {})
    super(options).merge ({ greeting: I18n.t(:hello) })
  end
end

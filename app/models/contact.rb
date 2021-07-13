class Contact < ApplicationRecord
  belongs_to :kind

  def author
    "Fernando Batista"
  end

  def as_json(options = {})
    super(methods: :author, root: true)
  end
end

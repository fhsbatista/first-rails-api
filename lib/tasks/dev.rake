namespace :dev do
  desc "Configura o ambiente de desenvolvimento"
  task setup: :environment do
    create_kinds
    create_contacts
    create_phones_and_on_contacts
  end

  def create_kinds
    puts "Cadastrando os tipos de contatos ..."

    kinds = ["Amigo", "Comercial", "Conhecido"]

    kinds.each do |kind|
      Kind.create!(
        description: kind,
      )
    end

    puts "Tipos de Contatos cadastrados com sucesso"
  end

  def create_contacts
    puts "Cadastrando os contatos ..."
    100.times do |i|
      Contact.create!(
        name: Faker::Name.name,
        email: Faker::Internet.email,
        birthdate: Faker::Date.between(from: 65.years.ago, to: 18.years.ago),
        kind: Kind.all.sample,
      )
    end
    puts "Contatos cadastrados com sucesso"
  end

  def create_phones_and_on_contacts
    puts "Cadastrando os telefones..."
    Contact.all.each do |contact|
      Random.rand(5).times do |i|
        phone = Phone.create!(number: Faker::PhoneNumber.cell_phone, contact: contact)
        contact.phones << phone
        contact.save!
      end
    end
    puts "Telefones cadastrados com sucesso"
  end
end

require 'faker'

module Factory

    # Geração de massa de dados dinâmica.
    class Dynamic

        # Retorna um Hash com 'email' e 'message'.
        def self.valid_data_form_contact_us
            {
                email: Faker::Internet.email,
                message: Faker::Lorem.paragraph(sentence_count: 10)
            }
        end

        # Retorna um Hash com 'quantity' (número inteiro aleatório de 1 a 10).
        def self.valid_product_quantity
            {
                quantity: Faker::Number.between(from: 1, to: 10)
            }
        end

        # Retorna um Hash com 'cardholder_name', 'card_number' e 'card_cvv.
        def self.valid_data_form_credit_card
            {
                cardholder_name: Faker::Name.name,
                card_number: Faker::Number.number(digits: 13),
                card_cvv: Faker::Number.number(digits: 4)
            }
        end
    end
end

require 'faker'

module Factory

    # Geração de massa de dados dinâmica.
    class Dynamic
        def self.valid_data_form
            {
                first_name: Faker::Name.first_name,
                last_name: Faker::Name.last_name,
                email: Faker::Internet.email,
                address: Faker::Address.street_address,
                city: Faker::Address.city,
                state: Faker::Address.state,
                zip_code: Faker::Address.zip_code,
                phone: Faker::Number.number(digits: 11),
                ssn: Faker::IDNumber.valid,
                username: Faker::Internet.username,
                password: Faker::Internet.password(min_length: 8, max_length: 12, special_characters: true),
                password_two: Faker::Internet.password(min_length: 11, max_length: 13, special_characters: true),
                transfer_amount: Faker::Number.number(digits: 2)
            }
        end

        def self.special_character_form
            {
                first_name: Faker::Internet.password(min_length: 8, max_length: 12, special_characters: true),
                last_name: Faker::Internet.password(min_length: 8, max_length: 12, special_characters: true),
                address: Faker::Internet.password(min_length: 8, max_length: 12, special_characters: true),
                city: Faker::Internet.password(min_length: 8, max_length: 12, special_characters: true),
                state: Faker::Internet.password(min_length: 8, max_length: 12, special_characters: true),
                zip_code: Faker::Internet.password(min_length: 8, max_length: 12, special_characters: true),
                phone: Faker::Internet.password(min_length: 8, max_length: 12, special_characters: true),
                ssn: Faker::Internet.password(min_length: 8, max_length: 12, special_characters: true),
                username: Faker::Internet.password(min_length: 8, max_length: 12, special_characters: true),
                password: Faker::Internet.password(min_length: 8, max_length: 12, special_characters: true),
                transfer_amount: Faker::Internet.password(min_length: 3, max_length: 5, special_characters: true)
            }
        end

        def self.only_numbers_form
            {
                first_name: Faker::Number.number(digits: 10),
                last_name: Faker::Number.number(digits: 10),
                address: Faker::Number.number(digits: 10),
                city: Faker::Number.number(digits: 10),
                state: Faker::Number.number(digits: 10),
                zip_code: Faker::Number.number(digits: 10),
                phone: Faker::Number.number(digits: 10),
                ssn: Faker::Number.number(digits: 10),
                username: Faker::Number.number(digits: 10),
                password: Faker::Number.number(digits: 10)
            }
        end
    end
end

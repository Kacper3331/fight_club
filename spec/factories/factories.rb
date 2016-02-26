FactoryGirl.define do
    factory :first_skill, class: Skill, aliases: [:first] do
      id 1
      name 'First Skill'
      level 3
      fighter_id 1
      fighter
    end

    factory :second_skill, class: Skill, aliases: [:second] do
      id 2
      name 'Second Skill'
      level 3
      fighter_id 1
      fighter
    end


    factory :third_skill, class: Skill, aliases: [:third] do
      id 3
      name 'Third Skill'
      level 3
      fighter_id 1
      fighter
    end

    factory :fighter, aliases: [:fighterss] do
      id 1
      firstname 'Adam'
      lastname 'Nowak'
      avatar_file_name { 'test.jpg' }
      avatar_content_type { 'image/pdf' }
      avatar_file_size { 1024 }
    end

    factory :second_fighter, class: Fighter do
      id 2
      firstname 'Adam'
      lastname 'Nowak'
      avatar_file_name { 'test.jpg' }
      avatar_content_type { 'image/pdf' }
      avatar_file_size { 1024 }
    end

    factory :fight do
      first_fighter_id 1
      second_fighter_id 2
      association :fighters, factory: :fighter
    end


  # factory :match do
  #   first_player_score 10
  #   second_player_score 8
  #   date "2015-03-25"
  #   association :players, factory: :player
  # end
end

FactoryGirl.define do
  factory :game do
    trait :with_board do
      before(:create) { |game| game.define_singleton_method(:generate_board){} }
      board [[:h, :u, :g, :t, :w],
             [:p, :r, :e, :a, :s],
             [:s, :a, :t, :c, :r],
             [:t, :x, :n, :i, :a],
             [:r, :p, :d, :p, :o]]
    end
  end
end

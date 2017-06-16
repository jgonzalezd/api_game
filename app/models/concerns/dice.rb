module Dice
  extend ActiveSupport::Concern

  def self.shake
    [
      %i(a a a f r s).sample, #1
      %i(a a e e e e).sample, #2
      %i(a a f i r s).sample, #3
      %i(a d e n n n).sample, #4
      %i(a e e e e m).sample, #5
      %i(a e e g m u).sample, #6
      %i(a e g m n n).sample, #7
      %i(a f i r s y).sample, #8
      %i(b j k q x z).sample, #9
      %i(c c e n s t).sample, #10
      %i(c e i i l t).sample, #11
      %i(c e i l p t).sample, #12
      %i(c e i p s t).sample, #13
      %i(d d h n o t).sample, #14
      %i(d h h l o r).sample, #15
      %i(d h l n o r).sample, #16
      %i(d h l n o r).sample, #17
      %i(e i i i t t).sample, #18
      %i(e m o t t t).sample, #19
      %i(e n s s s u).sample, #20
      %i(f i p r s y).sample, #21
      %i(g o r r v w).sample, #22
      %i(i p r r r y).sample, #23
      %i(n o o t u w).sample, #24
      %i(o o o t t u).sample, #25
    ].shuffle
  end
end

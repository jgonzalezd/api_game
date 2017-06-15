module Dice
  def self.shake
    [
      %i(a a a f r s).shuffle, #1
      %i(a a e e e e).shuffle, #2
      %i(a a f i r s).shuffle, #3
      %i(a d e n n n).shuffle, #4
      %i(a e e e e m).shuffle, #5
      %i(a e e g m u).shuffle, #6
      %i(a e g m n n).shuffle, #7
      %i(a f i r s y).shuffle, #8
      %i(b j k q x z).shuffle, #9
      %i(c c e n s t).shuffle, #10
      %i(c e i i l t).shuffle, #11
      %i(c e i l p t).shuffle, #12
      %i(c e i p s t).shuffle, #13
      %i(d d h n o t).shuffle, #14
      %i(d h h l o r).shuffle, #15
      %i(d h l n o r).shuffle, #16
      %i(d h l n o r).shuffle, #17
      %i(e i i i t t).shuffle, #18
      %i(e m o t t t).shuffle, #19
      %i(f i p r s y).shuffle, #21
      %i(g o r r v w).shuffle, #22
      %i(i p r r r y).shuffle, #23
      %i(n o o t u w).shuffle, #24
      %i(o o o t t u).shuffle, #25
    ].shuffle
  end
end

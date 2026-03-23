def valid_card_number?(card)
  !!(card =~ /\A(34|37)(\d{13}|\d{2}-\d{6}-\d{5}|\d{2} \d{6} \d{5})\z/)
end


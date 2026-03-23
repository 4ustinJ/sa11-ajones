require_relative '../lib/card_number_validator'

RSpec.describe 'Card Validator' do
  it 'accepts valid no-separator format' do
    expect(valid_card_number?("341234567890123")).to be true
    expect(valid_card_number?("371111111111111")).to be true
  end

  it 'accepts valid dash-separated format' do
    expect(valid_card_number?("3412-345678-90123")).to be true
    expect(valid_card_number?("3712-999999-12345")).to be true
  end

  it 'accepts valid space-separated format' do
    expect(valid_card_number?("3412 345678 90123")).to be true
    expect(valid_card_number?("3712 999999 12345")).to be true
  end

  it 'rejects wrong prefix' do
    expect(valid_card_number?("441234567890123")).to be false
    expect(valid_card_number?("551234567890123")).to be false
  end

  it 'rejects mixed separators' do
    expect(valid_card_number?("3412-345678 90123")).to be false
    expect(valid_card_number?("3412 345678-90123")).to be false
  end

  it 'rejects wrong digit grouping' do
    expect(valid_card_number?("3412-3456-7890-123")).to be false
    expect(valid_card_number?("341-2345678-90123")).to be false
  end

  it 'rejects wrong number of digits' do
    expect(valid_card_number?("34123456789012")).to be false
    expect(valid_card_number?("3412345678901234")).to be false
  end

  it 'rejects invalid characters' do
    expect(valid_card_number?("34ab34567890123")).to be false
    expect(valid_card_number?("3412/345678/90123")).to be false
    expect(valid_card_number?("3412.345678.90123")).to be false
  end

  it 'rejects leading and trailing whitespace' do
    expect(valid_card_number?(" 341234567890123")).to be false
    expect(valid_card_number?("341234567890123 ")).to be false
  end

  it 'rejects edge cases' do
    expect(valid_card_number?("")).to be false
    expect(valid_card_number?(nil)).to be false
  end

  it 'rejects partial matches inside text' do
    expect(valid_card_number?("card 341234567890123")).to be false
    expect(valid_card_number?("341234567890123 text")).to be false
  end
end

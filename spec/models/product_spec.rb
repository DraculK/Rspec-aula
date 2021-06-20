require 'rails_helper'

RSpec.describe Product, type: :model do
    let(:categoria) { create(:category) }
  context 'check name' do 
    it 'should be ok' do 
        produto = build(:product, category_id: categoria.id)
        expect(produto).to be_valid
    end

    it 'when the name is nil' do 
        produto = build(:product, name:'', category_id: categoria.id)
        expect(produto).to_not be_valid
    end

    it 'when the name has less than 3 characters' do 
        produto = build(:product, name:'oi', category_id: categoria.id)
        expect(produto).to be_invalid
    end
  end

  context 'check description' do 
    it 'when description is nil' do 
        produto = build(:product, description:'', category_id: categoria.id)
        expect(produto).to be_invalid
    end

    it 'when description < 10' do 
        produto = build(:product, description:'123456789', category_id: categoria.id)
        expect(produto).to be_invalid
    end
  end

  context 'check price' do 
    it 'when the price is not a number' do 
        produto = build(:product, price:'olá', category_id: categoria.id)
        expect(produto).to be_invalid
    end
  end

  context 'check category' do 

  end
end

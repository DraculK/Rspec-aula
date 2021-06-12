require 'rails_helper'

RSpec.describe "Api::V1::Products", type: :request do
    let(:categoria) {create(:category)}
  context 'GET /index' do
    it 'should render all products' do 
        get '/api/v1/products/index'
        expect(response).to have_http_status(:ok)
    end
  end

  context "POST /create" do 
    let(:produto) do 
        {name:'produto', description:'apenas um produto', price: 15.0, category_id:categoria.id}
    end

    it 'with valid params' do 
        post '/api/v1/products/create', params: {product: produto}
        expect(response).to have_http_status(:created)
    end

    it 'with invalid params' do
        produto = {name:''}
        post '/api/v1/products/create', params: {product: produto}
        expect(response).to have_http_status(:bad_request)
    end
  end

  context "GET /show" do
    it 'with existing product' do 
        produto = create(:product, category_id:categoria.id)
        get "/api/v1/products/show/#{produto.id}"
        expect(response).to have_http_status(:ok)
    end

    it 'with non existing product' do 
        get "/api/v1/products/show/2"
        expect(response).to have_http_status(:bad_request)
    end
  end

  context "PUT /update" do 
    let(:produto) {create(:product, category_id: categoria.id)}
    atualizado = {name:'suco de manga'}

    it 'should update info' do 
        put "/api/v1/products/update/#{produto.id}", params: {product: atualizado}
        produto.reload
        expect(response).to have_http_status(:ok)
        expect(produto.name).to eq(atualizado[:name])
    end

    it 'should not update info' do 
        put "/api/v1/products/update/2", params: {product: atualizado}
        produto.reload
        expect(response).to have_http_status(:bad_request)
    end
  end

  context "DELETE /delete" do 
    let(:produto) {create(:product, category_id: categoria.id)}
    it 'should delete' do 
        delete "/api/v1/products/delete/#{produto.id}"
        expect(response).to have_http_status(:ok)
    end

    it 'should not delete' do 
        produto.destroy!
        delete "/api/v1/products/delete/#{produto.id}"
        expect(response).to have_http_status(:bad_request)
    end
  end
end

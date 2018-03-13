require 'rails_helper'

describe 'Customers API' do
  it 'sends a list of customers' do
    create_list(:customer, 5)

    get "/api/v1/customers.json"

    expect(response).to be_success

    customers = JSON.parse(response.body)
    expect(customers.count).to eq(5)
  end

  it 'sends one customer by id' do
    create_list(:customer, 5)
    id = create(:customer).id

    get "/api/v1/customers/#{id}.json"

    expect(response).to be_success

    customer = JSON.parse(response.body)
    expect(customer["id"]).to eq(id)
  end

  it 'finds one customer by id parameter' do
    customer_1, customer_2, customer_3 = create_list(:customer, 3)

    get "/api/v1/customers/find?id=#{customer_2.id}"

    expect(response).to be_success

    customer = JSON.parse(response.body)
    expect(customer["id"]).to eq(customer_2.id)
  end

  it 'finds one customer by first_name parameter' do
    customer_1, customer_2, customer_3 = create_list(:customer, 3)

    get "/api/v1/customers/find?first_name=#{customer_2.first_name}"

    expect(response).to be_success

    customer = JSON.parse(response.body)
    expect(customer["id"]).to eq(customer_2.id)
  end

  it 'finds one customer by case insensitive first_name parameter' do
    customer_1, customer_2, customer_3 = create_list(:customer, 3)

    get "/api/v1/customers/find?first_name=jAnE"

    expect(response).to be_success

    customer = JSON.parse(response.body)
    expect(customer["id"]).to eq(customer_2.id)
  end

  it 'finds one customer by last_name parameter' do
    customer_1, customer_2, customer_3 = create_list(:customer, 3)

    get "/api/v1/customers/find?last_name=#{customer_2.last_name}"

    expect(response).to be_success

    customer = JSON.parse(response.body)
    expect(customer["id"]).to eq(customer_2.id)
  end

  it 'finds one customer by case insensitive last_name parameter' do
    customer_1, customer_2, customer_3 = create_list(:customer, 3)

    get "/api/v1/customers/find?last_name=#{customer_2.last_name.upcase}"

    expect(response).to be_success

    customer = JSON.parse(response.body)
    expect(customer["id"]).to eq(customer_2.id)
  end

  it 'finds one customer by created_at parameter' do
    created_at = "2017-03-12 14:53:59 UTC"
    customer_1, customer_2, customer_3 = create_list(:customer, 3)
    customer_4 = create(:customer, created_at: created_at)

    get "/api/v1/customers/find?created_at=#{created_at}"

    expect(response).to be_success

    customer = JSON.parse(response.body)
    expect(customer["id"]).to eq(customer_4.id)
  end
  it 'finds one customer by updated_at parameter' do
    updated_at = "2017-03-12 14:53:59 UTC"
    customer_1, customer_2, customer_3 = create_list(:customer, 3)
    customer_4 = create(:customer, updated_at: updated_at)

    get "/api/v1/customers/find?id=#{updated_at}"

    expect(response).to be_success

    customer = JSON.parse(response.body)
    expect(customer["id"]).to eq(customer_4.id)
  end
end

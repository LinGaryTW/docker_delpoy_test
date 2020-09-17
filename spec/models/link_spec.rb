require 'rails_helper'

RSpec.describe Link, type: :model do
  def find(args)
    ::Resolvers::LinksSearch.call(nil, args, nil)
  end

  # those helpers should be handled with something like factory_bot gem
  def create_admin
    Admin.create(name: "Test", email: 'test@example.com', password: '123456')
  end

  def create_link(**args)
    Link.create!(args.merge(admin: create_admin))
  end

  it 'filter option' do
    link1 = create_link description: 'test1', url: 'http://test1.com'
    link2 = create_link description: 'test2', url: 'http://test2.com'
    link3 = create_link description: 'test3', url: 'http://test3.com'
    link4 = create_link description: 'test4', url: 'http://test4.com'

    result = find(
      filter: {
        description_contains: 'test1',
        OR: [{
          url_contains: 'test2',
          OR: [{
            url_contains: 'test3'
          }]
        }, {
          description_contains: 'test2'
        }]
      }
    )

    expect(result.map(&:description).sort).to eq([link1, link2, link3].map(&:description).sort)
  end
end
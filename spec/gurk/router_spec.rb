require File.join(File.dirname(__FILE__), '/../', 'spec_helper')

include Rack::Test::Methods

describe Gurk::Router do

  before do
    @router = Gurk::Router.new
  end

  def app
    @router
  end

  it 'returns a valid instance' do
    expect(@router).to be_instance_of Gurk::Router
  end

  it 'returns a valid http_router instance' do
    expect(@router.http_router).to be_instance_of HttpRouter
  end

  it 'adds a page with a valid content' do
    page = Gurk::Page.new({name: 'about', path: '/about', locals: {title: 'lalala'}})

    @router.add page

    request "/about"

    expect(last_response.status).to eq(200)
  end

  it 'adds a page with a valid content with params' do

    page = Gurk::Page.new({name: 'about', path: '/pages/slug', locals: {title: 'lalala'}})

    @router.add page

    request '/pages/this-is-a-slug'

    expect(last_response.status).to eq(200)
  end
 
end

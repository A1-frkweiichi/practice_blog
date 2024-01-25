require 'rails_helper'

RSpec.describe Blog, type: :model do
  it 'is valid with a title' do
    blog = Blog.new(title: 'Sample Blog Title')
    expect(blog).to be_valid
  end

  it 'is invalid without a title' do
    blog = Blog.new(title: nil)
    expect(blog).not_to be_valid
  end
end

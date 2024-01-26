require 'rails_helper'

RSpec.describe 'Blog管理', type: :system do
  before do
    driven_by(:rack_test)
  end

  scenario 'Blogの新規作成時にtitleを入力しなかった場合にエラーが表示されること' do
    visit new_blog_path
    fill_in 'Title', with: ''
    click_button 'Create Blog'

    expect(page).to have_content("Title can't be blank")
  end

  scenario 'Blogの新規作成時にtitleを入力した場合はデータが保存され閲覧画面に遷移すること' do
    visit new_blog_path
    fill_in 'Title', with: 'Test Blog Title'
    expect {
      click_button 'Create Blog'
    }.to change(Blog, :count).by(1)

    expect(current_path).to eq blog_path(Blog.last)
    expect(page).to have_content 'Blog was successfully created.'
    expect(page).to have_content 'Test Blog Title'
  end
end

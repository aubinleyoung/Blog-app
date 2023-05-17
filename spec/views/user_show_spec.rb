require 'rails_helper'

RSpec.describe 'renders users Show Page', type: :feature do
  before(:each) do
    @user = User.create(name: 'John', photo: 'https://media.gettyimages.com/id/1278139568/nl/foto/studioportret-van-20-jaar-oude-vrouw.jpg?s=612x612&w=0&k=20&c=3Bd4Ot79Z1ZKoCwAl0qFQ9hoBrQTar4SqtPefHOBEkg=',
                        bio: 'Teacher from Congo.', post_counter: 4)

    Post.create(author: @user, title: 'Hello Fam', content: 'I have a gift for you')
    Post.create(author: @user, title: 'Hello people', content: 'Have a nice day')
    Post.create(author: @user, title: 'Hello Guys', content: 'May God bless you all')
    @post = Post.create(author: @user, title: 'Hello Team Rails', content: 'Welcome to our group project')

    visit user_path(id: @user.id)
  end

  it 'should display user name and bio' do
    expect(page).to have_content(@user.name)
    expect(page).to have_content(@user.bio)
  end

  it 'should render user profile photo' do
    expect(page).to have_css(
      "img[src='#{@user.photo}']", wait: 30
    )
  end

  it 'should displays static text' do
    expect(page).to have_content('Posts')
  end

  it 'Shows the User name' do
    expect(page).to have_content(@user1)
  end

  it 'shows number of user posts ' do
    expect(page).to have_content(@user.post_counter)
  end

  it 'it should render the view all user posts link' do
    expect(page).to have_link('See all posts')
  end

  it 'should render three recent posts' do
    expect(page).to have_content(@user.three_recent_posts[0].title)
    expect(page).to have_content(@user.three_recent_posts[1].title)
    expect(page).to have_content(@user.three_recent_posts[2].title)
    expect(page).to have_no_content(Post.where(author: @user))
  end

  it 'renders the user post index page' do
    click_link('See all posts')
    expect(page).to have_current_path(user_posts_path(@user))
  end
end

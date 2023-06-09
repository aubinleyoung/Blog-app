require 'rails_helper'

RSpec.describe Comment, type: :model do
  describe 'creation' do
    before :all do
      @user = User.create(name: 'John Doe', photo: 'https://picsum.photos/200/300', bio: 'I am John Doe')
      @post = Post.create(author_id: @user.id, title: 'My Post', content: 'This is my post')
      @comment = Comment.create(author_id: @user.id, post_id: @post.id, content: 'This is my comment')
    end

    it "content can't be blank" do
      expect(@comment).to be_valid
    end

    it "author_id can't be blank" do
      @comment.author_id = nil
      expect(@comment).to_not be_valid
    end

    it 'author_id must be an integer' do
      @comment.author_id = 'a'
      expect(@comment).to_not be_valid
    end

    it 'author_id must be greater than 0' do
      @comment.author_id = 0
      expect(@comment).to_not be_valid
    end

    it "post_id can't be blank" do
      @comment.post_id = nil
      expect(@comment).to_not be_valid
    end

    it 'post_id must be an integer' do
      @comment.post_id = 'a'
      expect(@comment).to_not be_valid
    end

    it 'post_id must be greater than 0' do
      @comment.post_id = -1
      expect(@comment).to_not be_valid
    end
  end
end

require 'rails_helper'

describe Post do
  describe '#create' do
    it "アイテムの名前、紹介文、画像があれば投稿できる" do
      post = build(:post)
      expect(post).to be_valid
    end

    it "アイテムの名前がないと投稿できない" do
      post = build(:post, name: "")
      post.valid?
      expect(post.errors[:name]).to include("can't be blank")
    end

    it "アイテムの名前が41文字以上だと投稿できない" do
      num = 'n' * 41
      post = build(:post, name: num)
      post.valid?
      expect(post.errors[:name]).to include("is too long (maximum is 40 characters)")
    end

    it "アイテムの紹介文がないと投稿できない" do
      post = build(:post, content: "")
      post.valid?
      expect(post.errors[:content]).to include("can't be blank")
    end

    it "アイテムの紹介文が301文字以上だと投稿できない" do
      num = 'n' * 301
      post = build(:post, content: num)
      post.valid?
      expect(post.errors[:content]).to include("is too long (maximum is 300 characters)")
    end

    it "アイテムの画像がないと投稿できない" do
      post = build(:post, image: "")
      post.valid?
      expect(post.errors[:image]).to include("can't be blank")
    end
  end
end

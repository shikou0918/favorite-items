require 'rails_helper'

describe Comment do
  describe '#create' do
    it "コメントができる" do
      comment = build(:comment)
      expect(comment).to be_valid
    end

    it "31文字以上はコメントできない" do
      num = 'n' * 31
      comment = build(:comment, text: num)
      comment.valid?
      expect(comment.errors[:text]).to include("is too long (maximum is 30 characters)")
    end

    it "user_idがないとコメントできない" do
      comment = build(:comment, user_id: "")
      comment.valid?
      expect(comment.errors[:user]).to include("must exist")
    end

    it "post_idがないとコメントできない" do
      comment = build(:comment, post_id: "")
      comment.valid?
      expect(comment.errors[:post]).to include("must exist")
    end
  end
end

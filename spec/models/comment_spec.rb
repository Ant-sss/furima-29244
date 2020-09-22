require 'rails_helper'

RSpec.describe Comment, type: :model do

  before do 
    @comment = FactoryBot.build(:comment)
  end

  describe "コメント" do
    it "コメント欄に入力されていれば、保存できること" do
      expect(@comment).to be_valid
    end
    it "コメント欄が空だと、保存できないこと" do
      @comment.text = ""
      @comment.valid?
      expect(@comment.errors.full_messages).to include("コメントを入力してください")
    end
  end

end

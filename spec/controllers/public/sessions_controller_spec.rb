require 'rails_helper'

RSpec.describe Public::SessionsController, "ログインに関するテスト", type: :controller do

  before do
    @request.env["devise.mapping"] = Devise.mappings[:user]
  end

  describe "ゲストログイン" do
    subject { post :guest_sign_in }

    context "ゲストユーザーが存在しない場合" do
      it "ゲストユーザーを作成する" do
        expect { subject }.to change(User, :count).by(1)
      end

      it "ゲストユーザーとしてログインする" do
        subject
        expect(controller.current_user.email).to eq('guest@example.com')
      end

      it "ルートパスにリダイレクトする" do
        subject
        expect(response).to redirect_to(root_path)
      end

      it "フラッシュメッセージが表示される" do
        subject
        expect(flash[:notice]).to eq("ゲストユーザーとしてログインしました。")
      end
    end

    context "ゲストユーザーが存在する場合" do
      let!(:guest_user) { User.guest }

      it "新しいゲストユーザーは作成されない" do
        expect { subject }.not_to change(User, :count)
      end

      it "ゲストユーザーとしてログインする" do
        subject
        expect(controller.current_user.id).to eq(guest_user.id)
      end

      it "ルートパスにリダイレクトする" do
        subject
        expect(response).to redirect_to(root_path)
      end

      it "フラッシュメッセージが表示される" do
        subject
        expect(flash[:notice]).to eq("ゲストユーザーとしてログインしました。")
      end
    end
  end
end

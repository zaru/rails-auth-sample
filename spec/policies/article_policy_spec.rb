require 'rails_helper'

RSpec.describe ArticlePolicy do
  subject { described_class }

  permissions :update?, :edit? do
    let(:admin_user) { create(:admin) }
    let(:normal_user) { create(:user) }
    let(:my_article) { Article.create(user_id: normal_user.id) }
    let(:other_article) { Article.create(user_id: create(:user)) }

    it { expect(subject).to permit(normal_user, my_article) }
    it { expect(subject).not_to permit(normal_user, other_article) }
    it { expect(subject).to permit(admin_user, my_article) }
    it { expect(subject).to permit(admin_user, other_article) }

  end
end
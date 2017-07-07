class WikiPolicy < ApplicationPolicy
  def destroy?
    wiki.user = current_user || user.role == 'admin'
  end

  class Scope
    attr_reader :user, :scope

    def initialize(user, scope)
      @user = user
      @scope = scope
    end

    def resolve
      wikis = []
      if user.nil?
        all_wikis = scope.all
        wikis = []
        all_wikis.each do |wiki|
          if !wiki.private
            wikis << wiki
          end
        end
      elsif user.role == 'admin'
        wikis = scope.all
      elsif user.role == 'premium'
        all_wikis = scope.all
        all_wikis.each do |wiki|
          if !wiki.private || wiki.user == user || wiki.users.include?(user)
            wikis << wiki
          end
        end
      else
        all_wikis = scope.all
        wikis = []
        all_wikis.each do |wiki|
          Rails.logger.info wiki.id
          if wiki.users.include?(user) || !wiki.private
            wikis << wiki
          end
        end
      end
      wikis
    end
  end
end

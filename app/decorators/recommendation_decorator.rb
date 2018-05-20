class RecommendationDecorator < Draper::Decorator
  delegate_all

  def recommender_postion_and_role
    role = recommender_role.upcase
    return role if recommender_company.blank?
    role + ' , ' + recommender_company
  end
end

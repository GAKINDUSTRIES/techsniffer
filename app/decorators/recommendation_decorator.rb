class RecommendationDecorator < Draper::Decorator
  delegate_all

  def display_avatar
    if recommender_avatar.present?
      h.image_tag(recommender_avatar, class: 'testimonials__avatar')
    else
      h.render partial: 'shared/avatar', locals: { initials: initials }
    end
  end

  def initials
    return if recommender_name.nil?
    recommender_name.split.map(&:first).join
  end

  def recommender_postion_and_role
    role = recommender_role.upcase
    return role if recommender_company.blank?
    role + ' , ' + recommender_company
  end
end

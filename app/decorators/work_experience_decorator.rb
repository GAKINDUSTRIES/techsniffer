class WorkExperienceDecorator < Draper::Decorator
  delegate_all

  def time_period
    end_datetime = end_at.present? ? end_at.strftime('%^B %Y'): 'PRESENT'
    "#{start_at.strftime('%^B %Y')} - #{end_datetime}"
  end
end

class AdminDecorator < Draper::Decorator
  decorates_association :work_experiences
  delegate_all

  def full_name
   ' ' + first_name + ' ' + last_name + '.'
  end
end

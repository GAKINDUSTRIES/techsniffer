class AdminDecorator < Draper::Decorator
  decorates_association :work_experiences
  decorates_association :recommendations
  delegate_all

  def full_name
    ' ' + first_name + ' ' + last_name + ','
  end

  def cups_of_coffe
    initial_amount = 1500
    amount_per_day = 2
    days_left = (Date.today - created_at.to_date).to_i
    initial_amount + amount_per_day * days_left
  end
end

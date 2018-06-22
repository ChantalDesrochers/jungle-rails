class UserMailer < ApplicationMailer
 default from: "no-reply@jungle.com"

def confirmation_email(email, order)
  @email = email
  @order = order
  mail(to: email, subject: "Your order id: #{@order.id}")
  end
end



class AdminMailer < ApplicationMailer
    default from: 'no-reply@monsite.fr'
    
    def confirmation_email_admin(admin, user)
      @admins = admin
      @user = user
      @admins.each do |admin|
      mail(to: admin.email, subject: 'Nouvelle commande!') 
      end
    end
end
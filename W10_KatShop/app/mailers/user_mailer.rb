class UserMailer < ApplicationMailer
        default from: 'no-reply@monsite.fr'
       
        def welcome_email(user)
          @user = user 
          @url  = 'http://katshop-thp.herokuapp.com/users/sign_in' 
          mail(to: @user.email, subject: 'Bienvenue sur E-boutique Chatons !') 
        end

        def confirmation_email(user)
          @user = user 
          @url  = 'http://katshop-thp.herokuapp.com/users/sign_in' 
          mail(to: @user.email, subject: "Confirmation de votre commande de l'e-boutique Katshop !") 
        end

      end


class SitePropsController < ApplicationController
  def index
    sleep(0.5)
    render json: { title: 'Érdi Evangélikus Egyházközség', subtitle: 'De nekem olyan jó Isten közelsége',
                   logged_in: current_user.present?,
                   full_name: current_user&.email }
  end
end

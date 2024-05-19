class Site::HomeController < SiteController
  def index
    flash.now[:success] = "Bem-vindo ao doHiring"
    respond_to do |format|
      format.html 
      format.turbo_stream 
    end
  end
end
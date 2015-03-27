class WordcloudController < ApplicationController

  def render_wordcloud
    # TODO: Limit to user scope. Need connectin to User to work
    @competences = Wordcloud.getAllUserComptences

    respond_to do |format|
      format.html { render html: @competences }
      format.json { render json: @competences }
    end
  end


end
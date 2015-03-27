class WordmapController < ApplicationController

  def render_wordcloud
    # TODO: Limit to user scope. Need connectin to User to work
    @competences = Wordmap.getAllUserComptences

    respond_to do |format|
      format.html { render html: @competences }
    end
  end


end
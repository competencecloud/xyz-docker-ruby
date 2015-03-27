class WordcloudController < ApplicationController

  def render_wordcloud
    # TODO: Limit to user scope. Need connectin to User to work
    @competences = Wordcloud.getAllUserComptences
    city_competences = Hash.new()

    json = JSON.parse(@competences)

    json.each do |user|
        puts user['office']
        if(!city_competences.has_key?(user['office']))
            city_competences[user['office']] = Hash.new()
        end

        user['competences'].each do |competence|
            if(!city_competences[user['office']].has_key?(competence['type']))
                city_competences[user['office']][competence['type']] = 1
            else
                city_competences[user['office']][competence['type']] += 1
            end
        end

    end

    # Create all cities

    # Filter on city

    respond_to do |format|
      format.html { render html: city_competences }
      format.json { render json: city_competences }
    end
  end

end
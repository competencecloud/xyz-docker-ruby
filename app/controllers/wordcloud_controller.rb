class WordcloudController < ApplicationController

  def render_wordcloud
    # TODO: Limit to user scope. Need connectin to User to work
    @competences = Wordcloud.getAllUserComptences
    city_competences = Hash.new()
    @tag_cloud_hash = Hash.new()

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

    city_competences.each do |city|
        maxOccurs = city[1].max_by{|k,v| v}[1]
        minOccurs = city[1].min_by{|k,v| v}[1]
        
        minFontSize = 5
        maxFontSize = 100

        weight = (city[1].count-minOccurs).to_f/(maxOccurs-minOccurs)
        size = minFontSize + ((maxFontSize-minFontSize)*weight).round
        @tag_cloud_hash[city[0]] = size if size > 7

    end

    byebug

    respond_to do |format|
      format.html { render html: city_competences }
      format.json { render json: city_competences }
    end
  end

end

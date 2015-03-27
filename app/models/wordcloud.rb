require 'net/http'

class Wordcloud

    def initialize

    end

    def self.getAllUserComptences
        #@userCompetences = Net::HTTP.get(URI.parse('http://www.site.com/comptetences'))
        return File.read(Rails.public_path.to_s+"/dummycompetences.json")
    end

    def createCompetenceHashPerOffice(competences)
        
    end

    def getWordclouds

    end

end
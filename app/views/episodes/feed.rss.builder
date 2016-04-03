#encoding: UTF-8

xml.instruct! :xml, :version => "1.0"
xml.rss "xmlns:itunes" => "http://www.itunes.com/dtds/podcast-1.0.dtd",  "xmlns:media" => "http://search.yahoo.com/mrss/",  :version => "2.0" do
	xml.channel do
	    xml.title "Sounds like SOAS"
	    xml.link "http://www.soundslikesoas.org/"
	    xml.description "Podcasts from the MA Course Digital & Traditional Broadcasting Communication"
	    xml.itunes :author, "Sounds like SOAS"
	    xml.itunes :category, :text => 'Education' do
      		xml.itunes :category, :text => 'Higher Education'
   		end
	    xml.itunes :email, "diego.mosquera.soto@gmail.com"
	    xml.language "en-us"
	    xml.image "http://www.soundslikesoas.org/assets/Soundslikesoasitunes-art-work-0c5114ffe920f5643adc822f46dc4b8bd9c6a520d797d20fa2f1eba7b9c055ff.jpg"
	    xml.itunes :image, "http://www.soundslikesoas.org/assets/Soundslikesoasitunes-art-work-0c5114ffe920f5643adc822f46dc4b8bd9c6a520d797d20fa2f1eba7b9c055ff.jpg"
	    xml.pubDate @episodes.first.created_at.to_s(:rfc822)
	    xml.lastBuildDate @episodes.last.updated_at.to_s(:rfc822)
	    xml.copyright "CC #{Date.today.year}"
	    xml.webMaster "diego.mosquera.soto@gmail.com"
	    xml.itunes :keywords, "SOAS podcast University of London"
	    xml.itunes :explicit, "Yes"
	    for episode in @episodes
		    xml.item do
		        if episode.title
		          xml.title episode.title
		        else
		          xml.title ""
		    	end
		    	xml.author "Sounds Like SOAS"
		    	xml.itunes :author, "Sounds like SOAS"
			    xml.description episode.description
			    xml.itunes :summary, episode.description
			    xml.itunes :keywords, "SOAS podcast University of London"
			    xml.enclosure :url => "http://s3.amazonaws.com/dtbc-soas/episodes/mp3s/000/000/00" + episode.id.to_s + "/original/" + episode.mp3_file_name.to_s,
			    	:type => episode.mp3_content_type,
			    	:length => episode.mp3_file_size.to_s
			    xml.source :url => "http://www.soundslikesoas.org/podcasts/" + episode.podcast_id.to_s + "/episodes/" + episode.id.to_s
			    xml.pubDate episode.created_at.to_s(:rfc822)
			    xml.itunes :subtitle, truncate(episode.description, :length => 150)
			    xml.link "http://www.soundslikesoas.org/podcasts/" + episode.podcast_id.to_s + "/episodes/" + episode.id.to_s
			    xml.guid "http://s3.amazonaws.com/dtbc-soas/episodes/mp3s/000/000/00" + episode.id.to_s + "/original/" + episode.mp3_file_name.to_s    
		    end
		end
	end   
end

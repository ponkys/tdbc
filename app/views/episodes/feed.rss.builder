#encoding: UTF-8

xml.instruct! :xml, :version => "1.0"
xml.rss :version => "2.0" do
	xml.channel do
	    xml.title "Digital and Traditional Broadcasting Communication"
	    xml.description "Podcasts from the MA Course Digital & Traditional Broadcasting Communication"
	    xml.link "https://thawing-tor-3074.herokuapp.com/"
	    xml.language "en"
	    xml.copyright "CC"

	    for episode in @episodes
		    xml.item do
		        if episode.title
		          xml.title episode.title
		        else
		          xml.title ""
		    	end
			    xml.description episode.description
			    xml.pubDate episode.created_at.to_s(:rfc822)
			    xml.link "https://thawing-tor-3074.herokuapp.com/" + "podcasts/" + episode.podcast_id.to_s + "/episodes/" + episode.id.to_s
			    xml.guid "http://s3.amazonaws.com/dtbc-soas/episodes/mp3s/000/000/00" + episode.id.to_s + "/original/" + episode.mp3_file_name
			    xml.enclosure do
			    	xml.url "http://s3.amazonaws.com/dtbc-soas/episodes/mp3s/000/000/00" + episode.id.to_s + "/original/" + episode.mp3_file_name
			    	xml.type episode.mp3_content_type
			    	xml.size episode.mp3_file_size.to_s
			    end
		    end
		end
	end   
end



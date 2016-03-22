#encoding: UTF-8

xml.instruct! :xml, :version => "1.0"
xml.rss :version => "2.0" do
	xml.channel do
	    xml.title "Sounds like SOAS"
	    xml.link "https://thawing-tor-3074.herokuapp.com/"
	    xml.description "Podcasts from the MA Course Digital & Traditional Broadcasting Communication"
	    xml.itunes :author, "Sounds like SOAS"
	    xml.itunes :email, "diego.mosquera.soto@gmail.com"
	    xml.language "en-us"
	    xml.copyright "CC"
	    xml.webMaster "diego.mosquera.soto@gmail.com"
	    xml.itunes :keywords, "SOAS podcast University of London"
	    xml.itunes :explicit, "Explicit"
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
			    xml.itunes :keywords, "SOAS podcast University of London"
			    xml.enclosure :url => "http://s3.amazonaws.com/dtbc-soas/episodes/mp3s/000/000/00" + episode.id.to_s + "/original/" + episode.mp3_file_name.to_s,
			    	:type => episode.mp3_content_type,
			    	:length => episode.mp3_file_size.to_s
			    xml.source :url => "http://thawing-tor-3074.herokuapp.com/podcasts/" + episode.podcast_id.to_s + "/episodes/" + episode.id.to_s
			    xml.pubDate episode.created_at.to_s(:rfc822)
			    xml.link "http://thawing-tor-3074.herokuapp.com/podcasts/" + episode.podcast_id.to_s + "/episodes/" + episode.id.to_s
			    xml.guid "http://s3.amazonaws.com/dtbc-soas/episodes/mp3s/000/000/00" + episode.id.to_s + "/original/" + episode.mp3_file_name.to_s    
		    end
		end
	end   
end

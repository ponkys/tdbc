#encoding: UTF-8

xml.instruct! :xml, :version => "1.0"
xml.rss :version => "2.0" do
	xml.channel do
	    xml.title "Digital & Traditional Broadcasting Communication"
	    xml.author "SOAS, University of London. | Prof. Caspar Melville"
	    xml.description "Podcasts from the MA Course Digital & Traditional Broadcasting Communication"
	    xml.link "https://thawing-tor-3074.herokuapp.com/"
	    xml.language "en"

	    for episode in @episodes
		    xml.item do
		        if episode.title
		          xml.title episode.title
		        else
		          xml.title ""
		    	end
		    xml.description episode.description
		    xml.pubDate episode.created_at.to_s(:rfc822)
		    xml.mp3_file_name episode.mp3_file_name
		    end
		end
	end   
end

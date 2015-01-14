xml.instruct!
xml.opml version: '1.1' do
  xml.head do
    xml.title @site_title
    xml.dateModified Time.now.to_s( :rfc822 )
    xml.ownerName 'You'
    xml.ownerEmail 'you@example.com'
  end
  xml.body do
    @feeds.each do |feed|
      xml.outline type: 'rss',
                  text: feed.title,
                  xmlUrl: feed.feed_url,
                  name: feed.title
    end
  end
end

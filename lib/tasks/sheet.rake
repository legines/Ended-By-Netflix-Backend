require 'open-uri'
require 'bundler'
Bundler.require

ALL_URLS = ['Drama', 'Comedy', 'Miniseries', 'Adult Animation', 'Anime', 'Kids And Family', 'Docuseries', 'Reality', 'Variety']
namespace :import do
    desc "Get Show Data"
    task shows: :environment do
        session = GoogleDrive::Session.from_service_account_key("client_secrets.json")
        spreadsheet = session.spreadsheet_by_title("Ended")
        ALL_URLS.each do |url|
            worksheet = spreadsheet.worksheet_by_title(url)
            next unless worksheet
            worksheet.rows.drop(1).each do |row|
                next if Show.find_by(title: row[0])
                show = Show.new
                show.title = row[0]
                show.genre =  url
                show.subgenre = row[1]
                show.description = row[7]
                show.canceled_description = row[8]
                show.premiere = row[2]
                show.finale = row[3]
                show.seasons = row[4]
                show.runtime = row[5]
                show.canceled = row[6].to_i
                OpenURI::Buffer.send :remove_const, 'StringMax' if OpenURI::Buffer.const_defined?('StringMax')
                OpenURI::Buffer.const_set 'StringMax', 0
                downloaded_image = URI.open(URI(row[9]).to_s)
                show.artwork.attach(io: downloaded_image, filename: "artwork.jpg")
                show.save
            end
        end
    end

    desc "Update Show Data"
    task update: :environment do
        session = GoogleDrive::Session.from_service_account_key("client_secrets.json")
        spreadsheet = session.spreadsheet_by_title("Ended")
        ALL_URLS.each do |url|
            worksheet = spreadsheet.worksheet_by_title(url)
            next unless worksheet
            worksheet.rows.drop(1).each do |row|
                show = Show.find_by(title: row[0])
                next if !show || row[11] == ''
                show.update(title: row[0],
                            genre:  url,
                            subgenre: row[1],
                            description: row[7],
                            canceled_description: row[8],
                            premiere: row[2],
                            finale: row[3],
                            seasons: row[4],
                            runtime: row[5],
                            canceled: row[6].to_i)
                show.save
            end
        end
    end
end
class Show < ApplicationRecord
    include Rails.application.routes.url_helpers
    has_one_attached :artwork
    enum canceled: %i[canceled ended undetermined]

    def as_json(options = {})
        {
            id: id,
            title: title,
            genre: genre,
            subgenre: subgenre,
            description: description,
            canceled_description: canceled_description,
            premiere: premiere.strftime("%m/%d/%Y"),
            finale: finale&.strftime("%m/%d/%Y"),
            seasons: seasons,
            runtime: runtime,
            canceled: canceled,
            artwork: image_url
        }
    end

    def as_simple_json
        {
            id: id,
            title: title
        }
    end

    def image_url
        return unless artwork.attached?

        image_url = "http://localhost:3000/#{rails_blob_path(artwork, disposition: 'attachment', only_path: true)}"
        image_url
    end
end

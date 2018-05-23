class RemoteFile
  def initialize(url)
    @url = url
  end

  def download
    ActionDispatch::Http::UploadedFile.new(tempfile: open(@url), filename: filename, type: mime_type)
  end

  private

  def filename
    File.basename(URI.parse(@url).path)
  end

  def mime_type
    MIME::Types.type_for(@url).first.content_type
  end
end

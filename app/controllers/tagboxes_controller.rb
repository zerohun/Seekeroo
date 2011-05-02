class TagboxesController < ApplicationController
  def new
    @tagbox = Tagbox.new
    @tagbox.subtitles.build
  end
end

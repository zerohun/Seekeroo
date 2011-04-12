require "spec_helper"

describe SubtitlesController do
  describe "routing" do

    it "recognizes and generates #index" do
      { :get => "/subtitles" }.should route_to(:controller => "subtitles", :action => "index")
    end

    it "recognizes and generates #new" do
      { :get => "/subtitles/new" }.should route_to(:controller => "subtitles", :action => "new")
    end

    it "recognizes and generates #show" do
      { :get => "/subtitles/1" }.should route_to(:controller => "subtitles", :action => "show", :id => "1")
    end

    it "recognizes and generates #edit" do
      { :get => "/subtitles/1/edit" }.should route_to(:controller => "subtitles", :action => "edit", :id => "1")
    end

    it "recognizes and generates #create" do
      { :post => "/subtitles" }.should route_to(:controller => "subtitles", :action => "create")
    end

    it "recognizes and generates #update" do
      { :put => "/subtitles/1" }.should route_to(:controller => "subtitles", :action => "update", :id => "1")
    end

    it "recognizes and generates #destroy" do
      { :delete => "/subtitles/1" }.should route_to(:controller => "subtitles", :action => "destroy", :id => "1")
    end

  end
end

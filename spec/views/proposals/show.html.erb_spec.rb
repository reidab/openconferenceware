require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/proposals/show.html.erb" do
  before(:each) do
    @controller.stub!(:can_edit?).and_return(false)
    @controller.stub!(:schedule_visible?).and_return(true)
    @users = []
    @users.stub!(:by_name).and_return([])
    #@event = stub_model(Event, :id => 1, :slug => "current", :title => "Event 1", :proposal_status_published => false)
    @event = stub_current_event!
    @track = stub_model(Track, :id => 1, :title => "Track 1", :event => @event)
    @proposal = stub_model(Proposal, :id => 1, :status => "proposed", :title => "Proposal 1", :event => @event, :track => @track, :users => @users)

    assigns[:event]  = @event
    assigns[:proposal] = @proposal
    assigns[:kind] = :proposal
  end
  
  %w[accepted confirmed rejected junk].each do |status|
    it "should not show the status for #{status} proposals if statuses are not published" do
      @event.proposal_status_published = false
      @proposal.status = status

      render "/proposals/show.html.erb"
      response.should_not have_selector("div.proposal-status #{status}")
    end
  end
  
  it "should show the proposal status for a confirmed proposal if statuses are published" do
    @event.proposal_status_published = true
    @proposal.status = 'confirmed'

    render "/proposals/show.html.erb"
    response.should have_selector("div.proposal-status")
  end
  
  %w[accepted rejected junk].each do |status|
    it "should should not show the status for #{status} proposals even if statuses are published" do
      @event.proposal_status_published = true
      @proposal.status = status

      render "/proposals/show.html.erb"
      response.should_not have_selector("div.proposal-status #{status}")
    end
  end
end


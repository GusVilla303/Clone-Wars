class FranchiseInfo
  attr_reader :title, :description

  def initialize
    @title ||= default['title']
    @description ||= default['intro']
  end

  default = {'title' => 'Franchise Info', 'intro' => 'Backcountry Delicatessen’s
     plan of growth is to choose select locations that connect with our unique
     brand and philosophy. Think your community could be a good fit for a
     Backcountry Delicatessen? Well, we’re interested in talking with you.',
     'content' => ['Before we do, here’s a few of our company’s primary values:'
       , 'Providing a fresh concept with unique and great tasting fare',
       'Sourcing the highest quality/ freshest ingredients',
       'Supporting franchisees around the clock',
       'Promoting an active and healthy lifestyle-culture',
       'Bringing the mountain lifestyle to your neighborhood',
       'Creating strong community presence-involvement-commitment',
       'Bringing value to community business infrastructure',
       'Being passionate about who and what we are',
       'Bringing strong brand loyalty/following',
       'Rewarding cost structure'], 'outro' => 'Contact us by clicking the
       button in the right sidebar to fill out a Franchise Inquiry form.',
       'closing' => 'Let’s start the conversation.'}


end

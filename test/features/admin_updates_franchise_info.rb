require_relative 'feature_test_helper'
#As a [user]
#When I [visit this page]
#I expect to see [the following]

class AdminUpdatesFranchiseInfo < FeatureTest
  def test_a_user_can_see_the_franchise_info_page
    visit '/lib/views/admin_franchise_info.erb'
    assert_equal 200, page.status_code
  end

  def test_it_finds_title
    skip
  visit '/lib/views/admin_franchise_info.erb'
  fill_in('Title')
  end
end

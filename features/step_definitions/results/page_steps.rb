Then (/^I see the (.*) page$/) do |result|

  case result
    when 'no access'
      title = @app.no_access.title.to_s
      expect(title).to eq("Springer Nature")
      expect(@app.no_access).to have_message
      # Value checks
      current_page = @app.no_access.title
      puts "No Access: " + current_page
    when 'login page'
      title = @app.no_access.title.to_s
      expect(title).to eq("Springer Nature")
      expect(@app.login).to have_login_button
      current_page = @app.login.title
      puts "Login Page: " + current_page
    when 'rejection breakdown'
      title = @app.rejection_list.title.to_s
      if title =~ /All BioMed Central/i
        expect(title).to eq("Springer Nature Rejection Tracker for BioMed Central : All BioMed Central journals")
        expect(@app.rejection_list).to have_rejected_from_heading
        expect(@app.rejection_list).to have_title_heading
        expect(@app.rejection_list).to have_rejected_heading
        expect(@app.rejection_list).to have_authors_heading
        expect(@app.rejection_list).to have_published_title_heading
        expect(@app.rejection_list.rejection_list_title.text).to include($first_brand_link_text)
        expect(@app.rejection_list.results_table_first_column.size).to eq($first_brand_link_count)
      elsif title =~ /All Nature/i
        expect(title).to eq("Springer Nature Rejection Tracker for Nature : All Nature journals")
        expect(@app.rejection_list).to have_rejected_from_heading
        expect(@app.rejection_list).to have_title_heading
        expect(@app.rejection_list).to have_rejected_heading
        expect(@app.rejection_list).to have_authors_heading
        expect(@app.rejection_list).to have_published_title_heading
      elsif title =~ /All Springer/i
        expect(title).to eq("Springer Nature Rejection Tracker for Springer : All Springer journals")
        expect(@app.rejection_list).to have_rejected_from_heading
        expect(@app.rejection_list).to have_title_heading
        expect(@app.rejection_list).to have_rejected_heading
        expect(@app.rejection_list).to have_authors_heading
        expect(@app.rejection_list).to have_published_title_heading
      end
      current_page = @app.rejection_list.title
      puts "Rejection Breakdown: " + current_page
  end
end
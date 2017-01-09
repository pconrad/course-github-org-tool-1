module Mocktokit
  module OctokitHelpers
    def octokit_emails_mock(emails=nil)
      emails ||= [
        {:email => 'primary@umail.ucsb.edu', :primary => true, :verified => true},
        {:email => 'good1@umail.ucsb.edu', :primary => false, :verified => true},
        {:email => 'good2@umail.ucsb.edu', :primary => false, :verified => true},
        {:email => 'bad@umail.ucsb.edu', :primary => false, :verified => false}
      ]
      allow_any_instance_of(Octokit::Client).to receive(:emails).and_return(emails)
    end

    def octokit_org_membership_mock(org_name, state='active', role='member', login='testuser')
      allow_any_instance_of(Octokit::Client).to receive(:org_membership).and_return({
          state: state, role: role,
          user: {login: 'testuser'},
          organization: {login: org_name}
      })
    end
  end
end

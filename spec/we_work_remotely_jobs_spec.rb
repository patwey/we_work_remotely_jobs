require 'spec_helper'

describe WeWorkRemotelyJobs do
  let(:service) { WeWorkRemotelyJobs }

  it 'has a version number' do
    expect(WeWorkRemotelyJobs::VERSION).not_to be nil
  end

  describe '.pull_company_name' do
    it 'pulls a company from a title' do
      title = "Basecamp Networks: Computer Vision Engineer"
      company_name = service.pull_company_name(title)

      expect(company_name).to eq('Basecamp Networks')
    end

    it 'handles unmatching pattern with an empty string' do
      title = "Basecamp Networks Computer Vision Engineer"
      company_name = service.pull_company_name(title)

      expect(company_name).to eq('')
    end
  end

  describe 'parsing the summary' do
    let(:summary) { "\n\n\n" +
                    "Headquarters: Denver, CO URL: example.com\n\n\n" +
                    "The job description\n\n\n" +
                    "To Apply: Things to do.\n" }
    let(:invalid_summary) { "\n\n\n This doesn't match \n" }

    describe '.pull_description' do
      it 'pulls a description from a summary' do
        description = service.pull_description(summary)

        expect(description).to eq('The job description')
      end

      it 'handles unmatching pattern with an empty string' do
        description = service.pull_description(invalid_summary)

        expect(description).to eq('')
      end
    end

    describe '.pull_location' do
      it 'pulls a location from a summary' do
        location = service.pull_location(summary)

        expect(location).to eq('Denver, CO')
      end

      it 'handles unmatching pattern with an empty string' do
        location = service.pull_location(invalid_summary)

        expect(location).to eq('')
      end
    end
  end

  describe '.pull_technologies' do
    let(:technologies) { ['python', 'go', 'ruby', 'elixir'] }

    it 'matches technologies listed in a description' do
      description = "A python found a ruby in the mine"
      raw_technologies = service.pull_technologies(description, technologies)

      expect(raw_technologies).to eq(['python', 'ruby'])
    end

    it 'is case insensitive' do
      description = "Python GO ruby eLiXiR"
      raw_technologies = service.pull_technologies(description, technologies)

      expect(raw_technologies).to eq(['python', 'go', 'ruby', 'elixir'])
    end

    it 'handles unmatching description with an empty array' do
      description = "Excel MSPaint Visual Basic"
      raw_technologies = service.pull_technologies(description, technologies)

      expect(raw_technologies).to eq([])
    end

    it 'does not match a word that starts with the name of a technology' do
      description = "got" # technologies include 'go'
      raw_technologies = service.pull_technologies(description, technologies)

      expect(raw_technologies).to eq([])
    end

    it 'does not match a word that ends with the name of a technology' do
      description = "lego" # technologies include 'go'
      raw_technologies = service.pull_technologies(description, technologies)

      expect(raw_technologies).to eq([])
    end
  end
end

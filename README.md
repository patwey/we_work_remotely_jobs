# WeWorkRemotelyJobs

Parses the WeWorkRemotely programming jobs RSS feed
On RubyGems: [https://rubygems.org/gems/we_work_remotely_jobs](https://rubygems.org/gems/we_work_remotely_jobs)

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'we_work_remotely_jobs'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install we_work_remotely_jobs

## Usage

For a list of the WeWorkRemotely jobs with a default set of technologies parsed out of their descriptions:
```ruby
we_work_remotely_jobs = WeWorkRemotelyJobs.scrape
```

Or, specifiy your own set of technologies to parse out of the descriptions:
```ruby
we_work_remotely_jobs = WeWorkRemotelyJobs.scrape(['elixir', 'java', 'lisp'])
```

Sample job:
```ruby
{ 
  :job=> {
    :title=>"Sample.io: Rails Programmer with Javascript Experience",                                                            :url=>"https://weworkremotely.com/jobs/1-rails-programmer-with-javascript-experience", 
    :location=>"Denver, CO", 
    :technologies=>["javascript", "ember", "angular", "rails"], 
    :description=>"Wow what a great job", 
    :remote=>true, 
    :posted_date=>2016-02-25 18:53:03 UTC
  }, 
  :company=> { 
    :name=>"Sample.io"
  }
}
```

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/patwey/we_work_remotely_jobs.

## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

require "stringex"

class Post < Thor
  desc "new", "create a new post"
  method_option :editor, :default => "atom"
  method_option :desc, :default => "no-description"
  method_option :cats, :default => "none"
  method_option :type, :aliases => "-t", :required => true

  def new(*title)

    title = title.join(" ")
    date = Time.now.strftime('%Y-%m-%d')
    filename = "_posts/#{date}-#{title.to_url}.markdown"


    if options.type == "abhyaas"
      options.cats = "[language, hindi,bhasa,abhyaas,excercise, transliteration]"
      options.desc = "hindi-abhyaas-sadgati"
    elsif options.type == "report"
      options.cats = "[akms, progress, report]"
      options.desc = "progress-report"
    else
      abort("\"#{options.type}\" is not a valid type!")
    end

    if File.exist?(filename)
      abort("#{filename} already exists!")
    end
    puts "Creating new post: #{filename}"
    open(filename, 'w') do |post|
      post.puts "---"
      post.puts "layout: post"
      post.puts "title: \"#{title.gsub(/&/,'&amp;')}\""
      post.puts "date: \"#{Time.now}\""
      post.puts "categories: \"#{options.cats}\""
      post.puts "description: \"#{options.desc}\""
      post.puts "---"
      if options.type == "abhyaas"
        post.puts "\n\n  "
        post.puts "From [Premchand's Sadgati](http://premchand004.blogspot.com/) (_Nijaat_{: style=\"color: gray\"})  "
        post.puts "Naye **shabd**:"
      end
    end

    system(options[:editor], filename)
  end
end

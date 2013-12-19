require 'bundler'
Bundler.require

Dir.glob('./lib/*.rb') do |model|
  require model
end

module Name
  class App < Sinatra::Application

    #routes
    get '/' do
      # @today = get_time
      @is_it = Holiday.new
      erb :index
    end

    get '/:holiday' do
      @is_it = Holiday.new
      if @is_it.send(params[:holiday]) == "Yes!"
        @image = params[:holiday]
      end
      erb :index
    end

    get '/:holiday/pretend' do
      @image = params[:holiday]
      @is_it = Holiday.new
      erb :index
    end

    helpers do
      def get_time
        Timezone::Configure.begin do |c|
          c.username = 'sranso'
        end

        location = request.location # gives location of request
        lat = location.latitude
        long = location.longitude

        timezone = Timezone::Zone.new(:latlon => [lat, long])
        timezone.time(Time.now)
      end
    end

  end
end

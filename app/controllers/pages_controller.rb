class PagesController < ApplicationController
    def home
    end
    
    def about
    end

    def old_home
        @test = 1..100
    end
end

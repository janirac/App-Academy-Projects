require "passenger"

class Flight
    def initialize(flight_number, capacity)
        @flight_number = flight_number
        @capacity = capacity
        @passengers = []
    end 

    def passengers
        @passengers
    end 

    def full?
        @passengers.length == @capacity ? true : false
    end 

    def board_passenger(passenger)
        if !self.full?
            if passenger.has_flight?(@flight_number)
                @passengers << passenger
            end 
        end  
    end 

    def list_passengers
        @passengers.map do |passenger|
            passenger.name
        end 
    end 

    def [](index)
        @passengers[index]
    end 

    def <<(passenger)
        self.board_passenger(passenger)
    end 
end

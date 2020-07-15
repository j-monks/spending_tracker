require_relative("../db/sql_runner")
require("pry-byebug")

class User
    
    attr_accessor :budget
    attr_reader :id

    def initialize(options)
        @id = options["id"].to_i if options["id"]
        @budget = options["budget"].to_f
    end

    def save()
        sql = "INSERT INTO users
        (
            budget
        )
        VALUES
        (
            $1
        )
        RETURNING id"
        values = [@budget]
        result = SqlRunner.run(sql, values)
        @id = result.first()["id"].to_i
    end

    def update()
        sql = "UPDATE users
        SET
        budget = $1
        WHERE id = $2"
        values = [@budget, @id]
        SqlRunner.run(sql, values)
      end
end
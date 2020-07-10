require_relative("../db/sql_runner")

class Category
    
    attr_accessor :name
    attr_reader :id

    def initialize(options)
        @id = options["id"].to_i if options["id"]
        @name = options["name"]
    end

    def save()
        sql = "INSERT INTO categories
        (
            name
        )
        VALUES
        (
            $1
        )
        RETURNING id"
        values = [@name]
        result = SqlRunner.run(sql, values)
        @id = result.first()["id"].to_i
    end

end
require_relative("../db/sql_runner")

class Category
    
    attr_accessor :name, :isdeleted
    attr_reader :id

    def initialize(options)
        @id = options["id"].to_i if options["id"]
        @name = options["name"]
        @isdeleted = options["isdeleted"]
    end

    def save()
        sql = "INSERT INTO categories
        (
            name, isdeleted
        )
        VALUES
        (
            $1, $2
        )
        RETURNING id"
        values = [@name, @isdeleted]
        result = SqlRunner.run(sql, values)
        @id = result.first()["id"].to_i
    end

    def self.all()
        sql = "SELECT * FROM categories
        WHERE isdeleted = 0"
        results = SqlRunner.run(sql)
        return results.map { |category| Category.new(category) }
    end

    def update()
        sql = "UPDATE categories
        SET
        (
            name, isdeleted 
        ) = 
        (
            $1, $2
        )
        WHERE id = $3"
        values = [@name, @isdeleted, @id]
        SqlRunner.run(sql, values)
      end
      
      def self.find(id)
        sql = "SELECT * FROM categories
        WHERE id = $1"
        values = [id]
        results = SqlRunner.run(sql, values)
        return Category.new(results.first)
      end

      def self.soft_delete(id)
       
      end

      def self.delete_all()
        sql = "DELETE FROM categories"
        SqlRunner.run(sql)
    end

end
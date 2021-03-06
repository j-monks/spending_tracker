require_relative("../db/sql_runner")

class Category
    
    attr_accessor :name, :isdeleted, :isactive
    attr_reader :id

    def initialize(options)
        @id = options["id"].to_i if options["id"]
        @name = options["name"]
        @isdeleted = 0
        @isactive = options["isactive"]
    end

    def save()
        sql = "INSERT INTO categories
        (
            name, isdeleted, isactive
        )
        VALUES
        (
            $1, $2, $3
        )
        RETURNING id"
        values = [@name, @isdeleted, @isactive = 1]
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
            name, isdeleted, isactive 
        ) = 
        (
            $1, $2, $3
        )
        WHERE id = $4"
        values = [@name, @isdeleted, @isactive, @id]
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
        category = Category.find(id)
        category.isdeleted = 1
        category.update()
      end

      def self.deactivate(id)
        category = Category.find(id)
        category.isactive = 0
        category.update()
      end

      def self.reactivate(id)
        category = Category.find(id)
        category.isactive = 1
        category.update()
      end

      def self.delete_all()
        sql = "DELETE FROM categories"
        SqlRunner.run(sql)
    end

end
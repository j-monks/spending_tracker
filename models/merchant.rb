require_relative("../db/sql_runner")

class Merchant
    
    attr_accessor :name, :isdeleted
    attr_reader :id

    def initialize(options)
        @id = options["id"].to_i if options["id"]
        @name = options["name"]
        @isdeleted = 0
    end

    def save()
        sql = "INSERT INTO merchants
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
        sql = "SELECT * FROM merchants"
        results = SqlRunner.run(sql)
        return results.map { |merchant| Merchant.new(merchant) }
    end
     
    def update()
        sql = "UPDATE merchants
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
        sql = "SELECT * FROM merchants
        WHERE id = $1"
        values = [id]
        results = SqlRunner.run(sql, values)
        return Merchant.new(results.first)
      end

      def self.soft_delete(id)
        merchant = Merchant.find(id)
        merchant.isdeleted = 1
        merchant.update()
      end

      def self.delete_all()
        sql = "DELETE FROM merchants"
        SqlRunner.run(sql)
    end

end
require_relative("../db/sql_runner")

class Merchant
    
    attr_accessor :name, :isdeleted, :isdeactivated
    attr_reader :id

    def initialize(options)
        @id = options["id"].to_i if options["id"]
        @name = options["name"]
        @isdeleted = 0
        @isdeactivated = options["isdeactivated"]
    end

    def save()
        sql = "INSERT INTO merchants
        (
            name, isdeleted, isdeactivated
        )
        VALUES
        (
            $1, $2, $3
        )
        RETURNING id"
        values = [@name, @isdeleted, @isdeactivated = 0]
        result = SqlRunner.run(sql, values)
        @id = result.first()["id"].to_i
    end

    def self.all()
        sql = "SELECT * FROM merchants
        WHERE isdeleted = 0"
        results = SqlRunner.run(sql)
        return results.map { |merchant| Merchant.new(merchant) }
    end
    
    # def self.is_active?

    def update()
        sql = "UPDATE merchants
        SET
        (
            name, isdeleted, isdeactivated
        ) = 
        (
            $1, $2, $3
        )
        WHERE id = $4"
        values = [@name, @isdeleted, @isdeactivated, @id]
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

      def self.deactivate(id)
        merchant = Merchant.find(id)
        merchant.isdeactivated = 1
        merchant.update()
      end

    #   def self.is_deactivated?(id)
    #     merchant = Merchant.find(id)
    #     if merchant.isdeactivated == 1 
    #         return true
    #     else 
    #         return false
    #     end
    #   end

      def self.delete_all()
        sql = "DELETE FROM merchants"
        SqlRunner.run(sql)
      end

end
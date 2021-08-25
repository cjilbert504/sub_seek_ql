require "sub_seek_ql/version"

module SubSeekQl
  # class Error < StandardError; end
  
  def self.last_n_records_by_foreign_key_association(foreign_key_column_name, limit)
    self.find_by_sql("SELECT * FROM #{self.downcase.to_s += "s"} AS p1 WHERE p1.id IN (SELECT id FROM #{self.downcase.to_s += "s"} AS p2 WHERE p2.#{foreign_key_column_name.to_s} = p1.#{foreign_key_column_name.to_s} LIMIT #{limit.to_s})")
  end
end

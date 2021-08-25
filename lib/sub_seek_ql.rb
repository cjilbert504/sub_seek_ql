require "sub_seek_ql/version"

module SubSeekQl
  # class Error < StandardError; end
  
  def self.last_n_records_by_foreign_key_association(klass, foreign_key_column_name, limit)
    klass = klass.constantize
    klass.find_by_sql("SELECT * FROM #{(klass.to_s + "s").downcase} AS p1 WHERE p1.id IN (SELECT id FROM #{(klass.to_s + "s").downcase} AS p2 WHERE p2.#{foreign_key_column_name.to_s} = p1.#{foreign_key_column_name.to_s} LIMIT #{limit.to_s}) ORDER BY p1.#{foreign_key_column_name.to_s}")
  end
end

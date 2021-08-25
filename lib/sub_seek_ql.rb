require "sub_seek_ql/version"

module SubSeekQl
  # class Error < StandardError; end
  
  def self.last_n_records_by_association(klass, association_column_name, limit)
    klass_const = klass.constantize
    klass_const.find_by_sql("SELECT * FROM #{(klass + "s").downcase} AS p1 WHERE p1.id IN (SELECT id FROM #{(klass + "s").downcase} AS p2 WHERE p2.#{association_column_name} = p1.#{association_column_name} LIMIT #{limit.to_s}) ORDER BY p1.#{association_column_name}")
  end
end

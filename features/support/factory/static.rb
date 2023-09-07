module Factory

    # Acesso a massa de dados estática.
    class Static

        # Faz o load do arquivo de dados.
        def self.load_file
            YAML.load_file(File.dirname(__FILE__) + "/static/#{ENVIRONMENT}.yml" )
        end

        # Recebe uma key e retorna um valor.
        def self.static_data data
            Static.load_file[data]
        end

        # Recebe duas keys e retorna um valor.
        def self.static_data_two_args data, data2
            Static.load_file[data][data2]
        end
    end
end

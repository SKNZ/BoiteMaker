package exporter is
    -- Enregistre un type d'exporteur
    procedure register_exporter(exporter : exporter_t);

    type exporter_t is
        record
        end record;
end exporter;
